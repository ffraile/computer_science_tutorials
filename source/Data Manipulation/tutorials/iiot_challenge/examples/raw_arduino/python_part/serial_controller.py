# ─────────────────────────────────────────────────────────
# Python: Serial CLI + Continuous CSV Logger
#  - Simple command-line interface to an Arduino over serial.
#  - Commands:
#    '0' = Handshake
#    '1' = Read uptime (ms)
#    '2' = Read Vcc (mV)
#    '3' = Read LED state (0/1)
#    '4' = Toggle LED
#    '5' = LED ON
#    '6' = LED OFF
#    'c' = continuous log to CSV (Ctrl+C to stop)
#    's' = set simulation mode
#    'q' = quit
#       - Logs: timestamp, uptime_ms, vcc_mv, rand, led
# Dependencies: pyserial
# ─────────────────────────────────────────────────────────
import serial
import time
import os
import csv
from datetime import datetime

# Set your serial port here (examples: 'COM7', '/dev/ttyACM0', '/dev/ttyUSB0')
PORT = None  # e.g., 'COM7' or '/dev/ttyACM0'
BAUD = 9600
TIMEOUT = 1.5  # seconds

def open_serial():
    if PORT is None:
        print("⚠️  Set PORT to your Arduino serial port (e.g., 'COM7' or '/dev/ttyACM0').")
        return None

    ser = serial.Serial(PORT, BAUD, timeout=TIMEOUT)
    time.sleep(1.8)             # allow auto-reset + banner
    ser.reset_input_buffer()     # drain startup text
    return ser


def send_cmd(ser, cmd_char):
    """Send single-char command; return one decoded line ('' on timeout)."""
    ser.write(cmd_char.encode("utf-8"))
    ser.flush()
    line = ser.readline()
    return line.decode("utf-8", errors="replace").strip()

def parse_metric(line, key):
    """Return value after 'KEY:' in 'KEY:VALUE' lines; else None."""
    prefix = key + ":"
    if line.startswith(prefix):
        return line[len(prefix):].strip() # Remove prefix and whitespaces
    return None

def read_metrics_once(ser, sim_mode=False):
    """
    Query Arduino for a set of built-in readings:
      '1' -> UPTIME_MS:<int>
      '2' -> VCC_mV:<int>
      '3' -> RAND:<int>
      '4' -> LED:<0|1>
    Returns a string to be written as a CSV row.
    """
    ts = datetime.now().isoformat(timespec="seconds")
    row = {"timestamp": ts, "uptime_ms": "", "vcc_mv": "", "led": ""}

    if sim_mode:
        # Simulated data
        uptime_ms = int(time.time() * 1000) % 1000000
        row["uptime_ms"] = uptime_ms
        vcc_mv = 5000 + (uptime_ms % 1000)  # Vcc varies slightly
        row["vcc_mv"] = vcc_mv
        led = uptime_ms // 1000 % 2          # LED toggles every second
        row["led"] = led
    else:
        # Uptime
        r = send_cmd(ser, '1')  # expect UPTIME_MS:<int>
        v = parse_metric(r, "UPTIME_MS")
        row["uptime_ms"] = v if v is not None else ""

        # Vcc
        r = send_cmd(ser, '2')  # expect VCC_mV:<int>
        v = parse_metric(r, "VCC_mV")
        row["vcc_mv"] = v if v is not None else ""


        # LED state
        r = send_cmd(ser, '4')  # expect LED:<0|1>
        v = parse_metric(r, "LED")
        row["led"] = v if v is not None else ""
    return row


def log_continuous(ser, out_path="arduino_log.csv", period=1.0, sim_mode=False):
    """
    Poll metrics every 'period' seconds and append to CSV.
    Stop with Ctrl+C.
    """
    fields = ["timestamp", "uptime_ms", "vcc_mv", "led"]
    # Ensure output directory exists
    if not os.path.exists(os.path.dirname(out_path)):
        with open(out_path, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=fields)
            writer.writeheader()
    print(f"📝 Logging to {out_path} every {period:.2f}s — press Ctrl+C to stop.")
    try:
        with open(out_path, "a+", encoding="utf-8") as f:
            while True:
                t0 = time.time()
                writer = csv.DictWriter(f, fieldnames=fields)
                row = read_metrics_once(ser, sim_mode=sim_mode)
                writer.writerow(row)
                f.flush()
                # Console status line
                print(row)

                # pacing delay:
                dt = time.time() - t0
                sleep_left = period - dt
                if sleep_left > 0:
                    time.sleep(sleep_left)
    except KeyboardInterrupt:
        print("\n⏹️  Logging stopped.")

def main():
    sim_mode = False  # By default, simulation mode is off
    arduino = open_serial()
    if arduino is None:
        sim_mode_on = input("Arduino not available, press Enter to exit or 's' to enable simulation mode: ").strip().lower() == 's'
        if sim_mode_on:
            sim_mode = True
            print("⚠️  Simulation mode enabled. No Arduino connected.")
        else:
            return
    else:
        print(f"✅ Connected to Arduino on {PORT} at {BAUD} baud.")

        # Optional: do a handshake
        hello = send_cmd(arduino, '0')   # expect ACK;...;UPTIME_MS=...
        print("Handshake:", hello or "(no reply)")

    print(r"""
 _      __    __
| | /| / /__ / /______  __ _  ___
| |/ |/ / -_) / __/ _ \/  ' \/ -_)
|__/|__/\__/_/\__/\___/_/_/_/\__/
Welcome to the Arduino control panel

Commands:
  0  Handshake
  1  Read uptime (ms)
  2  Read Vcc (mV)
  3  Read LED state (0/1)
  4  Toggle LED
  5  LED ON
  6  LED OFF
  c  Continuous log to CSV
  q  Quit
""")

    try:
        while True:
            cmd = input("Enter command [0-6/c/q]: ").strip().lower()

            if cmd not in ["0", "1", "2", "3", "4", "5", "6", "c", "q"]:
                print("Invalid command")
                continue

            if cmd == 'q':
                print("Bye!")
                break

            if cmd == 'c':
                # Ask filename + period (optional)
                path = input("CSV path [arduino_log.csv]: ").strip() or "arduino_log.csv"
                try:
                    period = float(input("Sampling period seconds [1.0]: ").strip() or "1.0")
                    period = max(0.1, period)  # clamp to safe lower bound
                except ValueError:
                    period = 1.0
                log_continuous(arduino, out_path=path, period=period, sim_mode=sim_mode)
                continue

            if sim_mode:
                print("→ (simulation mode: no reply)")
            else:
                reply = send_cmd(arduino, cmd)
                print("→", reply or "(no reply / timeout)")

    except KeyboardInterrupt:
        print("\nInterrupted. Bye!")
    finally:
        try:
            arduino.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
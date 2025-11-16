// ─────────────────────────────────────────────────────────
// Arduino: Minimal serial template (no external hardware)
// Commands:
// 0: Handshake
// 1: Uptime (millis)
// 2: Analog read A0 (floating pin ok)
// 3: Pseudo-random 0..1023
// 4: LED state (0/1)
// 5: LED toggle
// 6: LED on
// 7: LED off
// ─────────────────────────────────────────────────────────

const int PIN_LED = LED_BUILTIN;
char option = '\0';

// Read the supply voltage (Vcc) in millivolts using the internal 1.1V band-gap.
// Works on ATmega328P-based boards (UNO/Nano). No external wiring needed.
long readVcc() {
  // Select 1.1V band-gap as ADC input, Vcc as reference.
  ADMUX = _BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
  delay(2);                        // let the reference settle
  ADCSRA |= _BV(ADSC);             // start conversion
  while (ADCSRA & _BV(ADSC)) {}    // wait until done

  uint8_t low  = ADCL;
  uint8_t high = ADCH;
  uint16_t adc = (high << 8) | low;

  // Vcc (mV) ≈ 1.1V * 1023 * 1000 / adc
  return 1125300L / (long)adc;     // 1125300 ≈ 1.1 * 1023 * 1000
}


void setup() {
  Serial.begin(9600);
  pinMode(PIN_LED, OUTPUT);
  digitalWrite(PIN_LED, LOW);
  // Optional: small startup banner
  Serial.println(F("READY;VER=1;BAUD=9600"));
}

void loop() {
  if (Serial.available() > 0) {
    option = Serial.read();

    switch (option) {
      case '0': { // Handshake
        Serial.print(F("ACK;BOARD=ARDUINO;BAUD=9600;UPTIME_MS="));
        Serial.println(millis());
        break;
      }
      case '1': { // Uptime
        Serial.print(F("UPTIME_MS:"));
        Serial.println(millis());
        break;
      }
      case '2': { // Built-in reading: Vcc (mV) via 1.1V band-gap
        long mv = readVcc();
        if (mv > 0) {
            Serial.print(F("VCC_mV:"));
            Serial.println(mv);
        } else {
            Serial.println(F("VCC:UNSUPPORTED"));
        }
        break;
      }
      case '3': { // LED state
        int state = digitalRead(PIN_LED);
        Serial.print(F("LED:"));
        Serial.println(state ? 1 : 0);
        break;
      }
      case '4': { // LED toggle
        int state = !digitalRead(PIN_LED);
        digitalWrite(PIN_LED, state);
        Serial.print(F("LED:"));
        Serial.println(state ? 1 : 0);
        break;
      }
      case '5': { // LED ON
        digitalWrite(PIN_LED, HIGH);
        Serial.println(F("LED:1"));
        break;
      }
      case '6': { // LED OFF
        digitalWrite(PIN_LED, LOW);
        Serial.println(F("LED:0"));
        break;
      }
      default: {
        Serial.println(F("ERR Unknown"));
        break;
      }
    }
  }
}
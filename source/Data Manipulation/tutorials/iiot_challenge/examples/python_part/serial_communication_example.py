import serial
import time
import random

# Initialize the port variable.
# If you already know the serial port where the Arduino board is connected,
# you need to assign it to this variable, replacing None with the actual name of the port.
# For instance, if your Arduino board is connected to port COM7, you can use the line below
#port = 'COM7'

port = None

# Initialize serial communications. Set the baud rate to 96000 bps.
if port is not None:
    arduino = serial.Serial(port, 9600, timeout=1)

# Simulation mode
# Set the variable simulation_mode to True to simulate the connection to the device to test your Python part
# With this mode, you can run some basic tests to make sure your Python program works before you actually connect
# to Arduino.
simulation_mode = True

# Let's start only if we have initialize the port or if we are working on simulation mode.
if port is not None or simulation_mode:
    print(" _      __    __")
    print("| | /| / /__ / /______  __ _  ___")
    print("| |/ |/ / -_) / __/ _ \\/  ' \\/ -_)")
    print("|__/|__/\\__/_/\\__/\\___/_/_/_/\\__/")

    print("Welcome to the Arduino control panel")
    print("You can use the following commands:")
    print("1. Read humidity")
    print("2. Read temperature")
    print("3. Read humidity and temperature")
    print("4. Read soil moisture")
    print("5. read all in continuous mode")
    print("Press Ctrl+C to exit")
    while True:

        command = input("Enter command: ")
        if command in ['1', '2', '3', '4'] and not simulation_mode:
            signal = command.encode('utf-8') # Convert the command to a binary string
            arduino.write(signal) # Send the command to the device
            arduino.flush() # Wait until the command is sent
            raw_data = 'b' # Init as empty binary string
            while raw_data == 'b':
                raw_data = arduino.readline() # Read the data from the device
            print(raw_data) # Print the response from the device
        elif command == '5':
            print("Entering continuous mode. Press Ctrl+C to exit")
            while True:
                time.sleep(1) # Wait for 1 second
                # Let´s put the data in a dictionary.
                data_timestamp = time.strftime("%Y-%m-%d %H:%M:%S")

                if simulation_mode: # If we are in testing mode, we will simulate the data
                    data_humidity = random.randint(0, 100)
                    data_temperature = random.randint(0, 100)
                    data_soil_moisture = random.randint(0, 1000)
                else: # If we are not in testing mode, we will read the data from the device
                    # First send a signal to read humidity and temperature
                    signal = b'3'
                    arduino.write(signal) # Send the command to the device
                    arduino.flush() # Wait until the command is sent
                    raw_data = 'b'  # Init as empty binary string
                    while raw_data == 'b':
                        raw_data = arduino.readline()  # Read the data from the device

                    #Incoming data is in the format b'Humidity: 50.00 % Temperature: 23.00 \n'
                    # We need to split the string into a list of strings
                    raw_data = raw_data.decode('utf-8').strip().split(' ')
                    # Now we need to convert the strings to floats and add them to the dictionary
                    data_humidity = float(raw_data[1])
                    data_temperature = float(raw_data[4])
                    time.sleep(1) # Wait for 1 second
                    # Now send a signal to read soil moisture
                    signal = b'4'
                    arduino.write(signal) # Send the command to the device
                    arduino.flush() # Wait until the command is sent
                    raw_data = 'b'  # Init as empty binary string
                    while raw_data == 'b':
                        raw_data = arduino.readline()  # Read the data from the device
                    # Incoming data is in the format b'Soil Moisture: 350 \n'
                    # Decode the data and split it into a list of strings
                    raw_data = raw_data.decode('utf-8').strip().split(' ')
                    # Get the soil moisture value and store it in the dictionary
                    data_soil_moisture = float(raw_data[2])

                data = f'New measurement: timestamp= {data_timestamp}, humidity: {data_humidity}%, temperature: {data_temperature}, moisture: {data_soil_moisture}'
                print(data)
        else:
            print("Invalid command")
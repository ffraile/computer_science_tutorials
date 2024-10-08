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
    # Print welcome message.
    # Command interfaces can be really nice! let's welcome our user using some ASCII art
    print(" _      __    __")
    print("| | /| / /__ / /______  __ _  ___")
    print("| |/ |/ / -_) / __/ _ \\/  ' \\/ -_)")
    print("|__/|__/\\__/_/\\__/\\___/_/_/_/\\__/")
    print("Welcome to the Arduino control panel")

    # It is important that you provide the user with some basic instructions explaining
    # what each command actually does
    # In the template, we are going to support 3 commands, encoded as '1', '2', and '3',
    # but you can use as many commands as you want in your code.

    print("You can use the following commands:")
    print("1. Do something with Arduino")
    print("2. Do something else")
    print("3. one more example")

    # The combination of keys "Ctrl + C" can be used to terminate the program.
    print("Press Ctrl+C to exit")
    while True:

        command = input("Enter command: ")
        if command in ['1', '2', '3', '4'] and not simulation_mode:
            signal = command.encode('utf-8') # Convert the command to a binary string
            arduino.write(signal) # Send the command to the device
            arduino.flush() # Wait until the command is sent
            raw_data = arduino.readline() # Read the data from the device
            print(raw_data) # Print the response from the device
        elif command == '5':
            print("Entering continuous mode. Press Ctrl+C to exit")
            while True:
                time.sleep(1) # Wait for 1 second
                # Let´s put the data in a dictionary.
                data = {"timestamp": time.strftime("%Y-%m-%d %H:%M:%S")}

                if simulation_mode: # If we are in testing mode, we will simulate the data
                    data["humidity"] = random.randint(0, 100)
                    data["temperature"] = random.randint(0, 100)
                    data["soil_moisture"] = random.randint(0, 1000)
                else: # If we are not in testing mode, we will read the data from the device
                    # First send a signal to read humidity and temperature
                    signal = b'3'
                    arduino.write(signal) # Send the command to the device
                    arduino.flush() # Wait until the command is sent
                    raw_data = arduino.readline() # Read the data from the device

                    #Incoming data is in the format b'Humidity: 50.00 % Temperature: 23.00 \n'
                    # We need to split the string into a list of strings
                    raw_data = raw_data.decode('utf-8').strip().split(' ')
                    # Now we need to convert the strings to floats and add them to the dictionary
                    data["humidity"] = float(raw_data[1])
                    data["temperature"] = float(raw_data[4])
                    time.sleep(1) # Wait for 1 second
                    # Now send a signal to read soil moisture
                    signal = b'4'
                    arduino.write(signal) # Send the command to the device
                    arduino.flush() # Wait until the command is sent
                    raw_data = arduino.readline() # Read the data from the device
                    # Incoming data is in the format b'Soil Moisture: 350 \n'
                    # Decode the data and split it into a list of strings
                    raw_data = raw_data.decode('utf-8').strip().split(' ')
                    # Get the soil moisture value and store it in the dictionary
                    data["soil_moisture"] = float(raw_data[2])

                print(data)
                # Now we can save incoming data into the file. We need to open the file in append mode, and check whether the file contains previous data
                with open("data.csv", "a+") as f:
                    # First we need to check whether the file contains previous data
                    f.seek(0) # Move the cursor to the beginning of the file
                    previous_data = f.read() # Read the file
                    if previous_data == "": # If the file is empty, we need to add the header
                        f.write("timestamp,humidity,temperature,soil_moisture\n")
                        # Now we can write the data to the file
                        f.write(f"{data['timestamp']},{data['humidity']},{data['temperature']},{data['soil_moisture']}\n")
                    else: # If the file is not empty, we just need to move the cursor to the end of the file and add the data
                        f.seek(0, 2) # Move the cursor to the end of the file
                        f.write(f"{data['timestamp']},{data['humidity']},{data['temperature']},{data['soil_moisture']}\n")
        else:
            print("Invalid command")
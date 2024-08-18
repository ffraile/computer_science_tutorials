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
    # In the template, we support two direct commands to Arduino, and one complex workflow
    # where we exchange more information with the device.
    # Make sure you extend or adapt the command set to your application use case!

    print("You can use the following commands:")
    print("1. Send a command directly to Arduino")
    print("2. Send another command to Arduino")
    print("3. Start a complex workflow with Arduino")

    print("Press Ctrl+C to exit")
    while True:

        command = input("Enter command: ")
        # Make sure that the input is a supported command
        # First we check if we need to send the command directly to Arduino.
        # For this commands, we just encode the commands as binary strings and send them to the
        # Arduino directly
        if command in ['1', '2']:
            if not simulation_mode:
                signal = command.encode('utf-8')  # Convert the command to a binary string
                arduino.write(signal)  # Send the command to the device
                arduino.flush()  # Wait until the command is sent
                raw_data = b''  # Init data as empty string
                while raw_data == b'':  # Wait for Arduino to do its thing and write the response
                    raw_data = arduino.readline()  # Read message
            else:
                # In simulation mode, we just generate a random number to simulate the device
                raw_data = random.randint(0, 100)

            # Print the raw_data passed in the response from the device
            print(raw_data)

        elif command == '3':
            # You might not want to send the devices directly. For instance, you may want to
            # provide info from the device to the user in continuous mode.
            # In this template example, we will send commands 1 and 2 and show the results to the user:
            print("Entering interacive workflow. Press Ctrl+C to exit")

            while True:
                time.sleep(1) # Wait for 1 second, it is wise to give Arduino some time to make sure
                # it completes the main loop

                if not simulation_mode: # If we are in simulation mode, we will send the commands 1 and 2 and combine
                    # results
                    # First we send the first signal
                    signal = b'1'
                    arduino.write(signal)  # Send the command to the device
                    arduino.flush()  # Wait until the command is sent
                    first_raw_data = b''  # Init data as empty string
                    while first_raw_data == b'':  # Wait for Arduino to do its thing and write the response
                        first_raw_data = arduino.readline()  # Read message

                    time.sleep(1)  # Wait for 1 second

                    # Now we send the second signal
                    signal = b'2'
                    arduino.write(signal)  # Send the command to the device
                    arduino.flush()  # Wait until the command is sent
                    second_raw_data = b''  # Init data as empty string
                    while second_raw_data == b'':  # Wait for Arduino to do its thing and write the response
                        second_raw_data = arduino.readline()  # Read message


                else: # If we are in simulation mode, we just generate random data
                    first_raw_data = random.randint(0, 100)
                    second_raw_data = random.randint(0, 100)

                # Now we combine both responses in one message for the user
                data = f"First response: {first_raw_data} and second response: {second_raw_data}"
                print(data)

        else:
            print("Invalid command")
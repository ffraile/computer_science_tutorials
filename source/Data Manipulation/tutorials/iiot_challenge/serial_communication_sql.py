import serial
import time
import random
import sqlalchemy

port = None # Initialize the port variable. If you already know the serial port where the Arduino board is connected,
# you can assign it to this variable, replacing with the line below
# port = 'COM7'

simulation_mode = True # Set this variable to True to simulate the data

# If the port is not specified and we are not in simulation mode, we will create the serial connection, otherwise we will skip this step
if port is not None and not simulation_mode:
    arduino = serial.Serial(port, 9600, timeout=1)

# Our controller is going to read the data from the serial port and store it in a database. We will use SQLAlchemy to connect to the database.
# We will use MySQL as the database engine, but you can use any other database engine supported by SQLAlchemy.
# The following line will create the connection to the database. Replace the values with the ones corresponding to your database.
# The format of the connection string is: dialect+driver://username:password@host:port/database
# For example: mysql+pymysql://root:password@localhost:3306/iiot_challenge
engine = sqlalchemy.create_engine('mysql+pymysql://root:your_password@localhost:3306/iiot_challenge')

# We will use the following table to store the data
# CREATE TABLE `iiot_challenge`.`sensor_data` (
#   `id` INT NOT NULL AUTO_INCREMENT,
#   `timestamp` DATETIME NOT NULL,
#   `humidity` FLOAT NULL,
#   `temperature` FLOAT NULL,
#   `soil_moisture` INT NULL,
#   PRIMARY KEY (`id`));
#

# It is assumed that the database and table already exists in the database. If not, uncomment the following line to create it
# engine.execute("CREATE TABLE `iiot_challenge`.`sensor_data` (`id` INT NOT NULL AUTO_INCREMENT, `timestamp` DATETIME NOT NULL, `humidity` FLOAT NULL, `temperature` FLOAT NULL, `soil_moisture` INT NULL, PRIMARY KEY (`id`));")

# The user interface (CLI) will collect commands from the user and save the commands in the database, so we will read these commands and send them to the Arduino board.
# We will use the following table to store the commands
# CREATE TABLE `iiot_challenge`.`commands` (
#   `id` INT NOT NULL AUTO_INCREMENT,
#   `timestamp` DATETIME NOT NULL,
#   `command` VARCHAR(45) NULL,
#   PRIMARY KEY (`id`));
#

# Additionally, we will use the following table to store the responses from the Arduino board
# CREATE TABLE `iiot_challenge`.`responses` (
#   `id` INT NOT NULL AUTO_INCREMENT,
#   `timestamp` DATETIME NOT NULL,
#   `response` VARCHAR(45) NULL,
#   `command_fk` INT NOT NULL,
#   PRIMARY KEY (`id`),
#   INDEX `command_fk_idx` (`command_fk` ASC) VISIBLE,
#   CONSTRAINT `command_fk` FOREIGN KEY (`command_fk`) REFERENCES `iiot_challenge`.`commands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION);
#

# It is assumed that the database and table already exists in the database. If not, uncomment the following line to create it
# engine.execute("CREATE TABLE `iiot_challenge`.`commands` (`id` INT NOT NULL AUTO_INCREMENT, `timestamp` DATETIME NOT NULL, `command` VARCHAR(45) NULL, PRIMARY KEY (`id`));")

# Ok, now we are ready to start the main loop of our controller

while True:
    # Let us first collect data from the the device using the serial port. It is assume that our device will send the data in the following format:
    # b'Humidity: 50.00 % Temperature: 23.00 C\n'
    # When we send the command '3' to the device, and the data in the format:
    # b'Soil Moisture: 350 \n' if we send the command '4'

    time.sleep(1) # Wait for 1 second (this is just to avoid overloading the device)
    if port is None or simulation_mode: # If we are in simulation mode, we will simulate the data
        humidity = random.uniform(0, 100)
        temperature = random.uniform(0, 100)
        soil_moisture = random.randint(0, 100)
        raw_data = f"Humidity: {humidity:.2f} % Temperature: {temperature:.2f} C\n"
        raw_data_soil = f"Soil Moisture: {soil_moisture} \n"
    else: # If we are not in simulation mode, we will read the data from the device
        # First send a signal to read humidity and temperature
        signal = b'3'
        arduino.write(signal) # Send the command to the device
        arduino.flush() # Wait until the command is sent
        raw_data = b'' # Initialize the variable that will store the data
        while raw_data == b'':
            raw_data = arduino.readline() # Read the data from the device
        raw_data = raw_data.decode('utf-8') # Convert the binary string to a regular string

        # Now we do the same, but for the soil moisture
        signal = b'4'
        arduino.write(signal) # Send the command to the device
        arduino.flush() # Wait until the command is sent
        raw_data_soil = b'' # Initialize the variable that will store the data
        while raw_data_soil == b'':
            raw_data_soil = arduino.readline() # Read the data from the device


    # Now we will process the data
    print(raw_data) # Print the raw data
    print(raw_data_soil) # Print the raw data for the soil moisture

    # First, we will split the data into a list of strings
    data = raw_data.split(' ')
    data_soil = raw_data_soil.split(' ')
    # Now we will extract the values of humidity and temperature
    humidity = float(data[1])
    temperature = float(data[4])
    soil_moisture = int(data_soil[2])
    # Finally, we will save the data in the database
    engine.execute(f"INSERT INTO sensor_data (timestamp, humidity, temperature, soil_moisture) VALUES (NOW(), {humidity}, {temperature}, {soil_moisture});")

    # Now we will read the commands from the database, and send them to the device
    # we will group by command, just in case the user sends the same command multiple times, we will only send it once
    # We order by timestamp, so we will send the commands in the same order that they were sent by the user
    # We will only read the commands that have not been sent yet, so we will use the following query
    commands = engine.execute("SELECT * FROM commands WHERE id NOT IN (SELECT command_fk FROM responses) GROUP BY command ORDER BY timestamp;")

    # Now we will iterate over the commands
    for command in commands:
        print(f"Sending command {command['command']} to the device")
        if port is None or simulation_mode:
            # If we are in simulation mode, we will simulate the response
            response = b'OK\n'
        else:
            # If we are not in simulation mode, we will send the command to the device
            signal = command['command'].encode('utf-8')
            arduino.write(signal) # Send the command to the device
            arduino.flush() # Wait until the command is sent
            response = b'' # Initialize the variable that will store the data
            while response == b'':
                response = arduino.readline()
        # Now we will save the response in the database
        engine.execute(f"INSERT INTO responses (timestamp, response, command_fk) VALUES (NOW(), '{response.decode('utf-8')}', {command['id']});")




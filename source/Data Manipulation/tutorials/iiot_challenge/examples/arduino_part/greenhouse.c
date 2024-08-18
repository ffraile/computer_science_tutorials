#include <Adafruit_Sensor.h>   // Library for sensor handling
#include <DHT.h>               // Library for DHT sensor (temperature and humidity)
#include <LiquidCrystal_I2C.h> // Library for the LCD with I2C communication

// Pin and sensor type configuration
#define DHTPIN 2              // Pin where the DHT sensor is connected
#define DHTTYPE DHT11         // DHT 11 sensor type
const int pinLED = 13;        // Pin for onboard LED

// Initializing sensor and LCD objects
DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27, 20, 4);  // LCD address and size (20x4)

// Setup function runs once when you press reset or power the board
void setup()
{
  Serial.begin(9600);          // Start serial communication at 9600 baud rate
  pinMode(12, INPUT);          // Pin for mode selection (local or remote)
  pinMode(7, OUTPUT);          // Pin for controlling a water pump or similar device
  digitalWrite(7, HIGH);       // Default: Turn off the water pump
  dht.begin();                 // Start the DHT sensor
  lcd.init();                  // Initialize the LCD
  lcd.backlight();             // Turn on the LCD backlight
  pinMode(pinLED, OUTPUT);     // Set the onboard LED as output
  digitalWrite(pinLED, LOW);   // Start with LED off
}

// Main loop runs continuously after setup
void loop()
{
  // Read humidity and temperature from the DHT sensor
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  int soilMoistureValue = 0;  // Variable to store soil moisture reading

  // Check if the system is in remote mode (button connected to pin 12)
  if (digitalRead(12) == HIGH)
  {
    digitalWrite(pinLED, HIGH); // Turn on the LED to indicate remote mode
    lcd.setCursor(0, 0);        // Set cursor position on the LCD
    lcd.print("EDEM           ");
    lcd.setCursor(0, 1);
    lcd.print("Remote mode    ");

    // Read the serial input for commands
    char option = Serial.read();

    // Handle different serial commands based on user input
    if (option == '1')
    {
      // Command 1: Send humidity data
      delay(1000);
      Serial.print("Humidity: ");
      Serial.print(h);
      Serial.print(" %\n");
    }
    else if (option == '2')
    {
      // Command 2: Send temperature data
      delay(1000);
      Serial.print("Temperature: ");
      Serial.print(t);
      Serial.print(" C\n");
    }
    else if (option == '3')
    {
      // Command 3: Send both humidity and temperature data
      delay(1000);
      Serial.print("Humidity: ");
      Serial.print(h);
      Serial.print(" % ");
      Serial.print("Temperature: ");
      Serial.print(t);
      Serial.print(" C\n");
    }
    else if (option == '4')
    {
      // Command 4: Check soil moisture and manage water pump
      digitalWrite(7, LOW);     // Activate water pump
      delay(4000);              // Pump runs for 4 seconds
      digitalWrite(7, HIGH);    // Turn off pump
      delay(4000);              // Wait for 4 seconds before next action

      // Read soil moisture sensor
      soilMoistureValue = analogRead(A0);
      Serial.print("Soil Moisture: ");
      Serial.print(soilMoistureValue);
      Serial.print("\n");

      // If soil is dry, run the pump briefly
      if (soilMoistureValue >= 350)
      {
        digitalWrite(7, LOW);  // Activate pump
        delay(2000);           // Pump runs for 2 seconds
        digitalWrite(7, HIGH); // Turn off pump
      }
      else
      {
        digitalWrite(7, HIGH); // Ensure pump stays off when soil is sufficiently moist
      }
    }
  }
  else
  {
    // Local mode: Show readings on the LCD
    digitalWrite(pinLED, LOW); // Turn off the LED to indicate local mode
    Serial.println("Local mode. Select remote mode to interact.");
    lcd.setCursor(0, 0);
    lcd.print("Local mode      ");
    lcd.setCursor(0, 1);
    lcd.print("Humidity: " + String(h) + "%");
    delay(3000); // Wait 3 seconds before refreshing the display
    lcd.setCursor(0, 1);
    lcd.print("Temp.: " + String(t) + "C       ");
    delay(3000);
  }
}

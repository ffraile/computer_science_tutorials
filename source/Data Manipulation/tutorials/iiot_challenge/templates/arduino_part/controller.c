//TODO: Modify to import the libraries you need
#include <Adafruit_Sensor.h>     // Library for sensor handling
#include <DHT.h>                 // Library for DHT sensor (temperature and humidity)
#include <LiquidCrystal_I2C.h>   // Library for the LCD with I2C communication

// Pin configuration and sensor type (You can replace or remove depending on your project)
#define DHTPIN 2                 // TODO: Set your sensor pin
#define DHTTYPE DHT11            // TODO: Set your sensor type (e.g., DHT11, DHT22)
const int pinLED = 13;           // Onboard LED for mode indication (optional)

// Initialize sensor and LCD objects
DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27, 20, 4);  // TODO: Set your LCD address and size (if applicable)

void setup()
{
  Serial.begin(9600);            // Start serial communication at 9600 baud rate
  pinMode(12, INPUT);            // TODO: Set your input pin for mode selection (e.g., local/remote)
  pinMode(7, OUTPUT);            // TODO: Set your output pin for controlling an actuator
  digitalWrite(7, HIGH);         // TODO: Set default state for your actuator (e.g., pump off)
  dht.begin();                   // Initialize the DHT sensor (if applicable)
  lcd.init();                    // Initialize the LCD (if applicable)
  lcd.backlight();               // Turn on the LCD backlight
  pinMode(pinLED, OUTPUT);       // Set the onboard LED as output for indication (optional)
  digitalWrite(pinLED, LOW);     // Start with LED off
}

void loop()
{
  // Example sensor readings (Customize as needed)
  float sensorValue1 = dht.readHumidity();    // TODO: Replace with your sensor reading
  float sensorValue2 = dht.readTemperature(); // TODO: Replace with your sensor reading
  int sensorValue3 = analogRead(A0);          // TODO: Replace with your sensor reading

  // Mode Selection: Remote vs Local
  if (digitalRead(12) == HIGH)  // TODO: Adjust mode selection criteria as needed
  {
    digitalWrite(pinLED, HIGH); // Indicate remote mode
    lcd.setCursor(0, 0);
    lcd.print("Your Project   ");  // TODO: Customize your display text
    lcd.setCursor(0, 1);
    lcd.print("Remote mode    ");

    // Serial Communication Commands
    char option = Serial.read();

    if (option == '1')
    {
      // TODO: Replace with your command handling (e.g., send sensorValue1)
      delay(1000);
      Serial.print("Sensor 1 Value: ");
      Serial.print(sensorValue1);
      Serial.print("\n");
    }
    else if (option == '2')
    {
      // TODO: Replace with your command handling (e.g., send sensorValue2)
      delay(1000);
      Serial.print("Sensor 2 Value: ");
      Serial.print(sensorValue2);
      Serial.print("\n");
    }
    else if (option == '3')
    {
      // TODO: Replace with combined data handling (e.g., send multiple sensor values)
      delay(1000);
      Serial.print("Sensor 1: ");
      Serial.print(sensorValue1);
      Serial.print(" Sensor 2: ");
      Serial.print(sensorValue2);
      Serial.print("\n");
    }
    else if (option == '4')
    {
      // TODO: Replace with actuator control (e.g., activate/deactivate based on conditions)
      digitalWrite(7, LOW);  // Example: Activate actuator (e.g., pump)
      delay(4000);
      digitalWrite(7, HIGH); // Example: Deactivate actuator
      delay(4000);

      // TODO: Additional feedback based on sensorValue3 or other inputs
      if (sensorValue3 >= 350)  // Example condition
      {
        digitalWrite(7, LOW);  // Actuator on
        delay(2000);
        digitalWrite(7, HIGH); // Actuator off
      }
    }
  }
  else
  {
    // Local Mode: Display sensor values on the LCD
    digitalWrite(pinLED, LOW); // Indicate local mode
    lcd.setCursor(0, 0);
    lcd.print("Local mode    ");
    lcd.setCursor(0, 1);
    lcd.print("Sensor 1: " + String(sensorValue1) + "     "); // TODO: Customize display
    delay(3000);
    lcd.setCursor(0, 1);
    lcd.print("Sensor 2: " + String(sensorValue2) + "     "); // TODO: Customize display
    delay(3000);
  }
}

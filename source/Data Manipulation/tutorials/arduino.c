#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <LiquidCrystal_I2C.h>

#define DHTPIN 2
#define DHTTYPE DHT11   // DHT 11
const int pinLED = 13;

DHT dht = DHT(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27,20,4);

void setup()
{
  Serial.begin(9600);
  pinMode(12, INPUT);
  pinMode(7, OUTPUT);
  digitalWrite(7,HIGH);
  dht.begin();
  lcd.init();
  lcd.backlight();
  pinMode(pinLED, OUTPUT);
  digitalWrite (pinLED, LOW);
}
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <LiquidCrystal_I2C.h>

#define DHTPIN 2
#define DHTTYPE DHT11   // DHT 11
const int pinLED = 13;

DHT dht = DHT(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27,20,4);

void setup()
{
  Serial.begin(9600);
  pinMode(12, INPUT);
  pinMode(7, OUTPUT);
  digitalWrite(7,HIGH);
  dht.begin();
  lcd.init();
  lcd.backlight();
  pinMode(pinLED, OUTPUT);
  digitalWrite (pinLED, LOW);
}

void loop()
{
  //delay(1000);

  float h = dht.readHumidity();
  float t = dht.readTemperature();
  int soilMoistureValue = 0;

 if (digitalRead(12)==HIGH)
 {
  digitalWrite(pinLED, HIGH);
  lcd.setCursor(0,0);
  lcd.print("EDEM           ");
  lcd.setCursor(0,1);
  lcd.print("Modo remoto     ");


    char option = Serial.read();

    if (option == '1')
      {
        delay(1000);
        Serial.print("Humidity: ");
        Serial.print(h);
        Serial.print(" % ");
        Serial.print("\n");
      }

    else if(option == '2')
        {
        delay(1000);
        Serial.print("Temperature: ");
        Serial.print(t);
        Serial.print(" C ");
        Serial.print("\n");
         }

     else if(option == '3')
        {
        delay(1000);
        Serial.print("Humidity: ");
        Serial.print(h);
        Serial.print(" % ");

        Serial.print("Temperature: ");
        Serial.print(t);
        Serial.print(" C ");
        Serial.print("\n");
        }

      else if(option == '4')
        {
            digitalWrite(7,LOW);
             delay(4000);
             digitalWrite(7,HIGH);
             delay(4000);
         soilMoistureValue = analogRead(A0);  //put Sensor insert into soil
         Serial.print(soilMoistureValue);
         Serial.print("\n");
           if(soilMoistureValue >= 350)
             {
             digitalWrite(7,LOW);
             delay(2000);
             digitalWrite(7,HIGH);
             delay(2000);
             }

          else
            {
            digitalWrite(7,HIGH);
            }

        }
}

else {
      digitalWrite(pinLED, LOW);
      Serial.println("Modo local. Seleccione modo remoto.");
      Serial.print("\n");
      lcd.setCursor(0,0);
      lcd.print("Modo local    ");
      lcd.setCursor(0,1);
      lcd.print("Humidity: "+String(h)+"%");
      delay(3000);
      lcd.setCursor(0,1);
      lcd.print("Temp.: "+String(t)+"C        ");
      delay(3000);


    }

}// Final del loop


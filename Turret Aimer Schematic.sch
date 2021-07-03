EESchema Schematic File Version 4
LIBS:Turret Aimer-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Battery BT1
U 1 1 60717E0B
P 700 1050
F 0 "BT1" H 808 1096 50  0000 L CNN
F 1 "9V battery" H 808 1005 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" V 700 1110 50  0001 C CNN
F 3 "~" V 700 1110 50  0001 C CNN
	1    700  1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 60718E34
P 700 1250
F 0 "#PWR02" H 700 1000 50  0001 C CNN
F 1 "GND" H 705 1077 50  0000 C CNN
F 2 "" H 700 1250 50  0001 C CNN
F 3 "" H 700 1250 50  0001 C CNN
	1    700  1250
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR01
U 1 1 607196A4
P 700 850
F 0 "#PWR01" H 700 700 50  0001 C CNN
F 1 "+9V" H 715 1023 50  0000 C CNN
F 2 "" H 700 850 50  0001 C CNN
F 3 "" H 700 850 50  0001 C CNN
	1    700  850 
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 6071A964
P 2350 850
F 0 "U1" H 2350 1092 50  0000 C CNN
F 1 "L7805" H 2350 1001 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2375 700 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 2350 800 50  0001 C CNN
	1    2350 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  1250 1650 1250
Wire Wire Line
	2350 1250 2350 1150
Connection ~ 700  1250
$Comp
L Device:C C1
U 1 1 6071E7C7
P 1650 1000
F 0 "C1" H 1765 1046 50  0000 L CNN
F 1 "100nF" H 1765 955 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1688 850 50  0001 C CNN
F 3 "~" H 1650 1000 50  0001 C CNN
	1    1650 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 850  2050 850 
Wire Wire Line
	1650 1150 1650 1250
Connection ~ 1650 1250
Wire Wire Line
	1650 1250 2350 1250
$Comp
L Device:C C2
U 1 1 6071F7B2
P 2950 1000
F 0 "C2" H 3065 1046 50  0000 L CNN
F 1 "100nF" H 3065 955 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2988 850 50  0001 C CNN
F 3 "~" H 2950 1000 50  0001 C CNN
	1    2950 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 850  2950 850 
Wire Wire Line
	2950 1150 2950 1250
Wire Wire Line
	2950 1250 2350 1250
Connection ~ 2350 1250
Wire Wire Line
	2950 850  3500 850 
Connection ~ 2950 850 
Wire Wire Line
	3500 1150 3500 1250
Wire Wire Line
	3500 1250 2950 1250
Connection ~ 2950 1250
$Comp
L power:GND #PWR04
U 1 1 60722EBB
P 1650 1250
F 0 "#PWR04" H 1650 1000 50  0001 C CNN
F 1 "GND" H 1655 1077 50  0000 C CNN
F 2 "" H 1650 1250 50  0001 C CNN
F 3 "" H 1650 1250 50  0001 C CNN
	1    1650 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60723552
P 2350 1250
F 0 "#PWR010" H 2350 1000 50  0001 C CNN
F 1 "GND" H 2355 1077 50  0000 C CNN
F 2 "" H 2350 1250 50  0001 C CNN
F 3 "" H 2350 1250 50  0001 C CNN
	1    2350 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 60723D1C
P 2950 1250
F 0 "#PWR016" H 2950 1000 50  0001 C CNN
F 1 "GND" H 2955 1077 50  0000 C CNN
F 2 "" H 2950 1250 50  0001 C CNN
F 3 "" H 2950 1250 50  0001 C CNN
	1    2950 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 607242B7
P 3500 1250
F 0 "#PWR023" H 3500 1000 50  0001 C CNN
F 1 "GND" H 3505 1077 50  0000 C CNN
F 2 "" H 3500 1250 50  0001 C CNN
F 3 "" H 3500 1250 50  0001 C CNN
	1    3500 1250
	1    0    0    -1  
$EndComp
Connection ~ 3500 1250
$Comp
L Device:CP C3
U 1 1 607211E7
P 3500 1000
F 0 "C3" H 3618 1046 50  0000 L CNN
F 1 "10uF" H 3618 955 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3538 850 50  0001 C CNN
F 3 "~" H 3500 1000 50  0001 C CNN
	1    3500 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 60724A15
P 3500 850
F 0 "#PWR022" H 3500 700 50  0001 C CNN
F 1 "+5V" H 3515 1023 50  0000 C CNN
F 2 "" H 3500 850 50  0001 C CNN
F 3 "" H 3500 850 50  0001 C CNN
	1    3500 850 
	1    0    0    -1  
$EndComp
Connection ~ 3500 850 
$Comp
L power:+5V #PWR034
U 1 1 60732569
P 6450 2800
F 0 "#PWR034" H 6450 2650 50  0001 C CNN
F 1 "+5V" H 6465 2973 50  0000 C CNN
F 2 "" H 6450 2800 50  0001 C CNN
F 3 "" H 6450 2800 50  0001 C CNN
	1    6450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2800 6450 2800
$Comp
L power:GND #PWR035
U 1 1 60733868
P 6450 2900
F 0 "#PWR035" H 6450 2650 50  0001 C CNN
F 1 "GND" H 6455 2727 50  0000 C CNN
F 2 "" H 6450 2900 50  0001 C CNN
F 3 "" H 6450 2900 50  0001 C CNN
	1    6450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2900 6450 2900
$Comp
L kiwikit-rpi-pico-rescue:OLED-I2C-Module-Aliexpress-kiwih_kicad U3
U 1 1 607392D5
P 2950 3150
F 0 "U3" V 2500 3400 50  0000 C CNN
F 1 "Output OLED" V 2500 2900 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 2950 2600 50  0001 C CNN
F 3 "" H 2950 2600 50  0001 C CNN
	1    2950 3150
	0    1    1    0   
$EndComp
$Comp
L kiwikit-rpi-pico-rescue:raspberrypi-pico-module-kiwih_kicad U5
U 1 1 60716745
P 5550 3650
F 0 "U5" H 5900 4750 50  0000 C CNN
F 1 "RPi Pico" H 5300 4750 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 5550 2450 50  0001 C CNN
F 3 "" H 5550 2450 50  0001 C CNN
	1    5550 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 6073C318
P 3350 1900
F 0 "#PWR018" H 3350 1650 50  0001 C CNN
F 1 "GND" V 3355 1772 50  0000 R CNN
F 2 "" H 3350 1900 50  0001 C CNN
F 3 "" H 3350 1900 50  0001 C CNN
	1    3350 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 6073CFF0
P 3350 2100
F 0 "#PWR019" H 3350 1950 50  0001 C CNN
F 1 "+5V" V 3365 2228 50  0000 L CNN
F 2 "" H 3350 2100 50  0001 C CNN
F 3 "" H 3350 2100 50  0001 C CNN
	1    3350 2100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 6073DEF7
P 3350 2850
F 0 "#PWR020" H 3350 2600 50  0001 C CNN
F 1 "GND" V 3355 2722 50  0000 R CNN
F 2 "" H 3350 2850 50  0001 C CNN
F 3 "" H 3350 2850 50  0001 C CNN
	1    3350 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 6073EFA0
P 3350 3050
F 0 "#PWR021" H 3350 2900 50  0001 C CNN
F 1 "+5V" V 3365 3178 50  0000 L CNN
F 2 "" H 3350 3050 50  0001 C CNN
F 3 "" H 3350 3050 50  0001 C CNN
	1    3350 3050
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC4051 U4
U 1 1 60742F15
P 3350 4650
F 0 "U4" V 3500 5100 50  0000 C CNN
F 1 "74HC4051" V 3050 4100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 3350 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4051.pdf" H 3350 4250 50  0001 C CNN
	1    3350 4650
	0    1    1    0   
$EndComp
$Comp
L kiwikit-rpi-pico-rescue:OLED-I2C-Module-Aliexpress-kiwih_kicad U2
U 1 1 60734E6F
P 2950 2200
F 0 "U2" V 2500 2450 50  0000 C CNN
F 1 "Input OLED" V 2500 1950 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 2950 1650 50  0001 C CNN
F 3 "" H 2950 1650 50  0001 C CNN
	1    2950 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 2700 3700 2500
Wire Wire Line
	3700 2500 3350 2500
Wire Wire Line
	3700 2700 5000 2700
Wire Wire Line
	3800 2800 3800 2300
Wire Wire Line
	3800 2300 3350 2300
Wire Wire Line
	3800 2800 5000 2800
Wire Wire Line
	3700 3000 3700 3450
Wire Wire Line
	3700 3450 3350 3450
Wire Wire Line
	3700 3000 5000 3000
Wire Wire Line
	3800 3100 3800 3250
Wire Wire Line
	3800 3250 3350 3250
Wire Wire Line
	3800 3100 5000 3100
$Comp
L power:+5V #PWR024
U 1 1 60753814
P 3850 4650
F 0 "#PWR024" H 3850 4500 50  0001 C CNN
F 1 "+5V" H 3865 4823 50  0000 C CNN
F 2 "" H 3850 4650 50  0001 C CNN
F 3 "" H 3850 4650 50  0001 C CNN
	1    3850 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 6075475B
P 2750 4650
F 0 "#PWR013" H 2750 4400 50  0001 C CNN
F 1 "GND" H 2755 4477 50  0000 C CNN
F 2 "" H 2750 4650 50  0001 C CNN
F 3 "" H 2750 4650 50  0001 C CNN
	1    2750 4650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 607170EA
P 3050 4350
F 0 "#PWR017" H 3050 4100 50  0001 C CNN
F 1 "GND" H 3055 4177 50  0000 C CNN
F 2 "" H 3050 4350 50  0001 C CNN
F 3 "" H 3050 4350 50  0001 C CNN
	1    3050 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 3800 4300 3200
Wire Wire Line
	4300 3200 5000 3200
Wire Wire Line
	4400 3300 5000 3300
Wire Wire Line
	3450 3800 4300 3800
Wire Wire Line
	3450 3800 3450 4350
Wire Wire Line
	3350 3700 4400 3700
Wire Wire Line
	3350 3700 3350 4350
Wire Wire Line
	4400 3700 4400 3300
Wire Wire Line
	3250 3600 4500 3600
Wire Wire Line
	3250 3600 3250 4350
$Comp
L Connector:Conn_01x04_Male J7
U 1 1 6072D909
P 4300 4000
F 0 "J7" H 4350 4200 50  0000 C CNN
F 1 "Speed Dial Switch" H 4400 3700 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4300 4000 50  0001 C CNN
F 3 "~" H 4300 4000 50  0001 C CNN
	1    4300 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3600 4500 3500
Wire Wire Line
	4500 3500 5000 3500
Wire Wire Line
	4500 3900 4600 3900
Wire Wire Line
	4600 3900 4600 3600
Wire Wire Line
	4600 3600 5000 3600
Wire Wire Line
	4500 4000 4700 4000
Wire Wire Line
	4700 4000 4700 3700
Wire Wire Line
	4700 3700 5000 3700
Wire Wire Line
	4500 4100 4800 4100
Wire Wire Line
	4800 4100 4800 3800
Wire Wire Line
	4800 3800 5000 3800
Wire Wire Line
	6100 3100 6750 3100
$Comp
L power:+3.3V #PWR036
U 1 1 6073E78F
P 6750 3100
F 0 "#PWR036" H 6750 2950 50  0001 C CNN
F 1 "+3.3V" H 6765 3273 50  0000 C CNN
F 2 "" H 6750 3100 50  0001 C CNN
F 3 "" H 6750 3100 50  0001 C CNN
	1    6750 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR028
U 1 1 6073F4EB
P 4500 4200
F 0 "#PWR028" H 4500 4050 50  0001 C CNN
F 1 "+3.3V" V 4515 4328 50  0000 L CNN
F 2 "" H 4500 4200 50  0001 C CNN
F 3 "" H 4500 4200 50  0001 C CNN
	1    4500 4200
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR029
U 1 1 60741899
P 4500 5000
F 0 "#PWR029" H 4500 4850 50  0001 C CNN
F 1 "+3.3V" V 4515 5128 50  0000 L CNN
F 2 "" H 4500 5000 50  0001 C CNN
F 3 "" H 4500 5000 50  0001 C CNN
	1    4500 5000
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x04_Male J8
U 1 1 6074188D
P 4300 4800
F 0 "J8" H 4350 5000 50  0000 C CNN
F 1 "Distance Dial Switch" H 4400 4500 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4300 4800 50  0001 C CNN
F 3 "~" H 4300 4800 50  0001 C CNN
	1    4300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4700 4850 4000
Wire Wire Line
	4850 4000 5000 4000
Wire Wire Line
	4500 4700 4850 4700
Wire Wire Line
	4900 4800 4900 4100
Wire Wire Line
	4900 4100 5000 4100
Wire Wire Line
	4500 4800 4900 4800
Wire Wire Line
	4950 4900 4950 4200
Wire Wire Line
	4950 4200 5000 4200
Wire Wire Line
	4500 4900 4950 4900
Wire Wire Line
	5000 4300 4750 4300
Wire Wire Line
	4750 4300 4750 5300
$Comp
L Device:LED D1
U 1 1 60747E44
P 4750 5450
F 0 "D1" V 4789 5333 50  0000 R CNN
F 1 "Out of Range" V 4698 5333 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4750 5450 50  0001 C CNN
F 3 "~" H 4750 5450 50  0001 C CNN
	1    4750 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 4600 5000 4950
Wire Wire Line
	5000 4950 7500 4950
Wire Wire Line
	5000 4500 4800 4500
Wire Wire Line
	4800 4500 4800 5150
Wire Wire Line
	4800 5150 7500 5150
$Comp
L Motor:Motor_Servo M2
U 1 1 6074F932
P 10050 5400
F 0 "M2" H 10382 5465 50  0000 L CNN
F 1 "train servo" H 10382 5374 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 10050 5210 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 10050 5210 50  0001 C CNN
	1    10050 5400
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_Servo M1
U 1 1 6074CFED
P 10050 4800
F 0 "M1" H 10382 4865 50  0000 L CNN
F 1 "elevation servo" H 10382 4774 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 10050 4610 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 10050 4610 50  0001 C CNN
	1    10050 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_A J12
U 1 1 60751E41
P 8000 5000
F 0 "J12" H 7770 4897 50  0000 R CNN
F 1 "USB_A" H 7770 4988 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 8150 4950 50  0001 C CNN
F 3 " ~" H 8150 4950 50  0001 C CNN
	1    8000 5000
	-1   0    0    1   
$EndComp
$Comp
L Connector:USB_A J13
U 1 1 6075897D
P 9150 5000
F 0 "J13" H 9207 5467 50  0000 C CNN
F 1 "USB_A" H 9207 5376 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 9300 4950 50  0001 C CNN
F 3 " ~" H 9300 4950 50  0001 C CNN
	1    9150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4800 9500 4800
Wire Wire Line
	9500 4800 9500 5400
Wire Wire Line
	9500 5400 9750 5400
Connection ~ 9500 4800
Wire Wire Line
	9500 4800 9750 4800
Wire Wire Line
	9150 5400 9150 5500
Wire Wire Line
	9150 5500 9550 5500
Wire Wire Line
	9550 5500 9550 4900
Wire Wire Line
	9550 4900 9750 4900
Connection ~ 9550 5500
Wire Wire Line
	9550 5500 9750 5500
Wire Wire Line
	9450 5000 9650 5000
Wire Wire Line
	9650 5000 9650 4700
Wire Wire Line
	9650 4700 9750 4700
Wire Wire Line
	9450 5100 9650 5100
Wire Wire Line
	9650 5100 9650 5300
Wire Wire Line
	9650 5300 9750 5300
Wire Wire Line
	7500 5150 7500 5000
Wire Wire Line
	7500 5000 7700 5000
Wire Wire Line
	7500 4950 7500 4900
Wire Wire Line
	7500 4900 7700 4900
$Comp
L power:GND #PWR031
U 1 1 6076A797
P 4750 5600
F 0 "#PWR031" H 4750 5350 50  0001 C CNN
F 1 "GND" H 4755 5427 50  0000 C CNN
F 2 "" H 4750 5600 50  0001 C CNN
F 3 "" H 4750 5600 50  0001 C CNN
	1    4750 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 6076B69C
P 8000 4600
F 0 "#PWR039" H 8000 4350 50  0001 C CNN
F 1 "GND" H 8005 4427 50  0000 C CNN
F 2 "" H 8000 4600 50  0001 C CNN
F 3 "" H 8000 4600 50  0001 C CNN
	1    8000 4600
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 6076C91E
P 7700 5200
F 0 "#PWR038" H 7700 5050 50  0001 C CNN
F 1 "+5V" H 7715 5373 50  0000 C CNN
F 2 "" H 7700 5200 50  0001 C CNN
F 3 "" H 7700 5200 50  0001 C CNN
	1    7700 5200
	-1   0    0    1   
$EndComp
Text Label 3650 4350 0    50   ~ 0
analogueRead
Text Label 6100 3600 0    50   ~ 0
analogueRead
$Comp
L power:+3.3V #PWR033
U 1 1 60770E26
P 5100 6500
F 0 "#PWR033" H 5100 6350 50  0001 C CNN
F 1 "+3.3V" H 5115 6673 50  0000 C CNN
F 2 "" H 5100 6500 50  0001 C CNN
F 3 "" H 5100 6500 50  0001 C CNN
	1    5100 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 60771B73
P 4900 6500
F 0 "#PWR032" H 4900 6250 50  0001 C CNN
F 1 "GND" H 4905 6327 50  0000 C CNN
F 2 "" H 4900 6500 50  0001 C CNN
F 3 "" H 4900 6500 50  0001 C CNN
	1    4900 6500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J10
U 1 1 6076E60D
P 5000 6700
F 0 "J10" V 5154 6512 50  0000 R CNN
F 1 "Projectile speed linear pot" V 4850 6950 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 5000 6700 50  0001 C CNN
F 3 "~" H 5000 6700 50  0001 C CNN
	1    5000 6700
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR030
U 1 1 6077866E
P 4600 6600
F 0 "#PWR030" H 4600 6450 50  0001 C CNN
F 1 "+3.3V" H 4615 6773 50  0000 C CNN
F 2 "" H 4600 6600 50  0001 C CNN
F 3 "" H 4600 6600 50  0001 C CNN
	1    4600 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 60778674
P 4400 6600
F 0 "#PWR027" H 4400 6350 50  0001 C CNN
F 1 "GND" H 4405 6427 50  0000 C CNN
F 2 "" H 4400 6600 50  0001 C CNN
F 3 "" H 4400 6600 50  0001 C CNN
	1    4400 6600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J9
U 1 1 6077867A
P 4500 6800
F 0 "J9" V 4654 6612 50  0000 R CNN
F 1 "Enemy speed linear pot" V 4350 7050 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4500 6800 50  0001 C CNN
F 3 "~" H 4500 6800 50  0001 C CNN
	1    4500 6800
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR026
U 1 1 6077AC8C
P 4150 6700
F 0 "#PWR026" H 4150 6550 50  0001 C CNN
F 1 "+3.3V" H 4165 6873 50  0000 C CNN
F 2 "" H 4150 6700 50  0001 C CNN
F 3 "" H 4150 6700 50  0001 C CNN
	1    4150 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 6077AC92
P 3950 6700
F 0 "#PWR025" H 3950 6450 50  0001 C CNN
F 1 "GND" H 3955 6527 50  0000 C CNN
F 2 "" H 3950 6700 50  0001 C CNN
F 3 "" H 3950 6700 50  0001 C CNN
	1    3950 6700
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 6077AC98
P 4050 6900
F 0 "J6" V 4204 6712 50  0000 R CNN
F 1 "Enemy distance linear pot" V 3900 7150 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4050 6900 50  0001 C CNN
F 3 "~" H 4050 6900 50  0001 C CNN
	1    4050 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 6500 5000 6200
Wire Wire Line
	5000 6200 3650 6200
Wire Wire Line
	3650 6200 3650 5050
Wire Wire Line
	4500 6600 4500 6300
Wire Wire Line
	4500 6300 3550 6300
Wire Wire Line
	3550 6300 3550 5050
Wire Wire Line
	4050 6750 4050 6700
Wire Wire Line
	4050 6400 3450 6400
Wire Wire Line
	3450 6400 3450 5050
Connection ~ 4050 6700
Wire Wire Line
	4050 6700 4050 6400
$Comp
L power:+3.3V #PWR015
U 1 1 607874DF
P 2850 6500
F 0 "#PWR015" H 2850 6350 50  0001 C CNN
F 1 "+3.3V" H 2865 6673 50  0000 C CNN
F 2 "" H 2850 6500 50  0001 C CNN
F 3 "" H 2850 6500 50  0001 C CNN
	1    2850 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 607874E5
P 2650 6500
F 0 "#PWR012" H 2650 6250 50  0001 C CNN
F 1 "GND" H 2655 6327 50  0000 C CNN
F 2 "" H 2650 6500 50  0001 C CNN
F 3 "" H 2650 6500 50  0001 C CNN
	1    2650 6500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 607874EB
P 2750 6700
F 0 "J5" V 2904 6512 50  0000 R CNN
F 1 "Initial enemy bearing rotary pot" V 2600 6950 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2750 6700 50  0001 C CNN
F 3 "~" H 2750 6700 50  0001 C CNN
	1    2750 6700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 6500 2750 6250
Wire Wire Line
	2750 6250 3350 6250
Wire Wire Line
	3350 6250 3350 5050
$Comp
L power:+3.3V #PWR09
U 1 1 6078ED03
P 2300 6700
F 0 "#PWR09" H 2300 6550 50  0001 C CNN
F 1 "+3.3V" H 2315 6873 50  0000 C CNN
F 2 "" H 2300 6700 50  0001 C CNN
F 3 "" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 6078ED09
P 2100 6700
F 0 "#PWR07" H 2100 6450 50  0001 C CNN
F 1 "GND" H 2105 6527 50  0000 C CNN
F 2 "" H 2100 6700 50  0001 C CNN
F 3 "" H 2100 6700 50  0001 C CNN
	1    2100 6700
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 6078ED0F
P 2200 6900
F 0 "J3" V 2354 6712 50  0000 R CNN
F 1 "Enemy travel bearing rotary pot" V 2050 7150 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2200 6900 50  0001 C CNN
F 3 "~" H 2200 6900 50  0001 C CNN
	1    2200 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 6700 2200 6150
Wire Wire Line
	2200 6150 3250 6150
Wire Wire Line
	3250 6150 3250 5050
$Comp
L power:+3.3V #PWR05
U 1 1 607959FA
P 1750 6850
F 0 "#PWR05" H 1750 6700 50  0001 C CNN
F 1 "+3.3V" H 1765 7023 50  0000 C CNN
F 2 "" H 1750 6850 50  0001 C CNN
F 3 "" H 1750 6850 50  0001 C CNN
	1    1750 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60795A00
P 1550 6850
F 0 "#PWR03" H 1550 6600 50  0001 C CNN
F 1 "GND" H 1555 6677 50  0000 C CNN
F 2 "" H 1550 6850 50  0001 C CNN
F 3 "" H 1550 6850 50  0001 C CNN
	1    1550 6850
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 60795A06
P 1650 7050
F 0 "J1" V 1804 6862 50  0000 R CNN
F 1 "g rotary pot" V 1500 7300 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1650 7050 50  0001 C CNN
F 3 "~" H 1650 7050 50  0001 C CNN
	1    1650 7050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 6850 1650 6050
Wire Wire Line
	1650 6050 3150 6050
Wire Wire Line
	3150 6050 3150 5050
$Comp
L power:+3.3V #PWR014
U 1 1 6079D1E1
P 2800 5550
F 0 "#PWR014" H 2800 5400 50  0001 C CNN
F 1 "+3.3V" H 2815 5723 50  0000 C CNN
F 2 "" H 2800 5550 50  0001 C CNN
F 3 "" H 2800 5550 50  0001 C CNN
	1    2800 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 6079D1E7
P 2600 5550
F 0 "#PWR011" H 2600 5300 50  0001 C CNN
F 1 "GND" H 2605 5377 50  0000 C CNN
F 2 "" H 2600 5550 50  0001 C CNN
F 3 "" H 2600 5550 50  0001 C CNN
	1    2600 5550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 6079D1ED
P 2700 5750
F 0 "J4" V 2854 5562 50  0000 R CNN
F 1 "joystick x" V 2550 6000 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2700 5750 50  0001 C CNN
F 3 "~" H 2700 5750 50  0001 C CNN
	1    2700 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3050 5250 3050 5050
Wire Wire Line
	2700 5550 2700 5250
Wire Wire Line
	2700 5250 3050 5250
$Comp
L power:+3.3V #PWR08
U 1 1 607B132B
P 2150 5550
F 0 "#PWR08" H 2150 5400 50  0001 C CNN
F 1 "+3.3V" H 2165 5723 50  0000 C CNN
F 2 "" H 2150 5550 50  0001 C CNN
F 3 "" H 2150 5550 50  0001 C CNN
	1    2150 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 607B1331
P 1950 5550
F 0 "#PWR06" H 1950 5300 50  0001 C CNN
F 1 "GND" H 1955 5377 50  0000 C CNN
F 2 "" H 1950 5550 50  0001 C CNN
F 3 "" H 1950 5550 50  0001 C CNN
	1    1950 5550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 607B1337
P 2050 5750
F 0 "J2" V 2204 5562 50  0000 R CNN
F 1 "joystick y" V 1900 6000 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2050 5750 50  0001 C CNN
F 3 "~" H 2050 5750 50  0001 C CNN
	1    2050 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 5550 2050 5150
Wire Wire Line
	2050 5150 2950 5150
Wire Wire Line
	2950 5150 2950 5050
$Comp
L Connector:USB_A J11
U 1 1 607B7D69
P 5600 2000
F 0 "J11" V 5611 2330 50  0000 L CNN
F 1 "USB_A" V 5702 2330 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 5750 1950 50  0001 C CNN
F 3 " ~" H 5750 1950 50  0001 C CNN
	1    5600 2000
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 607BA5F0
P 1200 850
F 0 "SW1" H 1200 1117 50  0000 C CNN
F 1 "Power switch" H 1200 1026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1200 850 50  0001 C CNN
F 3 "~" H 1200 850 50  0001 C CNN
	1    1200 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 850  1500 850 
Connection ~ 1650 850 
Wire Wire Line
	900  850  700  850 
Connection ~ 700  850 
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 607C35A2
P 6800 4600
F 0 "SW2" H 6800 4867 50  0000 C CNN
F 1 "Manual/Auto switch" H 6800 4776 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 6800 4600 50  0001 C CNN
F 3 "~" H 6800 4600 50  0001 C CNN
	1    6800 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4600 6100 4600
$Comp
L power:+5V #PWR037
U 1 1 607C9802
P 7100 4600
F 0 "#PWR037" H 7100 4450 50  0001 C CNN
F 1 "+5V" H 7115 4773 50  0000 C CNN
F 2 "" H 7100 4600 50  0001 C CNN
F 3 "" H 7100 4600 50  0001 C CNN
	1    7100 4600
	0    1    1    0   
$EndComp
$EndSCHEMATC

import machine
import utime
import ssd1306
import math


#pins:
'''
0: input OLED data
1: input OLED clock
2: output OLED data
3: output OLED clock
4: analogue selection 1s (least significant)
5: analogue selection 2s
6: analogue selection 4s (most significant)
7: speed dial switch 1
8: speed dial switch 2
9: speed dial switch 3
10: distance dial switch 1
11: distance dial switch 2
12: distance dial switch 3
13: out of range LED
14: elevation servo pin
15: train servo pin
16: manual auto mode switch


26: analogue Read Pin
'''

#libs + pin assignments
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#map value function, is like the arduino map

def mapValue(initialValue, initialLower, initialUpper, finalLower, finalUpper, cutOff = False):
    initialRange = initialUpper - initialLower
    finalRange = finalUpper - finalLower
    
    
    initialProportion = (initialValue - initialLower)/initialRange
    finalValue = finalRange * initialProportion + finalLower
    
    if cutOff:
        if finalLower < finalUpper:
            if finalValue < finalLower:
                finalValue = finalLower
            elif finalValue > finalUpper:
                finalValue = finalUpper
        else:
            if finalValue < finalUpper:
                finalValue = finalUpper
            elif finalValue > finalLower:
                finalValue = finalLower
        
    
    return finalValue

#map value function, is like the arduino map
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#read6Inputs() setup + function

analogueReadPin = machine.ADC(26)
analogueSelectionPins = []
for i in range(4, 6+1):
    analogueSelectionPins.append(machine.Pin(i, machine.Pin.OUT))


speedDialSwitch1 = machine.Pin(7, machine.Pin.IN, machine.Pin.PULL_DOWN)
speedDialSwitch2 = machine.Pin(8, machine.Pin.IN, machine.Pin.PULL_DOWN)
speedDialSwitch3 = machine.Pin(9, machine.Pin.IN, machine.Pin.PULL_DOWN)

distanceDialSwitch1 = machine.Pin(10, machine.Pin.IN, machine.Pin.PULL_DOWN)
distanceDialSwitch2 = machine.Pin(11, machine.Pin.IN, machine.Pin.PULL_DOWN)
distanceDialSwitch3 = machine.Pin(12, machine.Pin.IN, machine.Pin.PULL_DOWN)

speedMagnitude = 1
distanceMagnitude = 1

projectileSpeedFinal = 10
enemySpeedFinal = 0
enemyDistanceFinal = 0
initialEnemyBearingFinal = 0
enemyTravelBearingFinal = 0
gFinal = 9.81


def read6Inputs():
    global speedMagnitude
    global distanceMagnitude
    
    global projectileSpeedFinal
    global enemySpeedFinal
    global enemyDistanceFinal
    global initialEnemyBearingFinal
    global enemyTravelBearingFinal
    global gFinal
    
    '''
    address map:
    0: projectile speed
    1: enemy speed
    2: enemy distance
    3: initial enemy bearing
    4: enemy travel bearing
    5: G
    6: joystick x
    7: joystick y
    '''
    
    if speedDialSwitch1.value():
        speedMagnitude = 0.01 #1cm/s inciments, so 100 incriments = 1m/s
    elif speedDialSwitch2.value():
        speedMagnitude = 1 #1m/s inciments, so 100 incriments = 100m/s
    elif speedDialSwitch3.value():
        speedMagnitude = 100 #100m/s inciments, so 100 incriments = 10km/s
    else:
        pass #just repeats the previous value, may happen if read happens on transition
    
    if distanceDialSwitch1.value():
        distanceMagnitude = 1 #1m inciments, so 100 incriments = 100m
    elif distanceDialSwitch2.value():
        distanceMagnitude = 100 #100m inciments, so 100 incriments = 10km
    elif distanceDialSwitch3.value():
        distanceMagnitude = 10000 #10km inciments, so 100 incriments = 1000km
    else:
        pass #just repeats the previous value, may happen if read happens on transition
    
    

    bitMask = []
    for i in range(3):
        bitMask.append(2**i)  #eg for first bit, i is 0, 2**0 is 1, bit mask is 1
        
    for analogueInput in range(6):
        utime.sleep(0.001)
        #set binary output
        for pin in range(3):
            analogueSelectionPins[pin].value(analogueInput & bitMask[pin])


        #read analogue inputs
        if analogueInput == 0:
            projectileSpeedU16raw = analogueReadPin.read_u16()
            #correction section
            projectileSpeedU16corrected = mapValue(projectileSpeedU16raw, 500, 65535, 0, 65535, cutOff = True)
            projectileSpeed100 = round(mapValue(projectileSpeedU16corrected, 0, 65535, 0, 100), 0)
            projectileSpeedFinal = projectileSpeed100 * speedMagnitude
            
        elif analogueInput == 1:
            enemySpeedU16raw = analogueReadPin.read_u16()
            #correction section
            enemySpeedU16corrected = mapValue(enemySpeedU16raw, 500, 65535, 0, 65535, cutOff = True)
            enemySpeed100 = round(mapValue(enemySpeedU16corrected, 0, 65535, 0, 100), 0)
            enemySpeedFinal = enemySpeed100 * speedMagnitude
            
        elif analogueInput == 2:
            enemyDistanceU16raw = analogueReadPin.read_u16()
            #correction section
            enemyDistanceU16corrected = mapValue(enemyDistanceU16raw, 500, 65535, 0, 65535, cutOff = True)
            enemyDistance100 = round(mapValue(enemyDistanceU16corrected, 0, 65535, 0, 100), 0)
            enemyDistanceFinal = enemyDistance100 * distanceMagnitude
            
        elif analogueInput == 3:
            initialEnemyBearingU16raw = analogueReadPin.read_u16()
            #correction section
            initialEnemyBearingU16corrected = mapValue(initialEnemyBearingU16raw, 500, 65535, 0, 65535, cutOff = True)
            initialEnemyBearingFinal = round(mapValue(initialEnemyBearingU16corrected, 0, 65535, 0, 360), 0)
        
        elif analogueInput == 4:
            enemyTravelBearingU16raw = analogueReadPin.read_u16()
            #correction section
            enemyTravelBearingU16corrected = mapValue(enemyTravelBearingU16raw, 500, 65535, 0, 65535, cutOff = True)
            enemyTravelBearingFinal = round(mapValue(enemyTravelBearingU16corrected, 0, 65535, 0, 360), 0)
        
        elif analogueInput == 5:
            gU16raw = analogueReadPin.read_u16()
            #correction section
            gU16corrected = mapValue(gU16raw, 500, 65535, 0, 65535, cutOff = True)
            gFinal = round(mapValue(gU16corrected, 0, 65535, 0, 100, False), 0) #range to 100m/s/s, so able to get 10m/s/s almost exactly


#read6Inputs() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#displayInputsAutomatic() setup + function

i2cBus0 = machine.I2C(0, sda=machine.Pin(0), scl = machine.Pin(1), freq = 500000)
inputOled = ssd1306.SSD1306_I2C(128, 64, i2cBus0)


def displayInputsAutomatic():
    global projectileSpeedFinal
    global enemySpeedFinal
    global enemyDistanceFinal
    global initialEnemyBearingFinal
    global enemyTravelBearingFinal
    global gFinal
    
    inputOled.fill(0)

    inputOled.text("Vp: " + str(round(projectileSpeedFinal, 2))     + " m/s",   0, 0)
    inputOled.text("Ve: " + str(round(enemySpeedFinal, 2))          + " m/s",   0, 10)
    inputOled.text("R:  " + str(round(enemyDistanceFinal, 2))       + " m",     0, 20)
    inputOled.text("Bi: " + str(round(initialEnemyBearingFinal, 2)) + " deg",   0, 30)
    inputOled.text("Be: " + str(round(enemyTravelBearingFinal, 2))  + " deg",   0, 40)
    inputOled.text("g:  " + str(round(gFinal, 2))                   + " m/s/s", 0, 50)
    
    inputOled.show()


#displayInputsAutomatic() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#calculateTargetAnglesAutomatic() setup + function

#the outputs of the function (as global variables)
    
outOfRange = False

calculatedElevation = 0
calculatedTrain = 0
finalRangeLHS = 0
finalRangeRHS = 0
horizontalSpeed = 0
verticalSpeed = 0
flightTime = 0
enemyTraveledDistance = 0


def calculateTargetAnglesAutomatic():
    global outOfRange
    
    global calculatedElevation
    global calculatedTrain
    global finalRangeLHS
    global finalRangeRHS
    global horizontalSpeed
    global verticalSpeed
    global flightTime
    global enemyTraveledDistance
    
    #set these local variables to the respective global variables
    #this is done because the calculation function was coded earlier
    #before the standard variable names were decided
    
    Bi = initialEnemyBearingFinal         #initial enemy bearing (degrees)
    Ri = enemyDistanceFinal               #initial enemy range (m)
    Ve = enemySpeedFinal                  #enemy velocity (m/s)
    theta = enemyTravelBearingFinal       #enemy travel direction (degrees)
    Vp = projectileSpeedFinal             #projectile exit velocity (m/s)
    g = gFinal                            #gravity (m/s/s)
    
    outOfRange = False
    #boolean indicating if shot is achievable
    #2 ways to check that it's not
    #1: error in calculation
    #2: large difference between LHS and RHS


    def numericallySolveGunAngle(minimumSolutionValue, maximumSolutionValue, levels, valuesPerLevel):
        #How this function works:
        #
        #the variable that is being solved for (from now on x) will have a value between minimumSolutionValue and maximumSolutionValue
        #values between the acceptable range are tried for x, a total of valuesPerLevel values are tried at first
        #closest value means the value of x that creats the smallest difference between LHS(x) and RHS(x)
        #the closest value is picked and the range narrows down to the values above and below it
        #if the boundary values are the closest then the range narrows dow to the boundary and the value next to it
        #
        #after the range is narrowed down, new intervals between the new range are calculated, keeping a consistent number
        #of values per level
        #after the specified amount of levels, the closest value is returned


        #input checks
        if valuesPerLevel < 4:
            print("numerically solve function recieved valuesPerLevel input of less than 4")
            return
        
            #above or equal 4 is required as range narrows down to between value above and below
            #if 3 or below is chosen then range never narrows down
        
        
        #defining main calculation:
        def LHS(x):
            #these equations come from 3 A4 pages of maths workings
            finalRange = 1/g * Vp**2 * math.sin(math.radians(2*x))
            output = finalRange**2
            return output

        def RHS(x):
            #these equations come from 3 A4 pages of maths workings
            flightTime = 2/g * Vp * math.sin(math.radians(x))
            enemyTraveledDistance = flightTime * Ve
            output = Ri**2 + enemyTraveledDistance**2 - 2 * Ri * enemyTraveledDistance * math.cos(math.radians(180 + Bi - theta))
            return output

        #main loop--------------------
        
        #initiate range
        rangeLower = minimumSolutionValue
        rangeUpper = maximumSolutionValue
        
        
        for level in range(levels):
            #generate valuesToTry array
            valuesToTry = []

            rangeSize = rangeUpper - rangeLower
            incrimentSize = rangeSize / (valuesPerLevel - 1)        #-1 as intervals is one less than number of values
            for i in range(valuesPerLevel):
                valuesToTry.append(round(rangeLower + i * incrimentSize, 5))   #round the appropraite value to 5dp to avoid float error

            #generate differences array
            differences = []

            for value in valuesToTry:
                left = LHS(value)
                right = RHS(value)
                difference = abs(left - right)
                differences.append(difference)
                
            #choose values and proceed
            minDifference = min(differences)            
            minDifferencePos = differences.index(minDifference)            
            closestValue = valuesToTry[minDifferencePos] 


            if minDifferencePos == 0:
                rangeLower = valuesToTry[minDifferencePos]
                rangeUpper = valuesToTry[minDifferencePos + 1]
            elif minDifferencePos == valuesPerLevel - 1:         #-1 as array index starts at 0
                rangeLower = valuesToTry[minDifferencePos - 1]
                rangeUpper = valuesToTry[minDifferencePos]
            else:
                rangeLower = valuesToTry[minDifferencePos - 1]
                rangeUpper = valuesToTry[minDifferencePos + 1]
        
        return closestValue


    def calculateFinalRangeLHS(gunAngle):
        finalRange = 1/g * Vp**2 * math.sin(math.radians(2*gunAngle))
        return finalRange

    def calculateFinalRangeRHS(gunAngle):
        flightTime = 2/g * Vp * math.sin(math.radians(gunAngle))
        enemyTraveledDistance = flightTime * Ve
        output = Ri**2 + enemyTraveledDistance**2 - 2 * Ri * enemyTraveledDistance * math.cos(math.radians(180 + Bi - theta))
        return math.sqrt(output)

    def calculateFlightTime(gunAngle):
        flightTime = 2/g * Vp * math.sin(math.radians(gunAngle))
        return flightTime

    def calculateVerticalSpeed(gunAngle):
        verticalSpeed = Vp * math.sin(math.radians(gunAngle))
        return verticalSpeed

    def calculateHorizontalSpeed(gunAngle):
        horizontalSpeed = Vp * math.cos(math.radians(gunAngle))
        return horizontalSpeed

    def calculateEnemyTraveledDistance():
        return flightTime * Ve

    def calculateGunBearing():
        return (Bi + math.degrees(math.asin(enemyTraveledDistance/finalRangeRHS * math.sin(math.radians(180 + Bi - theta))))) % 360



    try:  #check if parameters out of range, if divide by 0 error or inverse sin error, it's out of range
        #start = utime.ticks_ms()
        
        gunAngle = numericallySolveGunAngle(0, 45, 3, 20) #perform the numerical calculation with 3 levels and 20 values per level
        finalRangeLHS = calculateFinalRangeLHS(gunAngle)
        finalRangeRHS = calculateFinalRangeRHS(gunAngle)
        flightTime = calculateFlightTime(gunAngle)
        horizontalSpeed = calculateHorizontalSpeed(gunAngle)
        verticalSpeed = calculateVerticalSpeed(gunAngle)
        enemyTraveledDistance = calculateEnemyTraveledDistance()
        gunBearing = calculateGunBearing()
        
    
        #the above variables were named earlier, below is setting them to the names of the global variables
        calculatedElevation = gunAngle
        calculatedTrain = gunBearing

        #end = utime.ticks_ms()
        #print("Elapsed time (ms): " + str(end - start))
        #print("\n")
              
        #check for out of range by comparing LHS and RHS, 0.1 (10%) arbitrarily chosen
        finalDifference = abs(finalRangeLHS - finalRangeRHS)
        if finalDifference / finalRangeLHS > 0.1 or finalDifference / finalRangeRHS > 0.1:
            #print("LHS and RHS too different")
            outOfRange = True

    except:
        #print("error occured in calculation")
        outOfRange = True

#calculateTargetAnglesAutomatic() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#displayTargetAnglesAutomatic() setup + function

i2cBus1 = machine.I2C(1, sda=machine.Pin(2), scl = machine.Pin(3), freq = 500000)
outputOled = ssd1306.SSD1306_I2C(128, 64, i2cBus1)

outOfRangeLED = machine.Pin(13, machine.Pin.OUT)
outOfRangeLED.value(0)

def displayTargetAnglesAutomatic():
    global outOfRange
    
    global calculatedElevation
    global calculatedTrain
    global finalRangeLHS
    global finalRangeRHS
    global horizontalSpeed
    global verticalSpeed
    global flightTime
    global enemyTraveledDistance
    
    outputOled.fill(0)
    

    outputOled.text("Elev:  " + str(round(calculatedElevation, 2))   + " deg", 0, 0)
    outputOled.text("Train: " + str(round(calculatedTrain, 2))       + " deg", 0, 8)
    outputOled.text("RL:    " + str(round(finalRangeLHS, 2))         + " m",   0, 16)
    outputOled.text("RR:    " + str(round(finalRangeRHS, 2))         + " m",   0, 24)
    outputOled.text("Vh:    " + str(round(horizontalSpeed, 2))       + " m/s", 0, 32)
    outputOled.text("Vv:    " + str(round(verticalSpeed, 2))         + " m/s", 0, 40)
    outputOled.text("T:     " + str(round(flightTime, 2))            + " s",   0, 48)
    outputOled.text("D:     " + str(round(enemyTraveledDistance, 2)) + " m",   0, 56)
    
    outputOled.show()
    
    outOfRangeLED.value(outOfRange)


#displayTargetAnglesAutomatic() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#actuateServos() setup + function

elevationServoPin = machine.PWM(machine.Pin(14))
elevationServoPin.freq(50)

trainServoPin = machine.PWM(machine.Pin(15))
trainServoPin.freq(50)
    
def actuateServos():
    global calculatedElevation
    global calculatedTrain

    def actuateServo(servo, degree):
        dutyCycle = mapValue(degree, 0, 360, 0.025, 0.125)        
        servoDutyU16 = math.floor(dutyCycle * 65535)
        servo.duty_u16(servoDutyU16)
        
    def elevationCorrection(InputDegree):
        if InputDegree < 0:
            InputDegree = 0
        elif InputDegree > 90:
            InputDegree = 90
        return mapValue(InputDegree, 0, 90, 238, 145)

    def trainCorrection(InputDegree):
        if InputDegree < 0:
            InputDegree = 0
        elif InputDegree > 360:
            InputDegree = 360
        return mapValue(InputDegree, 0, 360, 360, 0)
        

    elevationCorrectedDegree = elevationCorrection(calculatedElevation)
    actuateServo(elevationServoPin, elevationCorrectedDegree)
  
    trainCorrectedDegree = trainCorrection(calculatedTrain)
    actuateServo(trainServoPin, trainCorrectedDegree)
        
#actuateServos() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#readJoystick() setup + function

deltaElevation = 0 #in degrees/second, how much the servo should move
deltaTrain = 0

xMaxSpeed = 200 #in degrees/second, measured experimentally
yMaxSpeed = 200

xDeadMin = 31500
xMid = 33000
xDeadMax = 34500

yDeadMin = 31500
yMid = 33000
yDeadMax = 34500

def readJoystick():
    global deltaElevation
    global deltaTrain
    
    '''
    address map:
    0: projectile speed
    1: enemy speed
    2: enemy distance
    3: initial enemy bearing
    4: enemy travel bearing
    5: G
    6: joystick x
    7: joystick y
    '''
    #set output value of 6 to read joystick x
    analogueSelectionPins[2].value(1)
    analogueSelectionPins[1].value(1)
    analogueSelectionPins[0].value(0)
    
    #read joystick x
    deltaTrainU16raw = analogueReadPin.read_u16()
    deltaTrainU16corrected = mapValue(deltaTrainU16raw, 300, 65535, 65535, 0, cutOff = True) #connector has been connnected backwards
    
    #interpret joystick x   
    if deltaTrainU16corrected > xDeadMin and deltaTrainU16corrected < xDeadMax:
        deltaTrain = 0
    elif deltaTrainU16corrected >= xDeadMax:
        deltaTrainRatio = mapValue(deltaTrainU16corrected, xDeadMax, 65535, 0, 1, cutOff = True)
        deltaTrain = deltaTrainRatio * xMaxSpeed
    elif deltaTrainU16corrected <= xDeadMin:
        deltaTrainRatio = mapValue(deltaTrainU16corrected, 0, xDeadMin, -1, 0, cutOff = True)       
        deltaTrain = deltaTrainRatio * xMaxSpeed
    
    #joystick x
    #----------------------------
    #joystick y
     
    #set output value of 7 to read joystick y
    analogueSelectionPins[2].value(1)
    analogueSelectionPins[1].value(1)
    analogueSelectionPins[0].value(1)
    
    #read joystick y
    deltaElevationU16raw = analogueReadPin.read_u16()
    deltaElevationU16corrected = mapValue(deltaElevationU16raw, 300, 65535, 65535, 0, cutOff = True) #connector has been connnected backwards

 
    #interpret joystick y
    if deltaElevationU16corrected > yDeadMin and deltaElevationU16corrected < yDeadMax:
        deltaElevation = 0
    elif deltaElevationU16corrected >= yDeadMax:
        deltaElevationRatio = mapValue(deltaElevationU16corrected, yDeadMax, 65535, 0, 1, cutOff = True)
        deltaElevation = deltaElevationRatio * yMaxSpeed
    elif deltaElevationU16corrected <= yDeadMin:
        deltaElevationRatio = mapValue(deltaElevationU16corrected, 0, yDeadMin, -1, 0, cutOff = True)       
        deltaElevation = deltaElevationRatio * yMaxSpeed
    
    deltaTrain = round(deltaTrain, 0)
    deltaElevation = round(deltaElevation, 0)
    

#readJoystick() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#displayInputsManual() setup + function

#i2c bus and OLED have already been set up in the automatic section
#so there is no need to do it here again

def displayInputsManual():
    global deltaElevation
    global deltaTrain
   
    inputOled.fill(0)
    
    inputOled.text("Elevation:", 0, 0)
    inputOled.text(str(round(deltaElevation, 2)) + " deg/s", 0, 10)
    
    inputOled.text("Train:", 0, 40)
    inputOled.text(str(round(deltaTrain, 2)) + " deg/s", 0, 50)
   
    inputOled.show()
    

#displayInputsManual() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#calculateTargetAnglesManual() setup + function

lastChange = 0

def calculateTargetAnglesManual():
    global deltaElevation
    global deltaTrain
    
    global calculatedElevation
    global calculatedTrain
    
    global lastChange
    
    timeSinceLastChange = (utime.ticks_ms() - lastChange) / 1000   #in seconds
    
    if timeSinceLastChange > 0.5:
        #this means manual mode was only just turned on
        #very large times makes large movements, which are bad
        #so these cases are ignored, the only action is setting the lastChange
        pass
    else:
        changeInElevation = deltaElevation * timeSinceLastChange
        calculatedElevation += changeInElevation
        calculatedElevation = mapValue(calculatedElevation, 0, 90, 0, 90, cutOff = True)
        #mapValue function is a easy way to cut off values that go over the limit
        
        
        changeInTrain = deltaTrain * timeSinceLastChange
        calculatedTrain += changeInTrain
        calculatedTrain = mapValue(calculatedTrain, 0, 360, 0, 360, cutOff = True)
       
    lastChange = utime.ticks_ms()


#readJoystick() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#displayTargetAnglesManual() setup + function

#i2c bus and OLED have already been set up in the automatic section
#so there is no need to do it here again

def displayTargetAnglesManual():
    global calculatedElevation
    global calculatedTrain
   
    outputOled.fill(0)
    
    outputOled.text("Elevation:", 0, 0)
    outputOled.text(str(round(calculatedElevation, 2)) + " deg", 0, 10)
    
    outputOled.text("Train:", 0, 40)
    outputOled.text(str(round(calculatedTrain, 2)) + " deg", 0, 50)
   
    outputOled.show()
    
#displayTargetAnglesManual() setup + function
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#main logic loop (refer to flow chart)

manualSwitch = machine.Pin(16, machine.Pin.IN, machine.Pin.PULL_DOWN)

while True:
    isManualMode = manualSwitch.value()
    if isManualMode:
        outOfRangeLED.value(0)
        readJoystick()
        displayInputsManual()
        calculateTargetAnglesManual()
        displayTargetAnglesManual()
    else:
        read6Inputs()
        displayInputsAutomatic()
        calculateTargetAnglesAutomatic()
        displayTargetAnglesAutomatic()
    actuateServos()
    

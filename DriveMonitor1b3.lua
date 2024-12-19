--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey


--[====[ HOTKEYS ]====]
-- Press F6 to simulate this file
-- Press F7 to build the project, copy the output from /_build/out/ into the game to use
-- Remember to set your Author name etc. in the settings: CTRL+COMMA


--[====[ EDITABLE SIMULATOR CONFIG - *automatically removed from the F7 build output ]====]
---@section __LB_SIMULATOR_ONLY__
do
    ---@type Simulator -- Set properties and screen sizes here - will run once when the script is loaded
    simulator = simulator
    simulator:setScreen(1, "3x1")
    simulator:setProperty("ExampleNumberProperty", 123)

    -- Runs every tick just before onTick; allows you to simulate the inputs changing
    ---@param simulator Simulator Use simulator:<function>() to set inputs etc.
    ---@param ticks     number Number of ticks since simulator started
    function onLBSimulatorTick(simulator, ticks)

        -- touchscreen defaults
        local screenConnection = simulator:getTouchScreen(1)
        simulator:setInputBool(1, screenConnection.isTouched)
        simulator:setInputNumber(1, screenConnection.width)
        simulator:setInputNumber(2, screenConnection.height)
        simulator:setInputNumber(3, screenConnection.touchX)
        simulator:setInputNumber(4, screenConnection.touchY)

        simulator:setInputNumber(7, simulator:getSlider(4) * 30)
        simulator:setInputNumber(9, simulator:getSlider(3) * 120)
        simulator:setInputNumber(10, simulator:getSlider(2) * 20)
        simulator:setInputNumber(11, simulator:getSlider(5) * 6) -- gear
        simulator:setInputNumber(12, simulator:getSlider(1))
        simulator:setInputNumber(18, simulator:getSlider(6))

        -- NEW! button/slider options from the UI
        simulator:setInputBool(31, simulator:getIsClicked(1))       -- if button 1 is clicked, provide an ON pulse for input.getBool(31)
        simulator:setInputNumber(31, simulator:getSlider(1))        -- set input 31 to the value of slider 1

        simulator:setInputBool(32, simulator:getIsToggled(2))       -- make button 2 a toggle, for input.getBool(32)
        --simulator:setInputNumber(32, simulator:getSlider(2) * 50)   -- set input 32 to the value from slider 2 * 50
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

require("Helpers.numbers")
require("Helpers.static")
require("Helpers.Icons")

--Icon Display Helpers
require("Helpers.icon_fuel_display")
require("Helpers.icon_temp_display")
require("Helpers.icon_trailer_display")
require("Helpers.icon_headlights_display")
require("Helpers.icon_generic_display")
require("Helpers.icon_battery_display")
require("Helpers.icon_parkingbreak_display")

-- Displays
require("Helpers.speed_display")
--require("Helpers.fuel_display")
--require("Helpers.engtemp_display")
--require("Helpers.rps_display")


COLOR_darkGreen = {29, 87, 56}
COLOR_lightGreen = {86, 240, 158}
COLOR_yellow = {230, 230, 0}
COLOR_errorRed = {140, 0, 0}
COLOR_veryDarkGreen = {21, 38, 29}
COLOR_lightGray = {156, 156, 156}
COLOR_darkGary = {43, 43, 43}
COLOR_veryDarkGray = {18, 18, 18}
COLOR_black = {0, 0, 0}
COLOR_blue = {0, 128, 255}
COLOR_darkBlue = {0, 38, 77}

-- Inputs
-- NUMBERS
-- 7: Speed (m/s)
-- 8: Fuel
-- 9: Engine Temp (4/30)
-- 10: Engine RPS (1/27)
-- 11: Gear
-- 12: Throttle (3/29)
-- 13: battery
-- 18: Electric Engine Throttle 
-- ON/OFF
-- 14: lights
-- 15: trailer
-- 16: parking brake

-- User Inputs
-- 17: Fuel Total


local box3_leftMargin = 64

isClicked = false
maxThrottle = 100
ticks = 0
h = 32
w = 96
function onTick()
    ticks = ticks + 1
    isClicked = input.getBool(1)
    touchX = input.getNumber(3)
    touchY = input.getNumber(4)

    totalFuelAtFull = input.getNumber(17)

    speedMPH = round(input.getNumber(7) * 2.23694 or 00)
    fuelValue = round(input.getNumber(8) * totalFuelAtFull)
    engTemp = roundTo(input.getNumber(9), 1)
    engRPS = round(input.getNumber(10))
    gear = input.getNumber(11)
    throttle = roundTo(input.getNumber(12) * 100, 1)
    battery = round(input.getNumber(13) * 100)
    headLights = input.getBool(14)
    trailer = input.getBool(15)
    parkingBrake = input.getBool(16)
    electricEngineThrottle = round(input.getNumber(18) * 100)
end

function onDraw()
    h = screen.getHeight()
    w = screen.getWidth()

    topMargin = 4
    bottomMargin = h - 8

    -- Box 1 32x32
    sColor(COLOR_veryDarkGreen)
    screen.drawRectF(0, 0, 32, 32)
    -- Electric Engine Throttle Output
    Icon_ElectricBoost(topMargin - 4, 0, COLOR_blue)
    sColor(COLOR_blue)
    screen.drawText(7, topMargin - 3, "BOOST")
    -- Electric Engine Throttle Line
    sColor(COLOR_darkBlue)
    screen.drawRectF(0, 7, 32, 3)
    sColor(COLOR_blue)
    local electricEngineThrottleLine = round(1 + (electricEngineThrottle - 0) * (33 - 4) / 100)
    screen.drawLine(1, 8, electricEngineThrottleLine, 8)

    -- Box 1 Lower
    

    sColor(COLOR_darkGreen)
    screen.drawLine(31, 0, 31, 32)

    -- Box 2 32x32
    sColor(COLOR_veryDarkGreen)
    screen.drawRectF(32, 0, 32, 32)
    speedDisplay(32, topMargin, bottomMargin, speedMPH, engRPS)
    sColor(COLOR_darkGreen)
    screen.drawLine(63, 0, 63, 32)

    -- Box 3 32x32
    sColor(COLOR_black)
    screen.drawRectF(box3_leftMargin, 0, 32, 32)

    display_icon_temp(topMargin - 2, box3_leftMargin + 4)
    display_icon_fuel(topMargin + 8, box3_leftMargin + 4)

    display_icon_trailer(topMargin - 2, box3_leftMargin + 13, trailer)
    display_icon_headlights(topMargin + 8, box3_leftMargin + 13, headLights)

    display_icon_battery(topMargin - 2, box3_leftMargin + 22, battery)
    display_icon_parkingbreak(topMargin + 8, box3_leftMargin + 22, COLOR_errorRed, parkingBrake)
    
    
    -- Throttle Bar
    local throttle_bar_width = 96
    local throttle_bar_height = 6
    local throttle_bar_leftMargin = 0
    local throttle_bar_topMargin = 26
    sColor(COLOR_darkGary)
    screen.drawRectF(throttle_bar_leftMargin, throttle_bar_topMargin, throttle_bar_width, throttle_bar_height)
    
    sColor(COLOR_veryDarkGray)
    screen.drawLine(0, 25, 96, 25)

    sColor(COLOR_darkGreen)
    throttleLine = round(2 + (throttle - 0) * (throttle_bar_width - 4) / 100)
    screen.drawLine(2, 27, throttleLine, 27)
    screen.drawLine(2, 28, throttleLine, 28)
    screen.drawLine(2, 29, throttleLine, 29)
    screen.drawLine(2, 30, throttleLine, 30)
    
    -- 4 to 90
end




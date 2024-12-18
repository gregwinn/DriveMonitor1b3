function display_icon_fuel(topMargin, leftMargin)
    fuelColor = COLOR_lightGreen
    if fuelValue <= 10 then
        fuelColor = COLOR_errorRed
    elseif fuelValue <= 30 then
        fuelColor = COLOR_yellow
    end
    Icon_Fuel(topMargin, leftMargin, fuelColor)
end
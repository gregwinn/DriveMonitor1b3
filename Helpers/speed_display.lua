function speedDisplay(leftSpacing, topSpaceing, bottomSpacing, speedMPH, engRPS)
    sColor(COLOR_lightGreen)
    local custom_topSpaceing = topSpaceing + 4

    -- Show Gear
    gearcolor = COLOR_lightGreen
    if gear < 0 then
        gearcolor = COLOR_errorRed
        gear = "R"
    elseif gear == 0 and parkingBrake then
        gearcolor = COLOR_errorRed
        gear = "P"
    elseif gear == 0 then
        gearcolor = COLOR_yellow
        gear = "N"
    end
    sColor(COLOR_veryDarkGray)
    screen.drawRect(leftSpacing + 24, topSpaceing - 4, 5, 6)
    display_icon_generic(topSpaceing - 4 , leftSpacing + 24, 1, gearcolor, tostring(gear))

    sColor(COLOR_lightGreen)
    if speedMPH < 10 then
        screen.drawText(leftSpacing + 16, custom_topSpaceing, speedMPH)
    elseif speedMPH < 100 then
        screen.drawText(leftSpacing + 14, custom_topSpaceing, speedMPH)
    else
        screen.drawText(leftSpacing + 11, custom_topSpaceing, speedMPH)
    end
    screen.drawText(leftSpacing + 11, 16, "MPH")

    -- draw vertical bar showing RPS
    sColor(COLOR_lightGreen)
    screen.drawRectF(leftSpacing + 1, topSpaceing - 2, 4, 22)

    if engRPS > 20 then
        sColor(COLOR_errorRed)
    else
        sColor(COLOR_darkGreen)
    end

    -- Ensure input is clamped between 0 and maxInput
    local clampedValue = math.max(0, math.min(engRPS, 20))
    -- Calculate the length of the bar
    local barLevel = round(20 - ((clampedValue / 20) * 20))
    screen.drawLine(leftSpacing + 2, bottomSpacing - 1, leftSpacing + 2, barLevel + topSpaceing - 1)
    screen.drawLine(leftSpacing + 3, bottomSpacing - 1, leftSpacing + 3, barLevel + topSpaceing - 1)
end
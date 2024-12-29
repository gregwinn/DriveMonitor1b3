function speedDisplay(leftSpacing, topSpaceing, bottomSpacing, speedMPH, engRPS)
    sColor(COLOR_lightGreen)
    local custom_topSpaceing = topSpaceing + 5

    -- Show Gear
    display_gear_row_inorder(gear, topSpaceing, leftSpacing)
    
    
    sColor(COLOR_veryDarkGray)
    screen.drawRect(leftSpacing + 2, topSpaceing - 4, 5, 6)
    screen.drawRect(leftSpacing + 7, topSpaceing - 4, 5, 6)

    screen.drawRect(leftSpacing + 19, topSpaceing - 4, 5, 6)
    screen.drawRect(leftSpacing + 24, topSpaceing - 4, 5, 6)

    sColor(COLOR_darkGary)
    screen.drawRect(leftSpacing + 13, topSpaceing - 4, 5, 6)

    sColor(COLOR_lightGreen)
    if speedMPH < 10 then
        screen.drawText(leftSpacing + 14, custom_topSpaceing, speedMPH)
    elseif speedMPH < 100 then
        screen.drawText(leftSpacing + 12, custom_topSpaceing, speedMPH)
    else
        screen.drawText(leftSpacing + 9, custom_topSpaceing, speedMPH)
    end
    screen.drawText(leftSpacing + 9, custom_topSpaceing + 7, "MPH")

    -- Ensure input is clamped between 0 and maxInput
    --local clampedValue = math.max(0, math.min(engRPS, 20))
    -- Calculate the length of the bar
    --local barLevel = round(20 - ((clampedValue / 20) * 20))
    --screen.drawLine(leftSpacing + 2, bottomSpacing - 1, leftSpacing + 2, barLevel + topSpaceing - 1)
    --screen.drawLine(leftSpacing + 3, bottomSpacing - 1, leftSpacing + 3, barLevel + topSpaceing - 1)
end

function display_gear_row_inorder(currentGear, topSpaceing, leftSpacing)
    if (currentGear < 0) then
        display_icon_generic(topSpaceing - 4 , leftSpacing + 13, 1, COLOR_errorRed, "R")
        display_icon_generic(topSpaceing - 4 , leftSpacing + 19, 1, COLOR_darkGreen, "N")
        display_icon_generic(topSpaceing - 4 , leftSpacing + 24, 1, COLOR_darkGreen, "D")
    elseif (currentGear == 0 and parkingBrake) then
        display_icon_generic(topSpaceing - 4 , leftSpacing + 7, 1, COLOR_darkGreen, "R")
        display_icon_generic(topSpaceing - 4 , leftSpacing + 13, 1, COLOR_errorRed, "P")
        display_icon_generic(topSpaceing - 4 , leftSpacing + 19, 1, COLOR_darkGreen, "D")
    elseif (currentGear == 0) then
        display_icon_generic(topSpaceing - 4 , leftSpacing + 7, 1, COLOR_darkGreen, "R")
        display_icon_generic(topSpaceing - 4 , leftSpacing + 13, 1, COLOR_yellow, "N")
        display_icon_generic(topSpaceing - 4 , leftSpacing + 19, 1, COLOR_darkGreen, "D")
    else
        if currentGear == 1 then
            display_icon_generic(topSpaceing - 4 , leftSpacing + 2, 1, COLOR_darkGreen, "R")
            display_icon_generic(topSpaceing - 4 , leftSpacing + 7, 1, COLOR_darkGreen, "N")
            display_icon_generic(topSpaceing - 4 , leftSpacing + 13, 1, COLOR_lightGreen, "D")
        end
    end
end
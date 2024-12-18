function display_icon_temp(topMargin, leftMargin)
    engTempColor = COLOR_lightGreen
    if engTemp >= 60 and engTemp < 80 then
        engTempColor = COLOR_yellow
    elseif engTemp > 80 then
        engTempColor = COLOR_errorRed
    end
    Icon_Temp(topMargin, leftMargin, engTempColor)
end
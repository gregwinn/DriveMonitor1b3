function display_icon_battery(topMargin, leftMargin, batteryValue)
    batteryColor = COLOR_lightGreen
    if batteryValue <= 10 then
        batteryColor = COLOR_errorRed
    elseif batteryValue <= 30 then
        batteryColor = COLOR_yellow
    end
    Icon_Battery(topMargin, leftMargin, batteryColor)

end
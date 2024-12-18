function display_icon_generic(topMargin, leftMargin, iconType, iconColor, singleString)
    sColor(iconColor)
    if iconType == 1 then
        if  #singleString ~= 1 then
            singleString = "0"
        end
        Icon_Generic_SingleNumber(topMargin, leftMargin, iconColor, singleString)
    elseif iconType == 2 then
        Icon_Generic_Warning(topMargin, leftMargin, iconColor)
    elseif iconType == 3 then
        Icon_Generic_Circle(topMargin, leftMargin, iconColor)
    end
end
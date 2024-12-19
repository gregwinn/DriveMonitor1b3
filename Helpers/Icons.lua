S=screen
DRF=S.drawRectF
DR=S.drawRect
DT=S.drawTriangle
DL=S.drawLine
DCF=S.drawCircleF
DTX=S.drawText
function Icon_Temp(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DRF(leftMargin + 3, topMargin + 0.5,1,4)
    DRF(leftMargin + 4, topMargin + 0.5,1,1)
    DRF(leftMargin + 4, topMargin + 2.5,1,1)
    DRF(leftMargin + 3, topMargin + 4.5,1,1)
    DRF(leftMargin + 4, topMargin + 5.5,1,1)
    DRF(leftMargin + 5, topMargin + 4.5,1,1)
    DRF(leftMargin + 6, topMargin + 5.5,1,1)
    DRF(leftMargin + 2, topMargin + 5.5,1,1)
    DRF(leftMargin + 1, topMargin + 4.5,1,1)
    DRF(leftMargin + 0, topMargin + 5.5,1,1)
end

function Icon_Fuel(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DRF(leftMargin + 0, topMargin + 0.5,1,7)
    DRF(leftMargin + 1, topMargin + 6.5,4,1)
    DRF(leftMargin + 4, topMargin + 0.5,1,6)
    DRF(leftMargin + 1, topMargin + 0.5,3,1)
    DRF(leftMargin + 1, topMargin + 3.5,3,3)
    DRF(leftMargin + 5, topMargin + 1.5,1,1)
    DRF(leftMargin + 6, topMargin + 2.5,1,1)
    DRF(leftMargin + 6, topMargin + 3.5,1,1)
    DRF(leftMargin + 6, topMargin + 4.5,1,1)
    DRF(leftMargin + 5, topMargin + 5.5,1,1)
end

function Icon_Trailer(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DRF(leftMargin + 5, topMargin + 6.5,1,1)
    DRF(leftMargin + 6, topMargin + 5.5,1,1)
    DRF(leftMargin + 4, topMargin + 5.5,1,1)
    DRF(leftMargin + 5, topMargin + 4.5,1,1)
    DRF(leftMargin + 3, topMargin + 4.5,1,1)
    DRF(leftMargin + 3, topMargin + 3.5,2,1)
    DRF(leftMargin + 5, topMargin + 3.5,2,1)
    DRF(leftMargin + 1, topMargin + 3.5,2,2)
    DRF(leftMargin + 1, topMargin + 1.5,6,2)
    DRF(leftMargin + 0, topMargin + 4.5,1,1)
end

function Icon_Headlights(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DRF(leftMargin + 3, topMargin + 2.5,1,1)
    DRF(leftMargin + 4, topMargin + 3.5,1,1)
    DRF(leftMargin + 2, topMargin + 3.5,1,1)
    DRF(leftMargin + 3, topMargin + 4.5,1,1)
    DRF(leftMargin + 5, topMargin + 5.5,1,1)
    DRF(leftMargin + 6, topMargin + 6.5,1,1)
    DRF(leftMargin + 1, topMargin + 1.5,1,1)
    DRF(leftMargin + 0, topMargin + 0.5,1,1)
    DRF(leftMargin + 5, topMargin + 1.5,1,1)
    DRF(leftMargin + 6, topMargin + 0.5,1,1)
    DRF(leftMargin + 1, topMargin + 5.5,1,1)
    DRF(leftMargin + 0, topMargin + 6.5,1,1)
    DRF(leftMargin + 3, topMargin + 6.5,1,1)
    DRF(leftMargin + 6, topMargin + 3.5,1,1)
    DRF(leftMargin + 0, topMargin + 3.5,1,1)
    DRF(leftMargin + 3, topMargin + 0.5,1,1)
    DRF(leftMargin + 3, topMargin + 3.5,1,1)
end

function Icon_ElectricBoost(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DR(leftMargin + 1,topMargin + 2,4,3)
    DRF(leftMargin + 2,topMargin + 1,1,1)
    DRF(leftMargin + 4,topMargin + 1,1,1)
    sColor(COLOR_yellow)
    DRF(leftMargin + 4,topMargin + 3,1,1)
    DRF(leftMargin + 2,topMargin + 4,1,1)
end

function Icon_ParkingBreak(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DRF(leftMargin + 1,topMargin + 1, 1, 6)
    DRF(leftMargin + 2,topMargin + 1, 3, 1)
    DRF(leftMargin + 5,topMargin + 2, 1, 2)
    DRF(leftMargin + 2,topMargin + 4, 3, 1)
end

function Icon_Battery(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DR(leftMargin + 0,topMargin + 2,6,3)
    DRF(leftMargin + 1,topMargin + 1,1,1)
    DRF(leftMargin + 5,topMargin + 1,1,1)
end

function Icon_Generic_Warning(topMargin, leftMargin, iconColor, innerIconColor)
    sColor(iconColor)
    DT(leftMargin + 3,topMargin,leftMargin + 6,topMargin + 6,leftMargin,topMargin + 6)
    sColor(innerIconColor or iconColor)
    DL(leftMargin + 3, topMargin + 3,leftMargin + 3, topMargin + 5)
end
function Icon_Generic_Circle(topMargin, leftMargin, iconColor)
    sColor(iconColor)
    DCF(leftMargin + 3, topMargin + 3, 3)
end
function Icon_Generic_SingleNumber(topMargin, leftMargin, iconColor, number)
    sColor(iconColor)
    DTX(leftMargin + 1, topMargin + 1, number)
end
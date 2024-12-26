function display_icon_engine(topMargin, leftMargin, engRPS)

    -- Header Display
    Icon_Engine(topMargin, leftMargin + 1, COLOR_orange)
    DTX(leftMargin + 10, topMargin + 1, "ENG")

    -- Engine RPS Bar
    DRF(leftMargin + 1, topMargin + 8, 29, 3)
    sColor(COLOR_darkOrange)
    local engineRPSBar = round((engRPS - 0) * (31 - 4) / 20)
    if engRPS > 20 then
        sColor(COLOR_errorRed)
    else
        sColor(COLOR_darkOrange)
    end
    DRF(leftMargin + 2, topMargin + 9, engineRPSBar, 1)

    sColor(COLOR_darkOrange)
    DRF(leftMargin + 2, topMargin + 8, 1, 1)
    DRF(leftMargin + 8, topMargin + 8, 1, 1)
    DRF(leftMargin + 15, topMargin + 8, 1, 1)
    sColor(COLOR_redOrange)
    DRF(leftMargin + 22, topMargin + 8, 1, 1)
    DRF(leftMargin + 28, topMargin + 8, 1, 1)
end
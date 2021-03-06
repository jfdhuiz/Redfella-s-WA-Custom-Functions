function()
    if UnitAffectingCombat("player") and aura_env.recommended then
        local festering_wounds = select(4,UnitDebuff("target",GetSpellInfo(194310))) or 0

        if aura_env.bank == true then
            return "\n\n\n\n" .. "bank"
        elseif aura_env.prepare == true then
            return festering_wounds .. "W\n\n\nSR\nsoon"
        else
            local rec = aura_env.recommended
            local default = " "
            if (aura_env.targetCount > 1) then default = string.format("%.0f", aura_env.targetCount) end


            local runic_power = UnitPower("player")
            local health_percentage = math.ceil( (UnitHealth("player") / UnitHealthMax("player") * 100) )
            local runes_available = aura_env.runes_available()

            -- Death Coil
            if rec == 47541 then return runic_power .. "RP\n\n\n\n" end

            -- Apocalypse
            if rec == 220143 then return festering_wounds .. "W\n\n\n\n" end

            -- Rune/Wound spenders & builders
            if rec == 85948
                or rec == 55090
                or rec == 130736
            then
                return runes_available .. "R\n\n\n" .. festering_wounds .. "W"
            end

            return festering_wounds .. "W\n\n\n" .. default
        end
    end
end

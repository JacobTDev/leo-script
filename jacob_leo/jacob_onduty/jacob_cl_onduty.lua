--[[Variables]]
IsCurrentlyOnDuty = false

RegisterCommand("onduty", function() 
    IsCurrentlyOnDuty = not IsCurrentlyOnDuty
    
    if IsCurrentlyOnDuty == true then
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 0},
            multiline = true,
            args = {"[System]", "You are now on duty as a LEO. Do /loadout to equip your loadout."}
        })
    elseif IsCurrentlyOnDuty == false then
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 0},
            multiline = true,
            args = {"[System]", "You are now off duty as a civilian."}
        })
    end
end, false)

RegisterCommand("loadout", function() 
    if IsCurrentlyOnDuty == true then
        GiveLoadout()
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 0},
            multiline = true,
            args = {"[System]", "LEO Loadout equipped."}
        })
    elseif IsCurrentlyOnDuty == false then
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 0},
            multiline = true,
            args = {"[System]", "You are not on duty as a LEO, if you wish to go on duty do /onduty."}
        })
    end
end, false)

function GiveLoadout() 
    GiveWeaponToPed(PlayerPedId(), GetHashKey("weapon_fireextinguisher"), 999, false, false)
    GiveWeaponToPed(PlayerPedId(), GetHashKey("weapon_stungun"), 999, false, false)
    GiveWeaponToPed(PlayerPedId(), GetHashKey("weapon_combatpistol"), 999, false, false)
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("weapon_combatpistol"), GetHashKey("COMPONENT_AT_PI_FLSH"))
    GiveWeaponToPed(PlayerPedId(), GetHashKey("weapon_pumpshotgun"), 999, false, false)
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("weapon_pumpshotgun"), GetHashKey("COMPONENT_AT_AR_FLSH"))
    GiveWeaponToPed(PlayerPedId(), GetHashKey("weapon_carbinerifle"), 999, false, false)
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("weapon_carbinerifle"), GetHashKey("COMPONENT_AT_AR_FLSH"))
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("weapon_carbinerifle"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("weapon_carbinerifle"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
end
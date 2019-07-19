RegisterNetEvent("911chatmessage")
AddEventHandler("911chatmessage", function(text) 
    if IsCurrentlyOnDuty == true then
        TriggerEvent("chat:addMessage", {
            color = {0, 10, 255},
            multiline = true,
            args = {"[911]", text}
        })
    end
end)
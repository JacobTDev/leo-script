RegisterCommand("911", function(source, args) 
    TriggerClientEvent("911chatmessage", -1, table.concat(args, " "))
end, false)
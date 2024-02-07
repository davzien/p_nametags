local data = {
    user = "user_db",
    host = "host",
    name = "name_db",
    password = "pass"
}

local dbConnection = dbConnect("mysql", "dbname="..data.name..";host="..data.host, data.user, data.password)

function query(...)
    local handle = dbQuery(dbConnection, ...)
    return dbPoll(handle, -1)
end

function getPlayerAdminLevel(playerName)
    local query = dbQuery(dbConnection, "SELECT Admin FROM prime_players WHERE Login = ?", playerName)
    local result = dbPoll(query, -1)
    if result and #result > 0 then
        return tonumber(result[1].Admin)
    else
        return 0
    end
end

function getPlayerAdminLevelHandler(playerName)
    local adminLevel = getPlayerAdminLevel(playerName)
    triggerClientEvent(client, "onAdminLevelReceived", resourceRoot, adminLevel)
end
addEvent("onRequestAdminLevel", true)
addEventHandler("onRequestAdminLevel", resourceRoot, getPlayerAdminLevelHandler)
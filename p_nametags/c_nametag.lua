local loading = {}

if getElementData(localPlayer, "player:logging") then return end

loading.fonts = {
    ["font"] = dxCreateFont("font.ttf", 14)
}

function renderNametags()
    if not loading.fonts["font"] then
        outputChatBox("[System] Nie udało się załadować czcionki!") 
        return
    end

    local players = getElementsByType("player")
    for _, player in ipairs(players) do
        local playerID = getElementData(player, "player:id")
        local playerName = getPlayerName(player)
            setPlayerNametagShowing ( source, false )

            local x, y, z = getElementPosition(player)
            local screenX, screenY = getScreenFromWorldPosition(x, y, z+1)
            if screenX and screenY then
                dxDrawText("#161616"..playerName.." [PID: "..playerID.."] ", screenX-1, screenY-1, screenX-1, screenY-1, tocolor(255, 255, 255), 1, loading.fonts["font"], "center", "bottom", false, false, false, true)
                dxDrawText("#161616"..playerName.." [PID: "..playerID.."] ", screenX+1, screenY-1, screenX+1, screenY-1, tocolor(255, 255, 255), 1, loading.fonts["font"], "center", "bottom", false, false, false, true)
                dxDrawText("#161616"..playerName.." [PID: "..playerID.."] ", screenX-1, screenY+1, screenX-1, screenY+1, tocolor(255, 255, 255), 1, loading.fonts["font"], "center", "bottom", false, false, false, true)
                dxDrawText("#161616"..playerName.." [PID: "..playerID.."] ", screenX+1, screenY+1, screenX+1, screenY+1, tocolor(255, 255, 255), 1, loading.fonts["font"], "center", "bottom", false, false, false, true)
                dxDrawText(playerName.." [#CA9A3APID: "..playerID.."#FFFFFF] ", screenX, screenY, screenX, screenY, tocolor(255, 255, 255), 1, loading.fonts["font"], "center", "bottom", false, false, false, true)
        end
    end
end
addEventHandler("onClientRender", root, renderNametags)

function rgbToHex ( nR, nG, nB ) 
    local sColor = "#" 
    nR = string.format ( "%X", nR ) 
    sColor = sColor .. ( ( string.len ( nR ) == 1 ) and ( "0" .. nR ) or nR ) 
    nG = string.format ( "%X", nG ) 
    sColor = sColor .. ( ( string.len ( nG ) == 1 ) and ( "0" .. nG ) or nG ) 
    nB = string.format ( "%X", nB ) 
    sColor = sColor .. ( ( string.len ( nB ) == 1 ) and ( "0" .. nB ) or nB ) 
    return sColor 
end 
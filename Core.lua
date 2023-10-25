-- Fonction pour envoyer un message personnalisé dans le canal local
local function SendCustomChatMessage(text)
    local playerGUID = UnitGUID("player")
    local playerName = UnitName("player")
    
    -- Créez un faux message en utilisant les données du joueur actuel
    local fakeMessage = playerName .. " dit : " .. text

    -- Envoyez le message personnalisé dans le canal local
    SendChatMessage(fakeMessage, "SAY")
end

-- Fonction pour gérer les commandes
local function LanguageMageCommand(msg, editbox)
    local command, arg = strsplit(" ", msg, 2)

    if command == "name" then
        -- Commande pour définir le nom du personnage
        characterName = arg or ""
        print("Nom du personnage configuré : " .. characterName)
    elseif command == "say" then
        -- Commande pour faire prononcer un texte dans le canal local
        if characterName ~= "" then
            SendCustomChatMessage(arg)
        else
            print("Erreur : Veuillez définir un nom de personnage avec /lmage name [nom du personnage] avant d'utiliser /lmage say.")
        end
    end
end

-- Initialise characterName à nil
local characterName = nil
local languageUsed = "none"

-- Fonction pour traduire un mot en orc
local function TranslateWordToOrc(word)
    local translation = ""
    local wordLength = #word

    
        if wordLength == 1 then
            local orcChars = {"A", "N", "G", "O", "L"}
            translation = translation .. orcChars[math.random(#orcChars)]
        elseif wordLength == 2 then
            local orcCharPairs = {"Ha", "Ko", "No", "Mu", "Ag", "Ka", "Gi", "Il"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 3 then
            local orcCharPairs = {"Lok", "Tar", "Kaz", "Ruk", "Kek", "Mog", "Zug", "Gul", "Nuk", "Aaz", "Kil", "Ogg"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 4 then
            local orcCharPairs = {"Rega", "Nogu", "Tago", "Uruk", "Kagg", "Zaga", "Grom", "Ogar", "Gesh", "Thok", "Dogg", "Maka", "Maza"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 5 then
            local orcCharPairs = {"Regas", "Nogah", "Kazum", "Magan", "No'bu", "Golar", "Throm", "Zugas", "Re'ka", "No'ku", "Ro'th"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 6 then
            local orcCharPairs = {"Thrakk", "Revash", "Nakazz", "Moguna", "No'gor", "Goth'a", "Raznos", "Ogerin", "Gezzno", "Thukad", "Makogg", "Aaz'no"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 7 then
            local orcCharPairs = {"Lok'Tar", "Gul'rok", "Kazreth", "Tov'osh", "Zil'Nok", "Rath'is", "Kil'azi"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 8 then
            local orcCharPairs = {"Throm'ka", "Osh'Kava", "Gul'nath", "Kog'zela", "Ragath'a", "Zuggossh", "Moth'aga"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 9 then
            local orcCharPairs = {"Tov'nokaz", "Osh'kazil", "No'throma", "Gesh'nuka", "Lok'mogul", "Lok'bolar", "Ruk'ka'ha"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 10 then
            local orcCharPairs = {"Regasnogah", "Kazum'nobu", "Throm'bola", "Gesh'zugas", "Maza'rotha", "Ogerin'naz"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 11 then
            local orcCharPairs = {"Thrakk'reva", "Kaz'goth'no", "No'gor'goth", "Kil'azi'aga", "Zug-zug'ama", "Maza'thrakk"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 12 then
            local orcCharPairs = {"Lokando'nash", "Ul'gammathar", "Golgonnashar", "Dalggo'mazah"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
		elseif wordLength == 13 then
            local orcCharPairs = {"Khaz'rogg'ahn", "Moth'kazoroth"}
            translation = translation .. orcCharPairs[math.random(#orcCharPairs)]
        else
            -- Générez des caractères aléatoires pour les autres positions
            local orcRandomChars = {"A", "N", "G", "O", "L", "Ha", "Ko", "No", "Mu", "Ag", "Ka", "Gi", "Il"}
            translation = translation .. orcRandomChars[math.random(#orcRandomChars)]
        end
    

    return translation
end

-- Fonction pour traduire une phrase complète en orc
local function TranslateToOrc(phrase)
    if languageUsed == "orc" then
        local translatedWords = {}
        local words = {strsplit(" ", phrase)} -- Sépare la phrase en mots

        for _, word in ipairs(words) do
            if word == " " then
                table.insert(translatedWords, " ")
            else
                table.insert(translatedWords, TranslateWordToOrc(word))
            end
        end

        local translatedPhrase = table.concat(translatedWords, " ")
        return translatedPhrase
    else
        return phrase  -- Aucune traduction si le langage utilisé n'est pas "orc"
    end
end




-- Fonction pour gérer les commandes
local function LanguageMageCommand(msg, editbox)
    local command, arg = strsplit(" ", msg, 2)

    if command == "name" then
        -- Commande pour définir le nom du personnage
        characterName = arg or nil  -- Réinitialise characterName
        if characterName then
            print("Nom du PNJ configuré : " .. characterName)
        else
            print("Nom du PNJ effacé.")
        end
    elseif command == "say" then
        -- Commande pour faire prononcer un texte dans le canal Emote (/e)
        if characterName then
            local npcColor = "ffffff9f"  -- Couleur jaune pour les PNJ
            local translatedText = arg  -- Par défaut, utilise le texte d'origine
            if languageUsed == "orc" then
                translatedText = TranslateToOrc(arg)  -- Traduire en orc si la langue est "orc"
            end
            local emoteMessage = "/e dit : " .. translatedText
            DoEmote(emoteMessage)
        else
            print("Erreur : Veuillez définir un nom de PNJ avec /lmage name [nom du personnage] avant d'utiliser /lmage say.")
        end
    elseif command == "language" then
        print(languageUsed)
        -- Commande pour sélectionner le langage à utiliser si différent de nul
        if arg == "none" or arg == "common" or arg == "orc" then
            languageUsed = arg
            print("Votre PNJ utilisera maintenant la langue " .. languageUsed)
        else
            print("Le langage " .. arg .. " n'est pas pris en charge. Les langages pris en charge sont 'none', 'common', et 'orc'.")
        end
    end
end

-- Enregistrez la fonction de commande
SLASH_LMAGE1 = "/lmage"
SlashCmdList["LMAGE"] = LanguageMageCommand

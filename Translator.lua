-- Fonction pour traduire une phrase complète
LanguageMage = LanguageMage or {}

function LanguageMage.Translate(phrase)
		
        -- Supprime les espaces surnuméraires avant et après le texte
        phrase = phrase:gsub("^%s*(.-)%s*$", "%1")
        
        local translatedWords = {}
        local words = {strsplit(" ", phrase)} -- Sépare la phrase en mots

        local lastWordWasSpecialChar = false
        for i, word in ipairs(words) do
            local specialChar = word:match("[.!?,;:]")
            if specialChar then
                local actualWord, _ = word:match("([^"..specialChar.."]+)(["..specialChar.."]*)")
				if actualWord and languageUsed == 0 then
                    local translatedWord = LanguageMage.TranslateWordToCommon(actualWord)
                    -- Convertit le mot traduit en minuscules et met le premier caractère en majuscule si nécessaire
                    translatedWord = translatedWord:lower()
                    if i == 1 or lastWordWasSpecialChar then
                        translatedWord = " "..translatedWord:sub(2,2):upper()..translatedWord:sub(3)
                    end
                    table.insert(translatedWords, translatedWord)
                end
                if actualWord and languageUsed == 1 then
                    table.insert(translatedWords, LanguageMage.TranslateWordToOrc(actualWord))
                end
                table.insert(translatedWords, specialChar)
                lastWordWasSpecialChar = true
            elseif word == " " then
                table.insert(translatedWords, " ")
			elseif languageUsed == 0 then
                local translatedWord = LanguageMage.TranslateWordToCommon(word)
				-- Convertit le mot traduit en minuscules et met le premier caractère en majuscule si nécessaire
                translatedWord = translatedWord:lower()
				if i == 1 or lastWordWasSpecialChar then
					translatedWord = " "..translatedWord:sub(2,2):upper()..translatedWord:sub(3)
                end
                table.insert(translatedWords, translatedWord)
                lastWordWasSpecialChar = false
            elseif languageUsed == 1 then
                table.insert(translatedWords, LanguageMage.TranslateWordToOrc(word))
                lastWordWasSpecialChar = false
            end
        end

        local translatedPhrase = table.concat(translatedWords, "")
		
        return translatedPhrase

end





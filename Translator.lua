-- Fonction pour traduire une phrase complète
LanguageMage = LanguageMage or {}

function LanguageMage.Translate(phrase)
		
        local translatedWords = {}
        local words = {strsplit(" ", phrase)} -- Sépare la phrase en mots

        for _, word in ipairs(words) do
            if word == " " then
                table.insert(translatedWords, " ")
            elseif languageUsed == 1 then
                table.insert(translatedWords, LanguageMage.TranslateWordToOrc(word))
            end
        end

        local translatedPhrase = table.concat(translatedWords, " ")
		
        return translatedPhrase

end
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
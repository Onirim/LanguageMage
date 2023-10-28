-- Fonction pour traduire un mot en orc
LanguageMage = LanguageMage or {}

function LanguageMage.TranslateWordToOrc(word)
	
    translation = ""
    wordLength = #word
    
        if wordLength == 1 then
            local chars = {"A", "N", "G", "O", "L"}
            translation = translation .. chars[math.random(#Chars)]
        elseif wordLength == 2 then
            local chars = {"Ha", "Ko", "No", "Mu", "Ag", "Ka", "Gi", "Il"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 3 then
            local chars = {"Lok", "Tar", "Kaz", "Ruk", "Kek", "Mog", "Zug", "Gul", "Nuk", "Aaz", "Kil", "Ogg"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 4 then
            local chars = {"Rega", "Nogu", "Tago", "Uruk", "Kagg", "Zaga", "Grom", "Ogar", "Gesh", "Thok", "Dogg", "Maka", "Maza"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 5 then
            local chars = {"Regas", "Nogah", "Kazum", "Magan", "No'bu", "Golar", "Throm", "Zugas", "Re'ka", "No'ku", "Ro'th"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 6 then
            local chars = {"Thrakk", "Revash", "Nakazz", "Moguna", "No'gor", "Goth'a", "Raznos", "Ogerin", "Gezzno", "Thukad", "Makogg", "Aaz'no"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 7 then
            local chars = {"Lok'Tar", "Gul'rok", "Kazreth", "Tov'osh", "Zil'Nok", "Rath'is", "Kil'azi"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 8 then
            local chars = {"Throm'ka", "Osh'Kava", "Gul'nath", "Kog'zela", "Ragath'a", "Zuggossh", "Moth'aga"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 9 then
            local chars = {"Tov'nokaz", "Osh'kazil", "No'throma", "Gesh'nuka", "Lok'mogul", "Lok'bolar", "Ruk'ka'ha"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 10 then
            local chars = {"Regasnogah", "Kazum'nobu", "Throm'bola", "Gesh'zugas", "Maza'rotha", "Ogerin'naz"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 11 then
            local chars = {"Thrakk'reva", "Kaz'goth'no", "No'gor'goth", "Kil'azi'aga", "Zug-zug'ama", "Maza'thrakk"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 12 then
            local chars = {"Lokando'nash", "Ul'gammathar", "Golgonnashar", "Dalggo'mazah"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 13 then
            local chars = {"Khaz'rogg'ahn", "Moth'kazoroth"}
            translation = translation .. chars[math.random(#chars)]
        else
            -- Générez des caractères aléatoires pour les autres positions
            local randomChars = {"A", "N", "G", "O", "L", "Ha", "Ko", "No", "Mu", "Ag", "Ka", "Gi", "Il"}
            translation = translation .. randomChars[math.random(#randomChars)]
        end
 	
    return " "..translation
end

function LanguageMage.TranslateWordToCommon(word)
	
    translation = ""
    wordLength = #word
    
        if wordLength == 1 then
            local chars = {"A", "E", "I", "O", "U", "Y"}
            translation = translation .. chars[math.random(#chars)]
        elseif wordLength == 2 then
            local chars = {"An", "Ko", "Lo", "Lu", "Me", "Ne", "Re", "Ru", "Se", "Ti", "Va", "Ve"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 3 then
            local chars = {"Ash", "Bor", "Bur", "Far", "Gol", "Hir", "Lon", "Mod", "Nud", "Ras", "Ver", "Vil", "Vos"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 4 then
            local chars = {"Ador", "Agol", "Dana", "Goth", "Lars", "Noth", "Nuff", "Odes", "Ruff", "Thor", "Uden", "Veld", "Vohl", "Vrum"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 5 then
            local chars = {"Algos", "Barad", "Borne", "Melka", "Ergin", "Eynes", "Garde", "Gloin", "Majis", "Nagan", "Novas", "Regen", "Tiras", "Wirsh"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 6 then
            local chars = {"Aesire", "Aziris", "Daegil", "Danieb", "Ealdor", "Engoth", "Goibon", "Mandos", "Nevren", "Rogesh", "Rothas", "Ruftos", "Skilde", "Valesh", "Vandar", "Waldir"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 7 then
            local chars = {"Andovis", "Ewiddan", "Faergas", "Forthis", "Kaelsig", "Koshvel", "Lithtos", "Nandige", "Nostyec", "Novaedi", "Sturume", "Vassild"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 8 then
            local chars = {"Aldonoth", "Cynegold", "Endirvis", "Hamerung", "Landowar", "Lordaere", "Methrine", "Ruftvess", "Thorniss"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 9 then
            local chars = {"Aetwinter", "Danagarde", "Eloderung", "Firalaine", "Gloinador", "Gothalgos", "Regenthor", "Udenmajis", "Vandarwos", "Veldbarad"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 10 then
            local chars = {"Aelgestron", "Cynewalden", "Danavandar", "Dyrstigost", "Falhedring", "Vastrungen"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 11 then
            local chars = {"Agolandovis", "Bornevalesh", "Dornevalesh", "Farlandowar", "Forthasador", "Thorlithtos", "Vassildador", "Wershaesire"}
            translation = translation .. chars[math.random(#chars)]
		elseif wordLength == 12 then
            local chars = {"Golveldbarad", "Mandosdaegil", "Nevrenrothas", "Waldirskilde"}
            translation = translation .. chars[math.random(#chars)]
        else
            -- Générez des caractères aléatoires pour les autres positions
            local randomChars = {"A", "E", "I", "O", "U", "Y", "An", "Ko", "Lo", "Lu", "Me", "Ne", "Re", "Ru", "Se", "Ti", "Va", "Ve"}
            translation = translation .. randomChars[math.random(#randomChars)]
        end
 	
    return " "..translation
end
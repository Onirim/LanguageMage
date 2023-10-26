-- Crée une fenêtre contextuelle vide
local mainFrame = CreateFrame("Frame", "LanguageMageFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(450, 300)  -- Définissez la taille de la fenêtre contextuelle
mainFrame:SetPoint("CENTER", -100, 0)  -- Positionnez la fenêtre légèrement à gauche de l'écran
mainFrame:Hide()  -- Masquez la fenêtre par défaut

-- Titre de la fenêtre
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("LEFT", mainFrame.TitleBg, "LEFT", 5, 0)
mainFrame.title:SetText("Fenêtre de traduction LanguageMage")

-- Gestion du déplacement de la fenêtre
mainFrame:SetMovable(true)
mainFrame:EnableMouse(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

-----------------------------------------------------------------------------------------------
-- Création du cadre d'input
local inputBoxCadre = CreateFrame("Frame", nil, mainFrame, "BackdropTemplate")
inputBoxCadre:SetSize(mainFrame:GetWidth() -20, (mainFrame:GetHeight() / 2) -50) -- Largeur, Hauteur
inputBoxCadre:SetPoint("TOP", mainFrame, "TOP", -2, -55)

-- Définition de l'arrière-plan
inputBoxCadre:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
inputBoxCadre:SetBackdropColor(0, 0, 0) -- Couleur de l'arrière-plan

-- Création de l'EditBox à l'intérieur du cadre
local MyEditBox = CreateFrame("EditBox", nil, inputBoxCadre)
MyEditBox:SetSize(inputBoxCadre:GetWidth() - 10, inputBoxCadre:GetHeight()) -- Largeur, Hauteur (un peu plus petites que le cadre pour ne pas dépasser)
MyEditBox:SetPoint("TOP", inputBoxCadre, "TOP", 5, -10) -- Centré dans le cadre

-- Configuration du texte d'invite
local placeholderText = "Saisissez le texte à traduire ici"
MyEditBox:SetText(placeholderText)
MyEditBox:SetTextColor(0.5, 0.5, 0.5) -- Couleur grise

MyEditBox:SetScript("OnEditFocusGained", function(self)
    if self:GetText() == placeholderText then
        self:SetText("")
        self:SetTextColor(1, 1, 1) -- Couleur blanche
    end
end)

MyEditBox:SetScript("OnEditFocusLost", function(self)
    if self:GetText() == "" then
        self:SetText(placeholderText)
        self:SetTextColor(0.5, 0.5, 0.5) -- Couleur grise
    end
end)

-- Configuration de l'EditBox pour permettre plusieurs lignes
MyEditBox:SetMultiLine(true)

-- Configuration de la police
MyEditBox:SetFontObject(ChatFontNormal)

-- Configuration du comportement du texte
MyEditBox:SetAutoFocus(false) -- Ne pas focaliser automatiquement
MyEditBox:SetTextInsets(5, 5, 3, 3) -- Marge intérieure

-- Configuration du script
MyEditBox:SetScript("OnEscapePressed", function(self)
    self:ClearFocus() -- Enlever le focus quand on appuie sur Echap
end)

-----------------------------------------------------------------------------------------------------
-- Création du cadre d'affichage
local displayBoxCadre = CreateFrame("Frame", nil, mainFrame, "BackdropTemplate")
displayBoxCadre:SetSize(mainFrame:GetWidth() -20, (mainFrame:GetHeight() / 2) -50) -- Largeur, Hauteur
displayBoxCadre:SetPoint("BOTTOM", mainFrame, "BOTTOM", -2, 40) -- En bas du cadre

-- Définition de l'arrière-plan
displayBoxCadre:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
inputBoxCadre:SetBackdropColor(0, 0, 0) -- Couleur de l'arrière-plan

-- Création de l'EditBox à l'intérieur du cadre d'affichage
local MyDisplayBox = CreateFrame("EditBox", nil, displayBoxCadre)
MyDisplayBox:SetSize(displayBoxCadre:GetWidth(), displayBoxCadre:GetHeight()) -- Largeur, Hauteur
MyDisplayBox:SetPoint("TOP", displayBoxCadre, "TOP", 5, -10) 

-- Configuration de l'EditBox pour permettre plusieurs lignes et être en lecture seule
MyDisplayBox:SetMultiLine(true)
MyDisplayBox:SetAutoFocus(false) -- Ne pas focaliser automatiquement
MyDisplayBox:EnableMouse(true) -- Permettre la sélection à la souris
MyDisplayBox:SetTextInsets(5, 5, 3, 3) -- Marge intérieure
MyDisplayBox:SetScript("OnKeyDown", function(self) self:ClearFocus() end) -- Empêcher la saisie

-- Configuration de la police
MyDisplayBox:SetFontObject(ChatFontNormal)

-----------------------------------------------------------------------------------------------------
-- Création du menu déroulant
local languageDropDown = CreateFrame("Frame", "LanguageDropDown", mainFrame, "UIDropDownMenuTemplate")
languageDropDown:SetPoint("TOP", mainFrame, "TOP", 50, -25)

-- Création du libellé
local languageLabel = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
languageLabel:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 12, -33)
languageLabel:SetText("Sélectionnez la langue de traduction")

-- Initialisation du menu déroulant
-- Initialisation du menu déroulant
UIDropDownMenu_Initialize(languageDropDown, function(self, level, menuList)
    local info = UIDropDownMenu_CreateInfo()
    if (level or 1) == 1 then
        -- Ajout des options de premier niveau
        info.text, info.checked = "Commun", "Commun" == UIDropDownMenu_GetSelectedName(languageDropDown)
        info.func = function()
            UIDropDownMenu_SetSelectedName(languageDropDown, "Commun")
            languageUsed = 0
        end
        UIDropDownMenu_AddButton(info)

        info.text, info.checked = "Orc", "Orc" == UIDropDownMenu_GetSelectedName(languageDropDown)
        info.func = function()
            UIDropDownMenu_SetSelectedName(languageDropDown, "Orc")
            languageUsed = 1
        end
        UIDropDownMenu_AddButton(info)
    end
end)

-- Sélection de l'option par défaut
UIDropDownMenu_SetSelectedName(languageDropDown, "Commun")
languageUsed = 0








---------------------------------------------------------------------------------------------------
-- Afficher la fenêtre lorsque la commande /lmage show est utilisée
local function ShowLanguageMageFrame()
    mainFrame:Show()
end

-- Fonction pour gérer les commandes
local function LanguageMageCommand(msg, editbox)
    if msg == "show" then
        ShowLanguageMageFrame()
    elseif msg == "hide" then
        mainFrame:Hide()
    end
end

-- Enregistrez la fonction de commande
SLASH_LMAGE1 = "/lmage"
SlashCmdList["LMAGE"] = LanguageMageCommand
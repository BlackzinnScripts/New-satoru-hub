local particlesRunning = true
-- SERVICES
local TweenService = game:GetService("TweenService")
local Playersrs = game:GetService("Playersrs")
local RunService = game:GetService("RunService")

local player = Playersrs.LocalPlayersr

-- CORES
local ROXO_PRINCIPAL = Color3.fromRGB(170, 0, 255)
local ROXO_MEDIO = Color3.fromRGB(130, 0, 200)
local ROXO_ESCURO = Color3.fromRGB(70, 0, 120)

-- GUI LOADING
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SatoruHubLoading"
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = player:WaitForChild("PlayersrGui")

-- SOM
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://1848354536"
Sound.Volume = 1
Sound.Looped = true
Sound.Parent = ScreenGui
Sound:Play()

-- FUNDO
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1,0,1,0)
Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
Frame.Parent = ScreenGui

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, ROXO_PRINCIPAL),
	ColorSequenceKeypoint.new(0.5, ROXO_MEDIO),
	ColorSequenceKeypoint.new(1, ROXO_ESCURO)
}
Gradient.Rotation = 90
Gradient.Parent = Frame

-- ================== PARTÍCULAS (SÓ NA LOADING) ==================
local Particles = {}
local particlesRunning = true

for i = 1, 35 do
	local ponto = Instance.new("Frame")
	ponto.Size = UDim2.new(0, math.random(4,7), 0, math.random(4,7))
	ponto.Position = UDim2.new(math.random(), 0, math.random(), 0)
	ponto.AnchorPoint = Vector2.new(0.5, 0.5)
	ponto.BackgroundColor3 = ROXO_PRINCIPAL
	ponto.BackgroundTransparency = 0.25
	ponto.Parent = Frame

	Instance.new("UICorner", ponto).CornerRadius = UDim.new(1,0)

	local stroke = Instance.new("UIStroke")
	stroke.Color = ROXO_PRINCIPAL
	stroke.Thickness = 1
	stroke.Transparency = 0.4
	stroke.Parent = ponto

	table.insert(Particles, ponto)

	task.spawn(function()
		while particlesRunning do
			TweenService:Create(
				ponto,
				TweenInfo.new(math.random(2,4), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{Size = UDim2.new(0,9,0,9), BackgroundTransparency = 0.05}
			):Play()

			task.waitit(2)

			TweenService:Create(
				ponto,
				TweenInfo.new(math.random(2,4), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{Size = UDim2.new(0,5,0,5), BackgroundTransparency = 0.35}
			):Play()

			task.waitit(2)
		end
	end)
end

-- ================== TITULO ==================
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.7,0,0.12,0)
Title.Position = UDim2.new(0.5,0,0.1,0)
Title.AnchorPoint = Vector2.new(0.5,0)
Title.BackgroundTransparency = 1
Title.Text = "SATORU HUB"
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true
Title.TextColor3 = ROXO_PRINCIPAL
Title.Parent = Frame

-- LOGO
local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(0,110,0,110)
LogoFrame.Position = UDim2.new(0.5,0,0.35,0)
LogoFrame.AnchorPoint = Vector2.new(0.5,0.5)
LogoFrame.BackgroundTransparency = 1
LogoFrame.Parent = Frame

local thumb = Playersrs:GetUserThumbnailAsync(
	player.UserId,
	Enum.ThumbnailType.AvatarBust,
	Enum.ThumbnailSize.Size420x420
)

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(1,0,1,0)
Avatar.BackgroundTransparency = 1
Avatar.Image = thumb
Avatar.Parent = LogoFrame

Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1,0)

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 3
Stroke.Color = ROXO_PRINCIPAL
Stroke.Parent = Avatar

RunService.RenderStepped:Connect(function(dt)
	LogoFrame.Rotation += dt * 45
end)

-- TEXTO
local Nick = Instance.new("TextLabel")
Nick.Size = UDim2.new(0.4,0,0.05,0)
Nick.Position = UDim2.new(0.5,0,0.53,0)
Nick.AnchorPoint = Vector2.new(0.5,0)
Nick.BackgroundTransparency = 1
Nick.Text = "Usuario: "..player.Name
Nick.Font = Enum.Font.GothamBold
Nick.TextScaled = true
Nick.TextColor3 = ROXO_PRINCIPAL
Nick.Parent = Frame

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(0.6,0,0.05,0)
Sub.Position = UDim2.new(0.5,0,0.6,0)
Sub.AnchorPoint = Vector2.new(0.5,0)
Sub.BackgroundTransparency = 1
Sub.Text = "Entrando no Brookhaven..."
Sub.Font = Enum.Font.Gotham
Sub.TextScaled = true
Sub.TextColor3 = ROXO_MEDIO
Sub.Parent = Frame

-- BARRA
local BarBG = Instance.new("Frame")
BarBG.Size = UDim2.new(0.6,0,0.05,0)
BarBG.Position = UDim2.new(0.2,0,0.8,0)
BarBG.BackgroundColor3 = ROXO_ESCURO
BarBG.Parent = Frame
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(0.3,0)

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = ROXO_PRINCIPAL
Bar.Parent = BarBG
Instance.new("UICorner", Bar).CornerRadius = UDim.new(0.3,0)

local Percent = Instance.new("TextLabel")
Percent.Size = UDim2.new(0.6,0,0.05,0)
Percent.Position = UDim2.new(0.2,0,0.87,0)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.Font = Enum.Font.GothamBold
Percent.TextScaled = true
Percent.TextColor3 = Color3.new(1,1,1)
Percent.Parent = Frame

-- PROGRESSO
local totalTime = 5
for i = 1,100 do
	Bar.Size = UDim2.new(i/100,0,1,0)
	Percent.Text = i.."%"
	task.waitit(totalTime/100)
end

-- FINALIZA LOADING
task.waitit(0.5)
particlesRunning = false

for _,p in ipairs(Particles) do
	p:Destroy()
end

Sound:Stop()
ScreenGui:Destroy()

-- ================== HUB ==================
local redzlib = loadstring(game:HttpGet("https://pastefy.app/M2aZTZqd/raw"))()

local Window = redzlib:MakeWindow({
	Title = "Satoru hub | Brookhaven RP🏡",
	SubTitle = "by Guizera & Blackzin",
	SaveFolder = "Satoru Hub"
})

Window:AddMinimizeButton({
	Button = { Image = "rbxassetid://88484258784957", BackgroundTransparency = 0 },
	Corner = { CornerRadius = UDim.new(35, 1) },
})

local InfoTab = Window:MakeTab({ Title = "Info", Icon = "rbxassetid://15309138473" })



InfoTab:AddSection({ "Script Information" })
InfoTab:AddParagraph({ "Owner / Developer:", "Guizera & Blackzin" })
InfoTab:AddParagraph({ "Collaborations:", "Denolk" })
InfoTab:AddParagraph({ "You are using:", "Satoru Hub Brookhaven " })


InfoTab:AddSection({ "Rejoin" })
InfoTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Playersrs.LocalPlayersr)
    end
})




InfoTab:AddSection({"Redes Sociais🌟"})

InfoTab:AddDiscordInvite({
	Name = "Satoru Hub",
	Description = "Nosso servidor",
	Logo = "rbxassetid://125065349566984",
	Invite = "https://discord.gg/kMv3ZAfYC",
})

local function detectExecutor()
	if identifyexecutor then
		return identifyexecutor()
	elseif syn then
		return "Synapse X"
	elseif KRNL_LOADED then
		return "KRNL"
	elseif is_sirhurt_closure then
		return "SirHurt"
	elseif pebc_execute then
		return "ProtoSmasher"
	elseif getexecutorname then
		return getexecutorname()
	else
		return "Executor Desconhecido"
	end
end




 InfoTab:AddButton({
    Name = " - Copiar @ do TikTok",
    Callback = function()
      setclipboard("@Gui_official_007") -- Copia o @
      setclipboard("https://www.tiktok.com/@gui_official_007") -- Copia o link tambÃ©m, se quiser sÃ³ o @, remova esta linha
      
    end
  })


 

-- TAB FUN
local FunTab = Window:MakeTab({ Title = "Fun", Icon = "rbxassetid://7734068321" })

-- ======================
-- SPEED
-- ======================
FunTab:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 300,
    Default = 16,
    Increment = 1,
    Callback = function(Value)
        local player = game.Playersrs.LocalPlayersr
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")

        if hum then
            hum.WalkSpeed = Value
        end
    end
})

-- ======================
-- JUMP
-- ======================
FunTab:AddSlider({
    Name = "Jump",
    Min = 1,
    Max = 300,
    Default = 50,
    Increment = 1,
    Callback = function(Value)
        local player = game.Playersrs.LocalPlayersr
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")

        if hum then
            hum.JumpPower = Value
        end
    end
})


-- =========================
-- ESP SYSTEM (FIXED)
-- =========================
local Playersrs = game:GetService("Playersrs")
local LocalPlayersr = Playersrs.LocalPlayersr

local ESPEnabled = false
local ESPColor = Color3.fromRGB(255, 0, 0)
local ESPObjects = {}

-- Criar ESP em um jogador
local function CreateESP(player)
    if player == LocalPlayersr then return end
    if not player.Character then return end
    if ESPObjects[player] then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = ESPColor
    highlight.OutlineColor = ESPColor
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Adornee = player.Character
    highlight.Parent = player.Character

    ESPObjects[player] = highlight
end

-- Remover ESP de um jogador
local function RemoveESP(player)
    if ESPObjects[player] then
        ESPObjects[player]:Destroy()
        ESPObjects[player] = nil
    end
end

-- Atualizar todos os ESPs
local function UpdateESP()
    for _, player in pairs(Playersrs:GetPlayersrs()) do
        if ESPEnabled then
            CreateESP(player)
        else
            RemoveESP(player)
        end
    end
end

-- Atualizar cor
local function UpdateESPColor()
    for _, esp in pairs(ESPObjects) do
        esp.FillColor = ESPColor
        esp.OutlineColor = ESPColor
    end
end

-- Novos jogadores
Playersrs.PlayersrAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.waitit(1)
        if ESPEnabled then
            CreateESP(player)
        end
    end)
end)

-- =========================
-- UI CONTROLS
-- =========================

-- TOGGLE ESP
FunTab:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(Value)
        ESPEnabled = Value
        UpdateESP()
    end
})

-- DROPDOWN DE CORES
FunTab:AddDropdown({
    Name = "ESP Color",
    Options = {
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Purple",
        "Cyan",
        "White"
    },
    Callback = function(Value)
        if Value == "Red" then
            ESPColor = Color3.fromRGB(255, 0, 0)
        elseif Value == "Green" then
            ESPColor = Color3.fromRGB(0, 255, 0)
        elseif Value == "Blue" then
            ESPColor = Color3.fromRGB(0, 0, 255)
        elseif Value == "Yellow" then
            ESPColor = Color3.fromRGB(255, 255, 0)
        elseif Value == "Purple" then
            ESPColor = Color3.fromRGB(170, 0, 255)
        elseif Value == "Cyan" then
            ESPColor = Color3.fromRGB(0, 255, 255)
        elseif Value == "White" then
            ESPColor = Color3.fromRGB(255, 255, 255)
        end

        UpdateESPColor()
    end
})


-- ======================
-- SECTION: SCRIPTS
-- ======================
FunTab:AddSection({
    Name = "Scripts"
})

-- Infinite Yield
FunTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

-- Nameless Admin
FunTab:AddButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end
})
 

——————————————————
                                TAB: AVATAR
——————————————————
local Tab = Window:MakeTab({"Avatar", "rbxassetid://10734952036"})


local Section = Tab:AddSection({"Copy Avatar"})


local Playersrs = game:GetService("Playersrs")
local LocalPlayersr = Playersrs.LocalPlayersr
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local valor_do_nome_do_jogador
local Target = nil

local function GetPlayersrNames()
    local playerNames = {}
    for _, player in ipairs(Playersrs:GetPlayersrs()) do
        if player.Name ~= LocalPlayersr.Name then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = Tab:AddDropdown({
    Name = "Playersrs List",
    Description = "",
    Options = GetPlayersrNames(),
    Default = "",
    Flag = "player list",
    Callback = function(playername)
        valor_do_nome_do_jogador = playername
        Target = playername -- Conectar o dropdown ao Copy Avatar
    end
})

local function UptadePlayersrs()
    Dropdown:Set(GetPlayersrNames())
end

UptadePlayersrs()

Tab:AddButton({"Atualizar lista", function()
    UptadePlayersrs()
end})

Playersrs.PlayersrAdded:Connect(UptadePlayersrs)
Playersrs.PlayersrRemoving:Connect(UptadePlayersrs)

Tab:AddButton({
    Name = "Copy Avatar",
    Callback = function()
        if not Target then return end

        local LP = Playersrs.LocalPlayersr
        local LChar = LP.Character
        local TPlayersr = Playersrs:FindFirstChild(Target)

        if TPlayersr and TPlayersr.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayersr.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                -- RESETAR LOCALPLAYER
                local LDesc = LHumanoid:GetAppliedDescription()

                -- Remover acessÃ³rios, roupas e face atuais
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.waitit(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.waitit(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.waitit(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.waitit(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                -- Enviar partes do corpo
                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.waitit(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.waitit(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.waitit(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.waitit(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.waitit(0.3)
                    end
                end

                local SkinColor = TPlayersr.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.waitit(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.waitit(0.3)
                end

                -- Nome, bio e cor
                local Bag = TPlayersr:FindFirstChild("PlayersrsBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.waitit(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.waitit(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.waitit(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.waitit(0.3)
                    end
                end
            end
        end
    end
})

------------------------------------------------------------------------------------------------------------------------------------
local Section = Tab:AddSection({"Roupas 3D"})


local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Namespace para evitar conflitos
local AvatarManager = {}
AvatarManager.ReplicatedStorage = ReplicatedStorage

-- FunÃ§Ã£o para exibir notificaÃ§Ã£o
function AvatarManager:MostrarNotificacao(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Aviso",
            Text = mensagem,
            Duration = 5
        })
    end)
end

-- Tabela de avatares
AvatarManager.Avatares = {
    { Nome = "Gato de Manga", ID = 124948425515124 },
    { Nome = "Tung Saur", ID = 117098257036480 },
    { Nome = "Tralaleiro", ID = 99459753608381 },
    { Nome = "Monstro S.A", ID = 123609977175226 },
    { Nome = "Trenzinho", ID = 80468697076178 },
    { Nome = "Dino", ID = 11941741105 },
    { Nome = "Pou idoso", ID = 15742966010  },
    { Nome = "Coco/boxt@", ID = 77013984520332  },
    { Nome = "Coelho", ID = 71797333686800  },
    { Nome = "HipopÃ³tamo", ID = 73215892129281 },
    { Nome = "Ratatui", ID = 108557570415453 },
    { Nome = "Galinha", ID = 71251793812515 },
    { Nome = "Pepa pig", ID = 92979204778377 },
    { Nome = "pinguin", ID = 94944293759578 },
    { Nome = "Sid", ID = 87442757321244 },
    { Nome = "puga grande", ID = 111436158728716 },
    { Nome = "SHREK AMALDIÃ‡OADO", ID = 120960401202173 },
    { Nome = "mosquito grande", ID = 108052868536435 },
    { Nome = "Noob Invertido", ID = 106596990206151 },
    { Nome = "Pato(a)", ID = 135132836238349 },
    { Nome = "Cachorro Chihuahua", ID = 18656467256 },
    { Nome = "Gato sla", ID = 18994959003 },
    { Nome = "Gato fei ", ID = 77506186615650 },
    { Nome = "Inpostor", ID = 18234669337 },
    { Nome = "Simon amarelo", ID = 75183593514657 },
    { Nome = "Simon azul", ID = 76155710249925 }
    
}
-- FunÃ§Ã£o para obter os nomes dos avatares para o dropdown
function AvatarManager:GetAvatarNames()
    local nomes = {}
    for _, avatar in ipairs(self.Avatares) do
        table.insert(nomes, avatar.Nome)
    end
    return nomes
end

-- FunÃ§Ã£o para equipar o avatar
function AvatarManager:EquiparAvatar(avatarName)
    for _, avatar in ipairs(self.Avatares) do
        if avatar.Nome == avatarName then
            local args = { avatar.ID }
            local success, result = pcall(function()
                return self.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
            end)
            if success then
                self:MostrarNotificacao("Avatar " .. avatarName .. " equipado com sucesso!")
            else
                self:MostrarNotificacao("Falha ao equipar o avatar " .. avatarName .. "!")
            end
            return
        end
    end
    self:MostrarNotificacao("Avatar " .. avatarName .. " nÃ£o encontrado!")
end

-- Tab: Opção de Avatar
-- Dropdown para avatares
local AvatarDropdown = Tab3:AddDropdown({
    Name = "acessorios 3D",
    Description = "Selecione  para equipar",
    Default = nil,
    Options = AvatarManager:GetAvatarNames(),
    Callback = function(avatarSelecionado)
        _G.SelectedAvatar = avatarSelecionado
    end
})

-- BotÃ£o para equipar avatar
Tab:AddButton({
    Name = "equipar ",
    Description = "Equipar selecionado",
    Callback = function()
        if not _G.SelectedAvatar or _G.SelectedAvatar == "" then
            AvatarManager:MostrarNotificacao("Nenhum avatar selecionado!")
            return
        end
        AvatarManager:EquiparAvatar(_G.SelectedAvatar)
    end
})

-------------------------------------------------------------------------------------------------------------------------
local Section = Tab:AddSection({"Avatar Editor"})
-- BotÃ£o para equipar partes do corpo

Tab:AddParagraph({
    Title = "aviso vai resetar seu avatar",
    Content = ""
})

-- Cria um botÃ£o para equipar todas as partes do corpo
Tab:AddButton({
    Name = "Mini REPO",
    Callback = function()
        local args = {
            {
                117101023704825, -- Perna Direita
                125767940563838,  -- Perna Esquerda
                137301494386930,  -- Braço Direito
                87357384184710,  -- Braço Esquerdo
                133391239416999, -- Torso
                111818794467824   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})

---------------------------------------------------------------------------------------------------

Tab:AddButton({
    Name = "mini garanhao",
    Callback = function()
        local args = {
            {
                124355047456535, -- Perna Direita
                120507500641962,  -- Perna Esquerda
                82273782655463,  -- Braço Direito
                113625313757230,  -- Braço Esquerdo
                109182039511426, -- Torso
                0   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})

---------------------------------------------------------------------------------------------------

Tab:AddButton({
    Name = "stick",
    Callback = function()
        local args = {
            {
                14731384498, -- Perna Direita
                14731377938,  -- Perna Esquerda
                14731377894,  -- Braço Direito
                14731377875,  -- Braço Esquerdo
                14731377941, -- Torso
                14731382899   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})

---------------------------------------------------------------------------------------------------

Tab:AddButton({
    Name = "Chunky-Bug",
    Callback = function()
        local args = {
            {
                15527827600, -- Perna Direita
                15527827578,  -- Perna Esquerda
                15527831669,  -- Braço Direito
                15527836067,  -- Braço Esquerdo
                15527827184, -- Torso
                15527827599   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})

---------------------------------------------------------------------------------------------------

Tab:AddButton({
    Name = "Cursed-Spider",
    Callback = function()
        local args = {
            {
                134555168634906, -- Perna Direita
                100269043793774,  -- Perna Esquerda
                125607053187319,  -- Braço Direito
                122504853343598,  -- Braço Esquerdo
                95907982259204, -- Torso
                91289185840375   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})

---------------------------------------------------------------------------------------------------

Tab:AddButton({
    Name = "Possessed-Horror",
    Callback = function()
        local args = {
            {
                122800511983371, -- Perna Direita
                132465361516275,  -- Perna Esquerda
                125155800236527,  -- Braço Direito
                83070163355072,  -- Braço Esquerdo
                102906187256945, -- Torso
                78311422507297   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})


)
    end
})



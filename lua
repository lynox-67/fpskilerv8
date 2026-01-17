-- SERVICIOS
Jugadores locales = juego:GetService("Jugadores")
UIS local = juego:GetService("UserInputService")
RunService local = juego:GetService("RunService")
ServicioTeletransporte local = juego:ObtenerServicio("ServicioTeletransporte")
jugador local = Jugadores.JugadorLocal

-- GUI
interfaz gráfica de usuario local = Instancia.new("ScreenGui", jugador.PlayerGui)

marco local = Instancia.new("Marco", gui)
marco.Tamaño = UDim2.nuevo(0, 350, 0, 340)
marco.Posición = UDim2.new(0.3, 0, 0.3, 0)
marco.ColorDeFondo3 = Color3.deRGB(20,20,20)
marco.Activo = verdadero
marco.BorderSizePixel = 0

título local = Instancia.new("TextLabel", marco)
título.Tamaño = UDim2.new(1,0,0,35)
título.ColorDeFondo3 = Color3.deRGB(40,40,40)
title.Text = "Clonador de retraso de rzyx. ¡Únete para más scripts! https://discord.gg/3c7zMw7KqP"
título.TextScaled = verdadero
título.TextColor3 = Color3.new(1,1,1)

-- BOTÓN CERRAR
botón de cierre local = Instancia.new("Botón de texto", marco)
botónCerrar.Tamaño = UDim2.nuevo(0.1,0,0,30)
botónCerrar.Posición = UDim2.new(0.9, -5, 0, 5)
cerrarBotón.Texto = "X"
cerrarBotón.TextScaled = verdadero
cerrarBotón.ColorDeFondo3 = Color3.fromRGB(255,0,0)
closeButton.TextColor3 = Color3.nuevo(1,1,1)
botónCerrar.BorderSizePixel = 0

closeButton.MouseButton1Click:Conectar(función()
	gui:Destruir()
fin)

-- BOTONES
Botón de clonación local = Instancia.new("Botón de texto", marco)
Botón clon.Tamaño = UDim2.nuevo(0.8,0,0,40)
botón_clon.Posición = UDim2.new(0.1,0,0.15,0)
cloneButton.Text = "Clonar 200+ LAG"
cloneButton.TextScaled = verdadero
Botón clon.ColorDeFondo3 = Color3.fromRGB(170,0,255)
cloneButton.TextColor3 = Color3.new(1,1,1)

autoButton local = Instancia.new("TextButton", frame)
autoButton.Tamaño = UDim2.nuevo(0.8,0,0,40)
autoButton.Posición = UDim2.new(0.1,0,0.28,0)
autoButton.Text = "Spam automático activado/desactivado"
autoButton.TextScaled = verdadero
autoButton.ColorDeFondo3 = Color3.fromRGB(255,85,0)
autoButton.TextColor3 = Color3.new(1,1,1)

clearButton local = Instance.new("TextButton", frame)
clearButton.Tamaño = UDim2.nuevo(0.8,0,0,40)
clearButton.Posición = UDim2.new(0.1,0,0.41,0)
clearButton.Text = "Borrar clones"
clearButton.TextScaled = verdadero
clearButton.BackgroundColor3 = Color3.fromRGB(85,255,85)
clearButton.TextColor3 = Color3.new(0,0,0)

Botón de reincorporación local = Instancia.new("Botón de texto", marco)
Botón de reincorporación.Tamaño = UDim2.nuevo(0.8,0,0,40)
Botón de reincorporación.Posición = UDim2.new(0.1,0,0.54,0)
rejoinButton.Text = "REINICIARSE AL SERVIDOR"
Botón de reincorporación.TextScaled = verdadero
Botón de reincorporación.ColorDeFondo3 = Color3.fromRGB(0,170,255)
BotónReunirse.TextoColor3 = Color3.nuevo(1,1,1)

blackholeButton local = Instance.new("TextButton", frame)
Botón de agujero negro.Tamaño = UDim2.nuevo(0.8,0,0,40)
botónAgujeroNegro.Posición = UDim2.new(0.1,0,0.67,0)
blackholeButton.Text = "AGUJERO NEGRO"
blackholeButton.TextScaled = verdadero
BotónAgujeroNegro.ColorDeFondo3 = Color3.fromRGB(0,0,0)
botónAgujeroNegro.TextoColor3 = Color3.nuevo(1,1,1)

botón de bloqueo local = Instancia.new("Botón de texto", marco)
Botón de choque.Tamaño = UDim2.nuevo(0.8,0,0,40)
Botón de choque.Posición = UDim2.new(0.1,0,0.80,0)
crashButton.Text = "ACCIDENTE INSTANTÁNEO"
crashButton.TextScaled = verdadero
Botón de choque.ColorDeFondo3 = Color3.fromRGB(255,0,0)
Botón de choque.TextoColor3 = Color3.nuevo(0,0,0)

-- ARRASTRAR
hacer
	arrastre local, dragStart, startPos
	función local actualizar(entrada)
		delta local = entrada.Posición - dragStart
		marco.Posición = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	fin

	título.InputBegan:Connect(función(entrada)
		si input.UserInputType == Enum.UserInputType.MouseButton1 o input.UserInputType == Enum.UserInputType.Touch entonces
			arrastrando = verdadero
			dragStart = entrada.Posición
			startPos = frame.Position
		fin
	fin)

	UIS.InputChanged:Conectar(función(entrada)
		si arrastra y (input.UserInputType == Enum.UserInputType.MouseMovement o input.UserInputType == Enum.UserInputType.Touch) entonces
			actualizar(entrada)
		fin
	fin)

	UIS.InputEnded:Connect(función(entrada)
		si input.UserInputType == Enum.UserInputType.MouseButton1 o input.UserInputType == Enum.UserInputType.Touch entonces
			arrastrando = falso
		fin
	fin)
fin

-- SISTEMA DE CLONACIÓN
lista de clones locales = {}
autoSpamming local = falso

función local spawnChaosClones(count)
	char local = jugador.Carácter o jugador.CarácterAñadido:Espera()
	Si no es char entonces devuelve fin
	char.Archivable = verdadero
	raíz local = char:FindFirstChild("ParteRaízHumanoid")
	Si no es root entonces devuelve fin

	para i = 1, contar hacer
		tarea.esperar(0.005)
		clon local = char:Clone()
		clone.Nombre = "ChaosClone_" .. (#cloneList + 1)

		para _,v en ipairs(clone:GetDescendants()) hacer
			si v:IsA("Script") o v:IsA("LocalScript") entonces
				v:Destruir()
			fin
			si v:IsA("BasePart") entonces
				v.CanCollide = verdadero
				v.Sin masa = falso
			fin
		fin

		clon.HumanoidRootPart.CFrame =
			raíz.CFrame * CFrame.new(matemática.aleatorio(-3,3), matemática.aleatorio(0,3), -5)

		bv local = Instancia.new("BodyVelocity")
		bv.Velocity = Vector3.new(math.random(-60,60), math.random(20,60), math.random(-60,60))
		bv.MaxForce = Vector3.new(1e6,1e6,1e6)
		bv.Parent = clone.HumanoidRootPart

		clone.Parent = espacio de trabajo
		tabla.insertar(cloneList, clonar)
	fin
fin

cloneButton.MouseButton1Click:Conectar(función()
	spawnCaosClones(220)
fin)

autoButton.MouseButton1Click:Conectar(función()
	autoSpamming = no autoSpamming
fin)

clearButton.MouseButton1Click:Conectar(función()
	para _,c en ipairs(cloneList) hacer
		si c y c.Padre entonces c:Destruir() fin
	fin
	lista de clones = {}
fin)

tarea.spawn(función()
	mientras que es cierto
		tarea.esperar(0.05)
		Si se envía spam automático entonces
			spawnCaosClones(50)
		fin
	fin
fin)

-- AGUJERO NEGRO
agujero negro localActivo = falso
blackholePart local = Instance.new("Part", espacio de trabajo)
blackholePart.Size = Vector3.new(2,2,2)
blackholePart.Anchored = verdadero
blackholePart.CanCollide = falso
blackholePart.Material = Enumeración.Material.Neón
blackholePart.Color = Color3.fromRGB(0,0,0)

blackholeButton.MouseButton1Click:Conectar(función()
	Si blackholeActive entonces devuelve fin
	blackholeActive = verdadero
	tarea.spawn(función()
		mientras blackholeActive lo hace
			tarea.esperar(0.05)
			blackholePart.Position = espacio de trabajo.CurrentCamera.CFrame.Position
			para _,obj en ipairs(workspace:GetChildren()) hacer
				si obj:IsA("Modelo") y obj.Nombre:find("ChaosClone_") entonces
					hrp local = obj:FindFirstChild("ParteRaízHumanoid")
					si hrp entonces
						hrp.Velocity = (blackholePart.Position - hrp.Position).Unit * 200
					fin
				fin
			fin
		fin
	fin)
fin)

-- CHOCAR
crashButton.MouseButton1Click:Conectar(función()
	mientras que es cierto
		tarea.spawn(función()
			local p = Instancia.new("Parte", espacio de trabajo)
			p.Tamaño = Vector3.nuevo(100,100,100)
			p.Anclado = falso
			p.CanCollide = verdadero
			p.Position = espacio de trabajo.CurrentCamera.CFrame.Position + Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
		fin)
	fin
fin)

-- REUNIRSE AL MISMO SERVIDOR
rejoinButton.MouseButton1Click:Conectar(función()
	TeleportService:TeleportToPlaceInstance(juego.PlaceId, juego.JobId, jugador)
fin)-- ==========================
-- SISTEMA DE LLAVES
-- =========================

local correctKey = "lynox" -- CAMBIE SU CLAVE AQUÍ

-- Ocultar el menú principal al inicio
marco.Visible = falso

fotograma clave local = Instancia.new("Frame", gui)
fotograma clave.Tamaño = UDim2.nuevo(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
fotograma clave.ColorDeFondo3 = Color3.fromRGB(30,30,30)
fotograma clave.BorderSizePixel = 0

Título de clave local = Instancia.new("TextLabel", fotograma clave)
Título_clave.Tamaño = UDim2.nuevo(1,0,0,35)
TítuloClave.ColorDeFondo3 = Color3.fromRGB(45,45,45)
keyTitle.Text = "Introducir tecla"
keyTitle.TextScaled = verdadero
keyTitle.TextColor3 = Color3.nuevo(1,1,1)

keyBox local = Instancia.new("Cuadro de texto", fotograma clave)
keyBox.Tamaño = UDim2.nuevo(0.85,0,0,35)
keyBox.Position = UDim2.new(0.075,0,0.35,0)
keyBox.PlaceholderText = "Clave aquí..."
keyBox.Texto = ""
keyBox.TextScaled = verdadero
keyBox.ColorDeFondo3 = Color3.fromRGB(60,60,60)
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.ClearTextOnFocus = falso

estado de clave local = Instancia.new("TextLabel", fotograma clave)
keyStatus.Size = UDim2.new(1,0,0,20)
keyStatus.Position = UDim2.new(0,0,0.6,0)
keyStatus.BackgroundTransparency = 1
EstadoDeLaClave.Texto = ""
keyStatus.TextScaled = verdadero
keyStatus.TextColor3 = Color3.fromRGB(255,0,0)

botón_de_tecla local = Instancia.new("Botón_de_texto", fotograma_clave)
botón_clave.Tamaño = UDim2.nuevo(0.5,0,0,30)
botón_clave.Posición = UDim2.new(0.25,0,0.75,0)
keyButton.Text = "Enviar"
keyButton.TextScaled = verdadero
botón_clave.ColorDeFondo3 = Color3.deRGB(0,170,255)
keyButton.TextColor3 = Color3.nuevo(1,1,1)

keyButton.MouseButton1Click:Conectar(función()
	si keyBox.Text == correctKey entonces
		fotograma clave:Destruir()
		marco.Visible = verdadero
	demás
		keyStatus.Text = "Clave incorrecta"
	fin
fin)-- OBTENER BOTÓN LLAVE (NUR HINZUGEFÜGT)

local getKeyButton = Instance.new("TextButton", keyFrame)
obtenerBotónTecla.Tamaño = UDim2.nuevo(0.5,0,0,30)
getKeyButton.Position = UDim2.new(0.25,0,1.05,0) - bajo Enviar
getKeyButton.Text = "Obtener clave"
obtenerKeyButton.TextScaled = verdadero
obtenerBotónClave.ColorDeFondo3 = Color3.deRGB(120,0,255)
obtenerBotónTecla.TextoColor3 = Color3.nuevo(1,1,1)

getKeyButton.MouseButton1Click:Conectar(función()
	Si se establece el portapapeles, entonces
		setclipboard("https://discord.gg/3c7zMw7KqP") -- HIER DEIN DISCORD
	fin
fin)

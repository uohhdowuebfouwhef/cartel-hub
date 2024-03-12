local username = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", username.PlayerGui)
gui.Name = "OutputGui"
local Outputs = Instance.new("ScrollingFrame",gui)
Outputs.Visible=false
Outputs.BackgroundColor3=Color3.new(0,0,0)
Outputs.BorderColor3=Color3.new(0,0,0)
Outputs.BorderSizePixel=0
Outputs.Position = UDim2.new(.675,0,.725,0)
Outputs.Size=UDim2.new(.3,0,.2,0)
Outputs.CanvasSize=UDim2.new(1.2,0,2,0)
Outputs.ScrollBarThickness=6
Outputs.ScrollingEnabled=true
Outputs.CanvasPosition = Vector2.new(0, 10000)
local Output = function(text)
local color = Color3.new(1,1,1)
local outputList = Outputs:GetChildren()
for i,v in next,Outputs:GetChildren() do
if v:IsA("StringValue") then
table.remove(outputList, i)
else
v.Position = v.Position - UDim2.new(0,0,v.Size.Y.Scale/10,0)
end
end
local NewOutputLine = Instance.new("TextLabel",Outputs)
NewOutputLine.Text = text
NewOutputLine.Size = UDim2.new(1,0,.15,0)
NewOutputLine.Position = UDim2.new(0,0,.985,0)
NewOutputLine.Font = "SourceSansBold"
NewOutputLine.TextColor3 = color
NewOutputLine.TextStrokeTransparency = 0
NewOutputLine.BackgroundTransparency = 1
NewOutputLine.BorderSizePixel = 0
NewOutputLine.FontSize = "Size14"
NewOutputLine.TextXAlignment = "Left"
NewOutputLine.TextYAlignment = "Top"
NewOutputLine.ClipsDescendants = true
NewOutputLine.Name = "OutputLine"
end
local Visible = false
local Open_Close = Instance.new("TextButton",gui)
Open_Close.BackgroundColor3=Color3.new(0,0,0)
Open_Close.BackgroundTransparency=0.5
Open_Close.BorderColor3=Color3.new(0,0,0)
Open_Close.BorderSizePixel=0
Open_Close.Position=UDim2.new(.675,0,.9,0)
Open_Close.Size=UDim2.new(.3,0,.025,0)
Open_Close.Font=Enum.Font.SourceSansBold
Open_Close.FontSize=Enum.FontSize.Size12
Open_Close.Text="Chat Gui - Open"
Open_Close.TextColor3=Color3.new(255,255,255)
Open_Close.TextStrokeColor3=Color3.new(255,255,255)
Open_Close.TextStrokeTransparency=1
Open_Close.MouseButton1Click:connect(function()
if Visible == false then
Outputs.Visible = true
Open_Close.Position = UDim2.new(.675, 0, .7, 0)
Open_Close.Text = "Chat Gui - Close"
Visible = true
else
Outputs.Visible = false
Open_Close.Position = UDim2.new(.675, 0, .9, 0)
Open_Close.Text = "Chat Gui - Open"
Visible = false
end
end)
for _,plr in next,game.Players:GetChildren() do
  if not plr:IsA("Player") then return end
  plr.Chatted:connect(function(msg)
      Output(plr.Name .. ": " .. msg)
  end)
end
game.Players.PlayerAdded:connect(function(plr)
  plr.Chatted:connect(function(msg)
      Output(plr.Name .. ": " .. msg)
  end)
end)
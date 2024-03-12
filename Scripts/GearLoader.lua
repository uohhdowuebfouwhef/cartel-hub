--[[
	Here are some id's:
	Rainbow Magic Carpet: 477910063
	Robot Dance Gun: 467138029
	Golden Steampunk Gloves: 243790334
	Airstrike: 88885539
	Flashbang: 16979083
	Hyperlaser Gun: 130113146
	Subspace Tripmine: 11999247
]]--
wait(3)
local username = game.Players.LocalPlayer.Name
local assetid = 0 --put assetid here
local IS = game:GetService("InsertService")
asset = IS:LoadAsset(assetid)
for i,v in pairs(asset:GetChildren()) do
	if v:IsA("Tool") then
		v.Parent = game.Players:WaitForChild(username).Backpack
	end
end

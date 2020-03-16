AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')     

function ENT:Initialize()     	
	self.Entity:SetModel("models/props_lab/jar01a.mdl")  	
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	
	local Phys = self.Entity:GetPhysicsObject()  
	
	if (Phys:IsValid()) then  		
		Phys:Wake()  	
	end
	
	self:SetEntityLabel()
end

function ENT:Think()
	self:SetEntityLabel()
	
	self.Entity:NextThink(CurTime() + 1)
	
	return true
end

function ENT:Use(Activator, Caller)
	if (SERVER) then
		local Player = Activator:IsPlayer()
		
		if (Player) then
			SS.Points.Gain(Activator, self.Entity.Amount)
			
			SS.PlayerMessage(Activator, "You've scraped out "..self.Entity.Amount.." "..SS.Config.Request("Points").."!", 0)
			
			self.Entity:Remove()
		end
	end
end
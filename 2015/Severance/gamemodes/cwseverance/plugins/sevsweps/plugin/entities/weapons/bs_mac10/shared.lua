if (SERVER) then

	AddCSLuaFile( "shared.lua" );

end

if (CLIENT) then

--[[ Basic SWEP Information to display to the client. ]]--

	SWEP.PrintName			= "MAC 10"			
	SWEP.Author				= "Zig"
	SWEP.Purpose			= "A firearm used to harm beings."
	SWEP.Instructions		= "Press LMB to fire and R to reload."
	SWEP.Contact				= "Cloudsixteen.com"
	SWEP.CSMuzzleFlashes = true; -- Use Counter-Strike muzzle flashes?

end;


--[[ Set whether the SWEP is spawnable (by users or by admins). --]]

SWEP.Spawnable = true;
SWEP.AdminSpawnable	= true;

--[[ Misc. SWEP Content --]]

SWEP.HoldType			= "smg"
SWEP.Base				= "bs_base"
SWEP.Category			= "Backsword"
SWEP.ViewModelFOV = 50
SWEP.ViewModelFlip = false; -- Some view models are incorrectly flipped.
SWEP.UseHands = true;

SWEP.ViewModel			= "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel			= "models/weapons/w_smg_mac10.mdl"

SWEP.DrawAmmo = true; -- Draw our own ammo display?
SWEP.DrawCrosshair = false; -- Draw the crosshair, or draw our own?

SWEP.Weight	= 5
SWEP.AutoSwitchTo = false;
SWEP.AutoSwitchFrom	= false;

--[[ Set the SWEP's primary fire information. --]]

SWEP.Primary.DefaultClip = 50;
SWEP.Primary.ClipSize = 40;
SWEP.Primary.Automatic = true;
SWEP.Primary.NumShots = 1;
SWEP.Primary.Damage	= 10;
SWEP.Primary.Recoil	= 0.50;
SWEP.Primary.Sound		= Sound("weapons/smg/gunfire/smg_fire_1.wav")
SWEP.Primary.Delay = 0.065;
SWEP.Primary.Ammo = "pistol";
SWEP.Primary.Cone = 0.02;

--[[ Set the SWEP's primary fire information. --]]

SWEP.Secondary.DefaultClip = -1;
SWEP.Secondary.ClipSize	= -1;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.Ammo	= "none";

--[[ Define the bullet information for later use. --]]

SWEP.BulletTracerFreq = 1; -- Show a tracer every x bullets.
SWEP.BulletTracerName = nil -- Use a custom effect for the tracer.
SWEP.BulletForce = 5;

--[[ Set up the ironsight's position and angles. --]]

SWEP.IronSightsPos = Vector(-9.634, -3.016, 2.579)
SWEP.IronSightsAng = Vector(1.781, -5.437, -7.599)

--[[ Set up the accuracy for the weapon. --]]

SWEP.CrouchCone				= 0.03 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.05 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.025 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.020 -- Accuracy when we're standing still

	/**************************
		Initialize/cache
	**************************/

function SWEP:Initialize()
util.PrecacheSound(self.Primary.Sound) 
        self:SetWeaponHoldType( self.HoldType )
end 

	/**************************
		Primary Attack
	**************************/

function SWEP:PrimaryAttack()
 
if ( !self:CanPrimaryAttack() ) then return end

	self.Weapon:EmitSound(self.Primary.Sound);
	
		self:HandleBullets(self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone);
	self:TakePrimaryAmmo(1);

self:ShootEffects()

self:EmitSound(Sound(self.Primary.Sound)) 
 
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
self:SetNextSecondaryFire( CurTime() + self.Primary.Delay ) 
end

	/**************************
		Deploy
	**************************/

function SWEP:Deploy()
	self:SendWeaponAnim( ACT_VM_DRAW )
		self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() )
	return true
end 

	/**************************
		Reload
	**************************/

function SWEP:Reload()
 if ( self:Clip1() ~= self.Primary.ClipSize and self:Ammo1() ~= 0 ) then
        self.Weapon:DefaultReload( ACT_VM_RELOAD );
end
end
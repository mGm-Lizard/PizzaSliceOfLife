//=============================================================================
// The pizza slice...of life...hehe
//=============================================================================
class PizzaSlice extends TournamentHealth;

#exec obj load file=StaticMeshes/LeeMeshes.usx package=PizzaSlice.LeeMeshes

auto state Pickup
{
	function Touch( actor Other )
	{
		local Pawn P;

		if ( ValidTouch(Other) )
		{
			P = Pawn(Other);
            if ( P.GiveHealth(HealingAmount, GetHealMax(P)) || (bSuperHeal && !Level.Game.bTeamGame) )
            {
			    P.ReceiveLocalizedMessage(MessageClass,,,,Self);
				AnnouncePickup(P);
                SetRespawn();
            }
		}
	}
}

defaultproperties
{
     HealingAmount=50
     bSuperHeal=True
     MaxDesireability=0.300000
	 PickupMessage="You ate a pizza slice...of life!! +"
     PickupSound=Sound'PickupSounds.HealthPack'
     PickupForce="HealthPack"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'PizzaSlice.LeeMeshes.SliceMesh'
     CullDistance=4500.000000
     Physics=PHYS_Rotating
     DrawScale=0.060000
	 DrawScale3D=(X=10.000000,Y=10.000000,Z=10.000000)
     ScaleGlow=0.600000
     Style=STY_AlphaZ
     CollisionRadius=24.000000
     RotationRate=(Yaw=24000)
	 MessageClass=class'PizzaSlicePickupMessage'
}

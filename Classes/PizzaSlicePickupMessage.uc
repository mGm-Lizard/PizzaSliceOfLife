//=============================================================================
//
// Message that appears when you pick up a pizza slice.
//
//=============================================================================
class PizzaSlicePickupMessage extends LocalMessage;

static function string GetString(
    optional int Switch,
    optional PlayerReplicationInfo RelatedPRI_1,
    optional PlayerReplicationInfo RelatedPRI_2,
    optional Object OptionalObject
    )
{
    if ( PizzaSlice(OptionalObject) != None )
        return class'PizzaSlice'.default.PickupMessage$String(PizzaSlice(OptionalObject).HealingAmount);
    return "";
}

static function ClientReceive(
    PlayerController P,
    optional int Switch,
    optional PlayerReplicationInfo RelatedPRI_1,
    optional PlayerReplicationInfo RelatedPRI_2,
    optional Object OptionalObject
    )
{
    if(PizzaSlice(OptionalObject) == None) { return; }
	
	if ( P.myHud != None )
		P.myHUD.LocalizedMessage( Default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    if ( P.DemoViewer != None )
		P.DemoViewer.myHUD.LocalizedMessage( Default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject );
}

defaultproperties
{
     bFadeMessage=True
	 Lifetime=3
     PosX=0.500000
     PosY=0.830000
     bIsConsoleMessage=False
}


if (count (nearestObjects [position _this, ["LandVehicle","Air"], 10]) > 0) exitWith {hint "Clear the area before mounting the FOB";hint str((nearestObjects [position _this, ["LandVehicle","Air"], 10]));};

closeDialog 0;

_mat = _this;

btc_fob_dlg = false;

createDialog "btc_fob_create";

waitUntil {dialog};

while {!btc_fob_dlg} do
{
	if !(dialog) then {hint "Do not close the dialog with esc";createDialog "btc_fob_create";};
	sleep 0.1;
};

if (ctrlText 777 == "") exitWith {closeDialog 0;hint "Name your FOB!";_mat spawn btc_fnc_fob_create;};

hint "Get back! Mounting FOB";

_name = ctrlText 777;

closeDialog 0;

[[_mat,_name],"btc_fnc_fob_create_s",false] spawn BIS_fnc_MP;
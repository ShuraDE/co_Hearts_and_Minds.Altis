_veh = _this select 0;
_damage = _this select 2;

if !(canMove _veh) then 
{
	btc_civ_veh_active = btc_civ_veh_active - 1;
	[_veh,(_veh getVariable ["driver",_veh])] spawn 
	{
		waitUntil {sleep 5; ({_x distance (_this select 0) < 600} count playableUnits == 0)};
		{deleteVehicle _x;} foreach _this;
	};
};

_damage
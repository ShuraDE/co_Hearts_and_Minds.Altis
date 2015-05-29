_ied = btc_int_target;

[btc_ied_check_time,"Disarming IED . . .",_ied] call btc_fnc_int_action_result;

waitUntil {!(isNil "btc_int_action_result")};

if (btc_int_action_result) then
{
	_ratio = 20;
	if (player call btc_fnc_is_engineer) then {_ratio = 75;};
	if ("ACE_DefusalKit" in Items player) then {_ratio = _ratio + 20;};	
	
	if (btc_debug) then {player sideChat format ["IED disarm with %1",_ratio];};
	if (btc_debug_log) then {diag_log format ["IED disarm with %1",_ratio];};	
	
	if (random 100 > _ratio) then {[_ied,"btc_fnc_ied_boom",false] spawn BIS_fnc_MP;} else
	{
		hint "IED disarmed!";
		[[_ied,"active",false],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;
		[btc_rep_bonus_disarm,"btc_fnc_rep_change",false] spawn BIS_fnc_MP;
	};
};

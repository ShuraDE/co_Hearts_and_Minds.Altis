/*
mapAnimAdd [1, 0.2, [0,0]]; mapAnimCommit;*/

closeDialog 0;

btc_int_ask_data = nil;

[[6,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

if (count btc_int_ask_data == 0) exitWith {hint "No FOBs deployed";};

_fobs = btc_int_ask_data;

forceMap true;

btc_fob_dlg = false;

createDialog "btc_fob_redeploy";

waitUntil {dialog};

_idc = 778;
if (btc_p_redeploy_base) then {lbAdd [ _idc, "Base"];};

{_index = lbAdd [ _idc, _x ];} foreach _fobs;

lbSetCurSel [_idc, 0];

while {!btc_fob_dlg} do
{
	if !(dialog) then {hint "Do not close the dialog with esc";createDialog "btc_fob_redeploy";if (btc_p_redeploy_base) then {lbAdd [ _idc, "Base"];};{_index = lbAdd [ _idc, _x ];} foreach _fobs;lbSetCurSel [_idc, 0];};
	sleep 0.1;
};

_fob = lbText [_idc, lbCurSel _idc];

_marker = lbText [_idc, lbCurSel _idc];

if (_marker == "Base") then {_marker = "respawn_west";};

forceMap false;

closeDialog 0;

_pos = getMarkerPos _marker;

_text = format ["Moving to %1",_fob];

titleText [_text, "BLACK OUT"];
sleep 3;
titleText [_text, "BLACK FADED"];
player setPosATL [_pos select 0,_pos select 1,0.45];
sleep 2;
titleText ["", "BLACK IN"];
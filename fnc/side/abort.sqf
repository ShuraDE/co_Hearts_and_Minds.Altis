closeDialog 0;
if (isServer) then
{
	btc_side_aborted = true;
} else {[[],"btc_fnc_side_abort",false] spawn BIS_fnc_MP;};
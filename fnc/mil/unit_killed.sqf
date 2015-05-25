if (isNil {_this getVariable "btc_eh_killed_assigned"}) then
{
	_this addEventHandler ["Killed",btc_fnc_mil_eh_killed];
	_this setVariable ["btc_eh_killed_assigned",true];
};
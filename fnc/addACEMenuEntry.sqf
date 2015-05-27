/* https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_addActionToClass.sqf
 * Insert an ACE action to a class, under a certain path

 * https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_addActionToObject.sqf
 * Insert an ACE action to an object, under a certain config path

 * https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_createAction.sqf
 * Creates an isolated ACE action
*/

/*
*  Create Action for INTEL, EXPLOSIVE and SIDEMISSION
*/

//Intel: Search on OPFOR, ask for CIV
 _actionIntelSearch = ["SearchIntel", "Search for Intel", "", {btc_int_target = cursorTarget; [] spawn btc_fnc_info_search_for_intel}, {(!Alive cursorTarget);}] call ace_interact_menu_fnc_createAction; 
 _actionIntelAsk = ["AskIntel", "Ask for Intel", "", {cursorTarget spawn btc_fnc_info_ask;}, {(side cursorTarget == civilian && {cursorTarget isKindOf 'Civilian_F'} && Alive cursorTarget);}] call ace_interact_menu_fnc_createAction;

//Explosives: Check, Disarm
 _actionCheckIED = ["CheckIED", "Check for IED", "", {btc_int_target = cursorTarget; btc_int_target spawn btc_fnc_ied_check_for;}, {true;}] call ace_interact_menu_fnc_createAction;
 _actionDisarmIED = ["DisarmIED", "Disarm IED", "", {btc_int_target = cursorTarget; btc_int_target spawn btc_fnc_ied_disarm;}, {true;}] call ace_interact_menu_fnc_createAction;

//Sidemission: Request, Abort
 _actionMissionRequest = ["MissionRequest", "Request Sidemission", "", {[] spawn btc_fnc_side_request;}, {!btc_side_assigned;}] call ace_interact_menu_fnc_createAction;
 _actionMissionAbort = ["MissionAbort", "Abort Sidemission", "", {[] spawn btc_fnc_side_abort;}, {btc_side_assigned;}] call ace_interact_menu_fnc_createAction;
   
   
   
/*
*  Append Action to Interactionmenü
*  
* //TODO: Explosives @ SeltInteractioMenü atm change to spawned IED Object!
*/
   
   
/* CIV and ENEMY in define.sqf definiert */ 
_TypesForSideMission = ["B_officer_F","B_Soldier_TL_F"];
_TypesExplosiveBLUFOR = ["B_soldier_exp_F"];
{
	[_x, 0, ["ACE_MainActions"], _actionIntelSearch] call ace_interact_menu_fnc_addActionToClass;
}forEach btc_type_units;

{
	[_x, 0, ["ACE_MainActions"], _actionIntelAsk] call ace_interact_menu_fnc_addActionToClass;
}forEach btc_civ_type_units;

{
	[_x, 1, ["ACE_SelfActions"], _actionCheckIED] call ace_interact_menu_fnc_addActionToClass;
	[_x, 1, ["ACE_SelfActions"], _actionDisarmIED] call ace_interact_menu_fnc_addActionToClass;
} forEach _TypesExplosiveBLUFOR;

{
	[_x, 1, ["ACE_SelfActions"], _actionMissionRequest] call ace_interact_menu_fnc_addActionToClass;
	[_x, 1, ["ACE_SelfActions"], _actionMissionAbort] call ace_interact_menu_fnc_addActionToClass;
} forEach _TypesForSideMission;

/* https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_addActionToClass.sqf
 * Insert an ACE action to a class, under a certain path

 * https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_addActionToObject.sqf
 * Insert an ACE action to an object, under a certain config path

 * https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_createAction.sqf
 * Creates an isolated ACE action
*/


//Add Search Intel (dead bodies)
 _actionIntelSearch = ["SearchIntel", "Search for Intel", "", {btc_int_target = cursorTarget; [] spawn btc_fnc_info_search_for_intel}, {(!Alive cursorTarget);}] call ace_interact_menu_fnc_createAction; 
//Add Ask Intel (civilians)
 _actionIntelAsk = ["AskIntel", "Ask for Intel", "", {cursorTarget spawn btc_fnc_info_ask;}, {(side cursorTarget == civilian && {cursorTarget isKindOf 'Civilian_F'} && Alive cursorTarget);}] call ace_interact_menu_fnc_createAction;

//Add Search Explosives
 _actionCheckIED = ["CheckIED", "Check for IED", "", {btc_int_target = cursorTarget; btc_int_target spawn btc_fnc_ied_check_for;}, {true;}] call ace_interact_menu_fnc_createAction;
//Disarm Explosives
 _actionDisarmIED = ["DisarmIED", "Disarm IED", "", {btc_int_target = cursorTarget; btc_int_target spawn btc_fnc_ied_disarm;}, {true;}] call ace_interact_menu_fnc_createAction;

//Sidemission, Request
 _actionMissionRequest = ["MissionRequest", "Request Sidemission", "", {[] spawn btc_fnc_side_request;}, {!btc_side_assigned;}] call ace_interact_menu_fnc_createAction;
//Siemission, Abort 
 _actionMissionAbort = ["MissionAbort", "Abort Sidemission", "", {[] spawn btc_fnc_side_abort;}, {btc_side_assigned;}] call ace_interact_menu_fnc_createAction;
   
   
/* in define.sqf definiert */ 
//_A3_Characters_F_Gamma = ["B_soldier_PG_F","B_soldier_UAV_F","B_Story_Engineer_F", "B_Story_Colonel_F", "B_Story_Pilot_F", "B_Story_Tank_Commander_F", "I_soldier_UAV_F", "I_Story_Colonel_F", "O_soldier_PG_F", "O_soldier_UAV_F", "O_Story_Colonel_F", "O_Story_CEO_F", "O_soldierU_AA_F", "O_soldierU_AAA_F", "O_SoldierU_SL_F", "O_soldierU_medic_F", "O_soldierU_A_F", "O_SoldierU_GL_F", "C_man_2_2_F_afro", "C_man_2_2_F_euro", "C_man_2_2_F_asia", "I_G_Soldier_A_F", "I_G_Story_SF_Captain_F", "I_G_Story_Protagonist_F", "I_G_resistanceLeader_F", "I_G_resistanceCommander_F", "O_soldierU_repair_F", "O_soldierU_exp_F", "O_engineer_U_F", "O_soldierU_M_F", "I_G_Soldier_F", "I_G_Soldier_lite_F", "I_G_Soldier_SL_F", "I_G_Soldier_TL_F", "I_G_Soldier_AR_F", "I_G_medic_F", "I_G_engineer_F", "I_G_Soldier_exp_F", "I_G_Soldier_GL_F", "I_G_Soldier_M_F", "I_G_Soldier_LAT_F", "I_G_Soldier_A_F", "I_G_officer_F", "B_G_Soldier_F", "B_G_Soldier_lite_F", "B_G_Soldier_SL_F", "B_G_Soldier_TL_F", "B_G_Soldier_AR_F", "B_G_medic_F", "B_G_engineer_F", "B_G_Soldier_exp_F", "B_G_Soldier_GL_F", "B_G_Soldier_M_F", "B_G_Soldier_LAT_F", "B_G_Soldier_A_F", "B_G_officer_F", "O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F", "O_G_Soldier_TL_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_engineer_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_LAT_F", "O_G_Soldier_A_F", "O_G_officer_F"];
//_A3_Characters_F_Civil = ["C_man_1", "C_man_p_fugitive_F", "C_man_p_fugitive_F_afro", "C_man_p_fugitive_F_euro", "C_man_p_fugitive_F_asia", "C_man_p_beggar_F", "C_man_p_beggar_F_afro", "C_man_p_beggar_F_euro", "C_man_p_beggar_F_asia", "C_man_p_scavenger_1_F", "C_man_p_scavenger_1_F_afro", "C_man_p_scavenger_1_F_euro", "C_man_p_scavenger_1_F_asia", "C_man_p_scavenger_2_F", "C_man_p_scavenger_2_F_afro", "C_man_p_scavenger_2_F_euro", "C_man_p_scavenger_2_F_asia", "C_man_w_farmer_1_F", "C_man_w_fisherman_1_F", "C_man_w_farmer_2_F", "C_man_w_fisherman_2_F", "C_man_w_worker_F", "C_man_hunter_1_F", "C_man_hunter_2_F", "C_man_1_1_F", "C_man_1_1_F_afro", "C_man_1_1_F_euro", "C_man_1_1_F_asia", "C_man_1_2_F", "C_man_1_2_F_afro", "C_man_1_2_F_euro", "C_man_1_2_F_asia", "C_man_1_3_F", "C_man_1_3_F_afro", "C_man_1_3_F_euro", "C_man_1_3_F_asia", "C_man_2_1_F", "C_man_2_1_F_afro", "C_man_2_1_F_euro", "C_man_2_1_F_asia", "C_man_2_2_F", "C_man_2_3_F", "C_man_2_3_F_afro", "C_man_2_3_F_euro", "C_man_2_3_F_asia", "C_man_3_1_F", "C_man_3_1_F_afro", "C_man_3_1_F_euro", "C_man_3_1_F_asia", "C_man_shepherd_F", "C_man_p_scavenger_3_F", "C_man_p_scavenger_3_F_afro", "C_man_p_scavenger_3_F_euro", "C_man_p_scavenger_3_F_asia", "C_man_4_1_F", "C_man_4_1_F_afro", "C_man_4_1_F_euro", "C_man_4_1_F_asia", "C_man_4_2_F", "C_man_4_2_F_afro", "C_man_4_2_F_euro", "C_man_4_2_F_asia", "C_man_4_3_F", "C_man_4_3_F_afro", "C_man_4_3_F_euro", "C_man_4_3_F_asia", "C_man_priest_F", "C_man_p_shorts_1_F", "C_man_p_shorts_1_F_afro", "C_man_p_shorts_1_F_euro", "C_man_p_shorts_1_F_asia", "C_man_p_shorts_2_F", "C_man_p_shorts_2_F_afro", "C_man_p_shorts_2_F_euro", "C_man_p_shorts_2_F_asia", "C_man_shorts_1_F", "C_man_shorts_1_F_afro", "C_man_shorts_1_F_euro", "C_man_shorts_1_F_asia", "C_man_shorts_2_F", "C_man_shorts_2_F_afro", "C_man_shorts_2_F_euro", "C_man_shorts_2_F_asia", "C_man_shorts_3_F", "C_man_shorts_3_F_afro", "C_man_shorts_3_F_euro", "C_man_shorts_3_F_asia", "C_man_shorts_4_F", "C_man_shorts_4_F_afro", "C_man_shorts_4_F_euro", "C_man_shorts_4_F_asia", "C_man_pilot_F", "C_man_polo_1_F", "C_man_polo_1_F_afro", "C_man_polo_1_F_euro", "C_man_polo_1_F_asia", "C_man_polo_2_F", "C_man_polo_2_F_afro", "C_man_polo_2_F_euro", "C_man_polo_2_F_asia", "C_man_polo_3_F", "C_man_polo_3_F_afro", "C_man_polo_3_F_euro", "C_man_polo_3_F_asia", "C_man_polo_4_F", "C_man_polo_4_F_afro", "C_man_polo_4_F_euro", "C_man_polo_4_F_asia", "C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_euro", "C_man_polo_5_F_asia", "C_man_polo_6_F", "C_man_polo_6_F_afro", "C_man_polo_6_F_euro", "C_man_polo_6_F_asia", "C_Orestes", "C_Nikos", "I_G_Soldier_TL_F", "I_G_Soldier_F", "I_G_medic_F", "I_G_Soldier_LAT_F", "I_G_Soldier_AR_F", "I_G_Soldier_M_F", "I_G_Soldier_CQ_F", "I_G_engineer_F", "I_G_Soldier_GL_F", "I_G_recon_F", "I_G_sniper_F", "I_G_Soldier_AAR_F", "I_G_support_AMG_F", "I_G_support_AMort_F", "I_G_support_MG_F", "I_G_support_GMG_F", "I_G_support_Mort_F"];
_TypesForSideMission = ["B_officer_F","B_Soldier_TL_F"];
_TypesBLUFOR = _TypesForSideMission;
{
	[_x, 0, ["ACE_MainActions"], _actionIntelSearch] call ace_interact_menu_fnc_addActionToClass;
}forEach btc_type_units;

{
	[_x, 0, ["ACE_MainActions"], _actionIntelAsk] call ace_interact_menu_fnc_addActionToClass;
}forEach btc_civ_type_units;

{
	[_x, 1, ["ACE_SelfActions"], _actionCheckIED] call ace_interact_menu_fnc_addActionToClass;
} forEach _TypesBLUFOR; //btc_type_ieds;

{
	[_x, 1, ["ACE_SelfActions"], _actionDisarmIED] call ace_interact_menu_fnc_addActionToClass;
} forEach _TypesBLUFOR;

{
	[_x, 1, ["ACE_SelfActions"], _actionMissionRequest] call ace_interact_menu_fnc_addActionToClass;
} forEach _TypesForSideMission;

{
	[_x, 1, ["ACE_SelfActions"], _actionMissionAbort] call ace_interact_menu_fnc_addActionToClass;
} forEach _TypesForSideMission;
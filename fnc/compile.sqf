/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then
{
	//CACHE
	btc_fnc_cache_find_pos = compile preprocessFile "fnc\cache\find_pos.sqf";
	btc_fnc_cache_hd_cache = compile preprocessFile "fnc\cache\hd_cache.sqf";
	btc_fnc_cache_spawn = compile preprocessFile "fnc\cache\spawn.sqf";
	
	//COMMON
	btc_fnc_check_los = compile preprocessFile "fnc\check_los.sqf";
	btc_fnc_clean_up = compile preprocessFile "fnc\clean_up.sqf";
	btc_fnc_create_composition = compile preprocessFile "fnc\create_composition.sqf";
	btc_fnc_getHouses = compile preprocessFile "fnc\getHouses.sqf";
	btc_fnc_house_addWP = compile preprocessFile "fnc\house_addWP.sqf";
	btc_fnc_randomize_pos = compile preprocessFile "fnc\randomize_pos.sqf";
	btc_fnc_task_patrol = compile preprocessFile "fnc\task_patrol.sqf";
	
	//CITY
	btc_fnc_city_activate = compile preprocessFile "fnc\city\activate.sqf";
	btc_fnc_city_de_activate = compile preprocessFile "fnc\city\de_activate.sqf";
	btc_fnc_city_set_clear = compile preprocessFile "fnc\city\set_clear.sqf";

	//CIV
	btc_fnc_civ_add_weapons = compile preprocessFile "fnc\civ\add_weapons.sqf";
	btc_fnc_civ_addWP = compile preprocessFile "fnc\civ\addWP.sqf";	
	btc_fnc_civ_create = compile preprocessFile "fnc\civ\create.sqf";
	btc_fnc_civ_get_weapons = compile preprocessFile "fnc\civ\get_weapons.sqf";
	btc_fnc_civ_populate = compile preprocessFile "fnc\civ\populate.sqf";
	btc_fnc_civ_traffic_add_WP = compile preprocessFile "fnc\civ\traffic_add_WP.sqf";	
	btc_fnc_civ_traffic_create = compile preprocessFile "fnc\civ\traffic_create.sqf";
	btc_fnc_civ_traffic_hd = compile preprocessFile "fnc\civ\traffic_hd.sqf";
	
	//DATA
	btc_fnc_data_add_group = compile preprocessFile "fnc\data\add_group.sqf";
	btc_fnc_data_get_group = compile preprocessFile "fnc\data\get_group.sqf";
	btc_fnc_data_spawn_group = compile preprocessFile "fnc\data\spawn_group.sqf";
	
	//IED
	btc_fnc_ied_boom = compile preprocessFile "fnc\ied\boom.sqf";
	btc_fnc_ied_check = compile preprocessFile "fnc\ied\check.sqf";
	btc_fnc_ied_create = compile preprocessFile "fnc\ied\create.sqf";
	btc_fnc_ied_fired_near = compile preprocessFile "fnc\ied\fired_near.sqf";
	btc_fnc_ied_init_area = compile preprocessFile "fnc\ied\init_area.sqf";
	btc_fnc_ied_suicider_active = compile preprocessFile "fnc\ied\suicider_active.sqf";
	btc_fnc_ied_suicider_create = compile preprocessFile "fnc\ied\suicider_create.sqf";
	btc_fnc_ied_allahu_akbar = compile preprocessFile "fnc\ied\allahu_akbar.sqf";
	
	//MIL
	btc_fnc_mil_addWP = compile preprocessFile "fnc\mil\addWP.sqf";
	btc_fnc_mil_check_cap = compile preprocessFile "fnc\mil\check_cap.sqf";
	btc_fnc_mil_create_group = compile preprocessFile "fnc\mil\create_group.sqf";
	btc_fnc_mil_hd_hideout = compile preprocessFile "fnc\mil\hd_hideout.sqf";
	btc_fnc_mil_eh_killed = compile preprocessFile "fnc\mil\eh_killed.sqf";
	btc_fnc_mil_create_hideout = compile preprocessFile "fnc\mil\create_hideout.sqf";
	btc_fnc_mil_create_static = compile preprocessFile "fnc\mil\create_static.sqf";
	btc_fnc_mil_patrol_create = compile preprocessFile "fnc\mil\patrol_create.sqf";
	btc_fnc_mil_patrol_addWP = compile preprocessFile "fnc\mil\patrol_addWP.sqf";
	btc_fnc_mil_send = compile preprocessFile "fnc\mil\send.sqf";
	btc_fnc_mil_unit_killed = compile preprocessFile "fnc\mil\unit_killed.sqf";
	
	//REP
	btc_fnc_rep_add_eh = compile preprocessFile "fnc\rep\add_eh.sqf";
	btc_fnc_rep_call_militia = compile preprocessFile "fnc\rep\call_militia.sqf";
	btc_fnc_rep_change = compile preprocessFile "fnc\rep\change.sqf";
	btc_fnc_rep_eh_effects = compile preprocessFile "fnc\rep\eh_effects.sqf";
	btc_fnc_rep_hd = compile preprocessFile "fnc\rep\hd.sqf";
	btc_fnc_rep_hh = compile preprocessFile "fnc\rep\hh.sqf";
	btc_fnc_rep_killed = compile preprocessFile "fnc\rep\killed.sqf";
};
/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\

btc_fnc_code_on_local = compile preprocessFile "fnc\code_on_local.sqf";
btc_fnc_get_cardinal = compile preprocessFile "fnc\get_cardinal.sqf";
btc_fnc_is_engineer = compile preprocessFile "fnc\is_engineer.sqf";
btc_fnc_marker = compile preprocessFile "fnc\marker.sqf";
btc_fnc_show_hint = compile preprocessFile "fnc\show_hint.sqf";


//EH
btc_fnc_eh_helo_respawn = compile preprocessFile "fnc\eh\helo_respawn.sqf";
btc_fnc_eh_veh_add_respawn = compile preprocessFile "fnc\eh\veh_add_respawn.sqf";
btc_fnc_eh_veh_killed = compile preprocessFile "fnc\eh\veh_killed.sqf";
btc_fnc_eh_veh_respawn = compile preprocessFile "fnc\eh\veh_respawn.sqf";

//FOB
btc_fnc_fob_create = compile preprocessFile "fnc\fob\create.sqf";
btc_fnc_fob_create_s = compile preprocessFile "fnc\fob\create_s.sqf";
btc_fnc_fob_lb_change = compile preprocessFile "fnc\fob\lb_change.sqf";
btc_fnc_fob_redeploy = compile preprocessFile "fnc\fob\redeploy.sqf";

//GEAR
btc_fnc_gear_add_to_weapon = compile preprocessFile "fnc\gear\add_to_weapon.sqf";
btc_fnc_gear_change_cargo = compile preprocessFile "fnc\gear\change_cargo.sqf";
btc_fnc_gear_change_container = compile preprocessFile "fnc\gear\change_container.sqf";
btc_fnc_gear_get_text = compile preprocessFile "fnc\gear\get_text.sqf";
btc_fnc_gear_handle = compile preprocessFile "fnc\gear\handle.sqf";
btc_fnc_gear_lb_fill = compile preprocessFile "fnc\gear\lb_fill.sqf";
btc_fnc_gear_open_dlg = compile preprocessFile "fnc\gear\open_dlg.sqf";
btc_fnc_gear_remove_w_item = compile preprocessFile "fnc\gear\remove_w_item.sqf";
btc_fnc_gear_show_button = compile preprocessFile "fnc\gear\show_button.sqf";

//INFO
btc_fnc_info_ask = compile preprocessFile "fnc\info\ask.sqf";
btc_fnc_info_cache = compile preprocessFile "fnc\info\cache.sqf";
btc_fnc_info_give_intel = compile preprocessFile "fnc\info\give_intel.sqf";
btc_fnc_info_has_intel = compile preprocessFile "fnc\info\has_intel.sqf";
btc_fnc_info_hideout = compile preprocessFile "fnc\info\hideout.sqf";
btc_fnc_info_hideout_asked = compile preprocessFile "fnc\info\hideout_asked.sqf";
btc_fnc_info_search_for_intel = compile preprocessFile "fnc\info\search_for_intel.sqf";
btc_fnc_info_troops = compile preprocessFile "fnc\info\troops.sqf";
	
//INT
btc_fnc_int_change_var = compile preprocessFile "fnc\int\change_var.sqf";
btc_fnc_int_orders = compile preprocessFile "fnc\int\orders.sqf";
btc_fnc_int_orders_give = compile preprocessFile "fnc\int\orders_give.sqf";
btc_fnc_int_orders_behaviour = compile preprocessFile "fnc\int\orders_behaviour.sqf";
btc_fnc_int_ans_var = compile preprocessFile "fnc\int\ans_var.sqf";
btc_fnc_int_ask_var = compile preprocessFile "fnc\int\ask_var.sqf";

//LOG
btc_fnc_log_can_tow = compile preprocessFile "fnc\log\can_tow.sqf";
btc_fnc_log_check_cargo = compile preprocessFile "fnc\log\check_cargo.sqf";
btc_fnc_log_check_cc = compile preprocessFile "fnc\log\check_cc.sqf";
btc_fnc_log_create = compile preprocessFile "fnc\log\create.sqf";
btc_fnc_log_create_apply = compile preprocessFile "fnc\log\create_apply.sqf";
btc_fnc_log_create_load = compile preprocessFile "fnc\log\create_load.sqf";
btc_fnc_log_create_change_target = compile preprocessFile "fnc\log\create_change_target.sqf";
btc_fnc_log_create_s = compile preprocessFile "fnc\log\create_s.sqf";
btc_fnc_log_drag = compile preprocessFile "fnc\log\drag.sqf";
btc_fnc_log_hook = compile preprocessFile "fnc\log\hook.sqf";
btc_fnc_log_lift_check = compile preprocessFile "fnc\log\lift_check.sqf";
btc_fnc_log_lift_deploy_ropes = compile preprocessFile "fnc\log\lift_deploy_ropes.sqf";
btc_fnc_log_lift_destroy_ropes = compile preprocessFile "fnc\log\lift_destroy_ropes.sqf";
btc_fnc_log_lift_hook = compile preprocessFile "fnc\log\lift_hook.sqf";
btc_fnc_log_lift_hook_fake = compile preprocessFile "fnc\log\lift_hook_fake.sqf";
btc_fnc_log_lift_hud = compile preprocessFile "fnc\log\lift_hud.sqf";
btc_fnc_log_lift_unhook = compile preprocessFile "fnc\log\lift_hook.sqf";
btc_fnc_log_get_cc = compile preprocessFile "fnc\log\get_cc.sqf";
btc_fnc_log_get_rc = compile preprocessFile "fnc\log\get_rc.sqf";
btc_fnc_log_load = compile preprocessFile "fnc\log\load.sqf";
btc_fnc_log_obj_fall = compile preprocessFile "fnc\log\obj_fall.sqf";
btc_fnc_log_paradrop = compile preprocessFile "fnc\log\paradrop.sqf";
btc_fnc_log_place = compile preprocessFile "fnc\log\place.sqf";
btc_fnc_log_place_create_camera = compile preprocessFile "fnc\log\place_create_camera.sqf";
btc_fnc_log_place_destroy_camera = compile preprocessFile "fnc\log\place_destroy_camera.sqf";
btc_fnc_log_place_key_down = compile preprocessFile "fnc\log\place_key_down.sqf";
btc_fnc_log_repair_wreck = compile preprocessFile "fnc\log\repair_wreck.sqf";
btc_fnc_log_select = compile preprocessFile "fnc\log\select.sqf";
btc_fnc_log_server_load = compile preprocessFile "fnc\log\server_load.sqf";
btc_fnc_log_server_repair_wreck = compile preprocessFile "fnc\log\server_repair_wreck.sqf";
btc_fnc_log_server_unload = compile preprocessFile "fnc\log\server_unload.sqf";
btc_fnc_log_set_mass = compile preprocessFile "fnc\log\set_mass.sqf";
btc_fnc_log_tow = compile preprocessFile "fnc\log\tow.sqf";
btc_fnc_log_unhook = compile preprocessFile "fnc\log\unhook.sqf";
btc_fnc_log_unload = compile preprocessFile "fnc\log\unload.sqf";

//REV
btc_fnc_rev_ans_var = compile preprocessFileLineNumbers "fnc\rev\ans_var.sqf";
btc_fnc_rev_ask_var = compile preprocessFileLineNumbers "fnc\rev\ask_var.sqf";
btc_fnc_rev_apply_treat = compile preprocessFileLineNumbers "fnc\rev\apply_treat.sqf";
btc_fnc_rev_carry = compile preprocessFileLineNumbers "fnc\rev\carry.sqf";
btc_fnc_rev_drag = compile preprocessFileLineNumbers "fnc\rev\drag.sqf";
btc_fnc_rev_effects = compile preprocessFileLineNumbers "fnc\rev\effects.sqf";
btc_fnc_rev_effect_pain = compile preprocessFileLineNumbers "fnc\rev\effect_pain.sqf";
btc_fnc_rev_examine = compile preprocessFileLineNumbers "fnc\rev\examine.sqf";
btc_fnc_rev_examine_result = compile preprocessFileLineNumbers "fnc\rev\examine_result.sqf";
btc_fnc_rev_get_gear = compile preprocessFileLineNumbers "fnc\rev\get_gear.sqf";
btc_fnc_rev_hd = compile preprocessFileLineNumbers "fnc\rev\hd.sqf";
btc_fnc_rev_init_var = compile preprocessFileLineNumbers "fnc\rev\init_var.sqf";
btc_fnc_rev_is_medic = compile preprocessFileLineNumbers "fnc\rev\is_medic.sqf";
btc_fnc_rev_load = compile preprocessFileLineNumbers "fnc\rev\load.sqf";
btc_fnc_rev_set_gear = compile preprocessFileLineNumbers "fnc\rev\set_gear.sqf";
btc_fnc_rev_stateHandler = compile preprocessFileLineNumbers "fnc\rev\stateHandler.sqf";
btc_fnc_rev_treat = compile preprocessFileLineNumbers "fnc\rev\treat.sqf";
btc_fnc_rev_unc = compile preprocessFileLineNumbers "fnc\rev\unc.sqf";
btc_fnc_rev_unit_init = compile preprocessFileLineNumbers "fnc\rev\unit_init.sqf";
btc_fnc_rev_unload = compile preprocessFileLineNumbers "fnc\rev\unload.sqf";

//SIDE
btc_fnc_side_abort = compile preprocessFileLineNumbers "fnc\side\abort.sqf";
btc_fnc_side_create = compile preprocessFileLineNumbers "fnc\side\create.sqf";
btc_fnc_side_get_city = compile preprocessFileLineNumbers "fnc\side\get_city.sqf";
btc_fnc_side_mines = compile preprocessFileLineNumbers "fnc\side\mines.sqf";
btc_fnc_side_request = compile preprocessFileLineNumbers "fnc\side\request.sqf";
btc_fnc_side_supply = compile preprocessFileLineNumbers "fnc\side\supply.sqf";
btc_fnc_side_vehicle = compile preprocessFileLineNumbers "fnc\side\vehicle.sqf";

//TASK
btc_fnc_task_create = compile preprocessFileLineNumbers "fnc\task\create.sqf";
btc_fnc_task_fail = compile preprocessFileLineNumbers "fnc\task\fail.sqf";
btc_fnc_task_set_done = compile preprocessFileLineNumbers "fnc\task\set_done.sqf";

/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then
{
	btc_fnc_end_mission = compile preprocessFile "fnc\end_mission.sqf";
	
	btc_fnc_marker_debug = compile preprocessFile "fnc\marker_debug.sqf";
	
	//EH
	btc_fnc_eh_player_respawn = compile preprocessFile "fnc\eh\player_respawn.sqf";
	
	//DEAF
	btc_fnc_deaf_earplugs = compile preprocessFile "fnc\deaf\earplugs.sqf";
	btc_fnc_deaf_fired_near = compile preprocessFile "fnc\deaf\fired_near.sqf";
	btc_fnc_deaf_loop = compile preprocessFile "fnc\deaf\loop.sqf";	
	
	//IED
	btc_fnc_ied_check_for = compile preprocessFile "fnc\ied\check_for.sqf";
	btc_fnc_ied_disarm = compile preprocessFile "fnc\ied\disarm.sqf";
	
	//INT
	btc_fnc_int_action_result = compile preprocessFile "fnc\int\action_result.sqf";
	btc_fnc_int_key_pressed = compile preprocessFile "fnc\int\key_pressed.sqf";
	btc_fnc_int_open_dlg = compile preprocessFile "fnc\int\open_dlg.sqf";
	btc_fnc_int_select_weapon = compile preprocessFile "fnc\int\select_weapon.sqf";
};
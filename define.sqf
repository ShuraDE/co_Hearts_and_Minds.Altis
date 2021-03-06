//Param
btc_p_time  = (paramsArray select 0);
_p_en = (paramsArray select 1);
btc_p_ied = (paramsArray select 2);
_hideout_n = (paramsArray select 3);
_cache_info_def = (paramsArray select 4);
_cache_info_ratio = (paramsArray select 5);
_info_chance = (paramsArray select 6);
_p_rep = (paramsArray select 7);
btc_p_revive = (paramsArray select 8);
btc_p_t_revive = (paramsArray select 9);
_rev_only_medic = (paramsArray select 10);
_rev_medikit_required = (paramsArray select 11);
btc_p_deaf = if ((paramsArray select 12) == 0) then {false} else {true};
btc_p_redeploy_base  = if ((paramsArray select 13) == 0) then {false} else {true};
btc_p_debug  = (paramsArray select 14);

btc_wounds_mod = isClass(configFile >> "cfgPatches" >> "BTC_wounds");
btc_acre_mod = isClass(configFile >> "cfgPatches" >> "acre_main");
btc_tfr_mod = isClass(configFile >> "cfgPatches" >> "task_force_radio");

switch (BTC_p_debug) do
{
	case 0 : {btc_debug_log = false;btc_debug = false;};
	case 1 : {btc_debug_log = true;btc_debug = true;};
	case 2 : {btc_debug_log = true;btc_debug = false;};
};

if (!isMultiplayer) then {btc_debug_log = true;btc_debug = true;};

if (isServer) then
{
	btc_final_phase = false;
	
	//City
	btc_city_radius = 300;
	
	//Civ
	btc_civ_veh_active = 0;

	//Hideout
	btc_hideouts = [];
	btc_hideouts_id = 0;
	btc_hideout_n = _hideout_n;
	if (btc_hideout_n == 99) then
	{
		btc_hideout_n = (round random 5);
	};
	btc_hideout_safezone = 4000;
	btc_hideout_range = 3500;
	btc_hideout_rinf_time = 600;
	btc_hideout_cap_time = 1800;
	btc_hideout_cap_checking = false;
	
	//IED
	btc_ied_suic_time = 900;
	btc_ied_suic_spawned = - btc_ied_suic_time;

	//FOB
	btc_fobs = [];
	
	
	//Log
	btc_log_id_repo = 10;
	btc_log_cargo_repo = "Land_HBarrierBig_F" createVehicle [- 5000,- 5000,0];
	
	//Patrol
	btc_patrol_active = 0;
	
	//Rep
	btc_global_reputation = _p_rep;	
	btc_rep_militia_call_time = 600;
	btc_rep_militia_called = - btc_rep_militia_call_time;

	btc_composition_hideout =
	[
		["C_supplyCrate_F",0,[0.2,0.2,0]],
		["Flag_Red_F",0,[-0.542969,-0.270508,-0.00143433]],
		["Campfire_burning_F",0,[-1.24414,-2.12183,-0.0314331]],
		["Land_Sleeping_bag_blue_F",146.026,[2.82666,-1.77124,-0.00143433]],
		["Land_TentDome_F",0,[1.08496,-3.35547,-0.00143433]],
		["Land_TentA_F",349.935,[-2.09814,2.94702,-0.00143433]],
		["Land_TentA_F",349.935,[1.10889,3.53687,-0.00143433]],
		["Land_Portable_generator_F",243.462,[-3.89404,1.15088,-0.0022583]],
		["Land_Sleeping_bag_blue_F",146.026,[4.00879,-1.00842,-0.00143433]],
		["C_supplyCrate_F",55.6146,[-4.60059,-2.28027,-0.00143433]],
		["Land_PaperBox_open_full_F",143.441,[-3.74023,-3.77405,-0.00143433]],
		["Land_TentDome_F",0,[-5.93555,0.444702,-0.00143433]],
		["Land_PaperBox_closed_F",0,[-5.76221,-3.35876,-0.00143433]],
		["Land_PaperBox_open_empty_F",324.641,[-4.91895,-4.99585,-0.00143433]],
		["Land_Pallet_MilBoxes_F",297.549,[-7.8623,-2.05115,-0.00143433]]
	];
	
	//Side
	btc_side_aborted = false;
	btc_side_assigned = false;
	btc_side_done = false;
	btc_side_failed = false;
	btc_side_list = [0,1,2,3,4];
	btc_side_list_use = + btc_side_list;
	btc_side_jip_data = [];
};

//City
btc_city_type = "Land_Ammobox_rounds_F";

//Civ
btc_civ_type_units  = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
btc_civ_type_veh    = ["C_Hatchback_01_F","C_SUV_01_F","C_Offroad_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
btc_civ_max_veh = 5;
btc_w_civs = ["V_Rangemaster_belt","arifle_Mk20_F","30Rnd_556x45_Stanag","hgun_ACPC2_F","9Rnd_45ACP_Mag"];

//Cache
btc_cache_type = "Box_East_Ammo_F";

//Deaf
btc_deaf_value = 20;
btc_deaf_ring = 10;
btc_deaf_ratio = 6;
btc_earplugs_value = 0.2;

//FOB
btc_fob_mat = "Land_Cargo20_blue_F";
btc_fob_structure = "Land_Cargo_HQ_V1_F";
btc_fob_flag = "Flag_NATO_F";
btc_fob_id = 0;

//Gear
btc_magazines =
[
	"16Rnd_9x21_Mag",
	"30Rnd_65x39_caseless_mag",
	"10Rnd_762x51_Mag",
	"30Rnd_65x39_caseless_mag_Tracer",
	"100Rnd_65x39_caseless_mag_Tracer",
	"100Rnd_65x39_caseless_mag",
	"200Rnd_65x39_cased_Box",
	"200Rnd_65x39_cased_Box_Tracer",
	"NLAW_F",
	"SmokeShell",
	"SmokeShellGreen",
	"SmokeShellRed",
	"HandGrenade",
	"1Rnd_HE_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"DemoCharge_Remote_Mag",
	"SatchelCharge_Remote_Mag"
];
btc_weapons =
[
	"arifle_MX_F",
	"arifle_MX_GL_F",
	"arifle_MX_Black_F",
	"arifle_MXC_F",
	"arifle_MXM_F",
	"arifle_MX_SW_F",
	"srifle_EBR_F",
	"LMG_Mk200_F",
	"hgun_P07_F",
	"launch_NLAW_F"
];
btc_items =
[
	"acc_pointer_IR",
	"acc_flashlight",
	
	"optic_Hamr",
	"optic_Aco",
	"optic_Holosight",
	
	"Binocular",
	"ItemCompass",
	"ItemMap",
	"ItemGPS",
	"ItemRadio",
	"ItemWatch",
	"Medikit",
	"NVGoggles",
	"B_UavTerminal",
	"ToolKit"
];

if (btc_wounds_mod) then {btc_items = btc_items + ["BTC_w_bandage","BTC_w_largeBandage","BTC_w_epi","BTC_w_mor","BTC_w_bloodbag","BTC_w_earplugs"];};
if (btc_acre_mod) then {btc_items pushBack "ACRE_PRC148";};
//if (btc_tfr_mod) then {btc_items = btc_items + ["BTC_w_bandage","BTC_w_largeBandage","BTC_w_epi","BTC_w_mor","BTC_w_bloodbag"];};

btc_uniforms =
[
	"U_B_CombatUniform_mcam_worn",
	"U_B_CombatUniform_mcam_vest",
	"U_B_CombatUniform_mcam_tshirt", 	
	"U_B_CombatUniform_mcam"
];
btc_vests =
[
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier2_rgr",
	"V_PlateCarrier3_rgr",
	"V_PlateCarrierGL_rgr",
	"V_PlateCarrierSpec_rgr"
];
btc_backpacks =
[
	"B_AssaultPack_mcamo",
	"B_AssaultPack_dgtl",
	"B_Carryall_cbr",
	"B_Carryall_khk",
	"B_Carryall_mcamo",
	"B_Mortar_01_support_F",
	"B_Mortar_01_weapon_F",
	"B_UAV_01_backpack_F"
];
btc_headgears =
[
	"H_HelmetB",
	"H_HelmetB_camo",
	"H_HelmetB_paint",
	"H_HelmetB_light",
	"H_MilCap_mcamo",
	"H_Shemag_olive",
	"H_Shemag_khk",
	"H_Shemag_tan",
	"H_Watchcap_blk",
	"H_Watchcap_camo",
	"H_Watchcap_khk",
	"H_Bandanna_camo",
	"H_Bandanna_mcamo",
	"H_Beret_brn_SF",
	"H_Beret_blk",
	"H_Booniehat_grn",
	"H_Booniehat_indp",
	"H_Booniehat_dirty",
	"H_Booniehat_mcamo",
	"H_Booniehat_tan",
	"H_Cap_blk_ION",
	"H_Cap_blk",
	"H_Shemag_khk",
  	"H_Shemag_tan",
  	"H_Shemag_olive",
  	"H_Shemag_olive_hs",
  	"H_ShemagOpen_khk",
  	"H_ShemagOpen_tan"
];

btc_goggles =
[
	"G_Tactical_Clear",
	"G_Balaclava_combat",
	"G_Bandanna_blk",
	"G_Bandanna_khk",
	"G_Bandanna_tan",
	"G_Bandanna_oli",
	"G_Combat"
];

//IED
btc_type_ieds = ["Land_GarbageContainer_closed_F","Land_GarbageContainer_open_F","Land_GarbageBarrel_01_F","Land_JunkPile_F","Land_Pallets_F","Land_Portable_generator_F","Land_WoodenBox_F","Land_MetalBarrel_F","Land_BarrelTrash_grey_F","Land_Sacks_heap_F","Land_Bricks_V2_F","Land_Bricks_V3_F","Land_Bricks_V4_F","Land_GarbageBags_F","Land_GarbagePallet_F","Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_Tyres_F","Land_Wreck_Skodovka_F","Land_Wreck_Car_F","Land_Wreck_Car3_F","Land_Wreck_Car2_F","Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F"];
btc_ied_check_time = 10;
btc_ied_disarm_time = 10;

//Int
btc_int_radius_orders = 25;
btc_int_search_intel_time = 4;

//Info
btc_info_intel_chance = _info_chance;
btc_info_intel_type = [80,95];//cache - hd - both
btc_info_cache_def = _cache_info_def;
btc_info_cache_ratio = _cache_info_ratio;
btc_info_hideout_radius = 4000;

//Log
btc_construction_array =
[
	[
		"Fortifications",
		"Static",
		"Ammobox",
		"Containers",
		"Supplies",
		"FOB"
	],
	[
		[
			//"Fortifications"
			"Land_BagBunker_Small_F",
			"Land_BagFence_Corner_F",
			"Land_BagFence_End_F",
			"Land_BagFence_Long_F",
			"Land_BagFence_Round_F",
			"Land_BagFence_Short_F",
			"Land_HBarrier_1_F",
			"Land_HBarrier_3_F",
			"Land_HBarrier_5_F",
			"Land_HBarrierBig_F",
			"Land_Razorwire_F",
			"Land_CncBarrier_F",
			"Land_CncBarrierMedium_F",
			"Land_CncBarrierMedium4_F",
			"Land_CncWall1_F",
			"Land_CncWall4_F",
			"Land_Mil_ConcreteWall_F",
			"Land_Mil_WallBig_4m_F",
			"Land_Mil_WallBig_Corner_F"		
		],
		[
			//"Static"
			"B_static_AT_F",
			"B_static_AA_F",
			"B_GMG_01_A_F",
			"B_GMG_01_high_F",
			"B_GMG_01_F",
			"B_HMG_01_A_F",
			"B_HMG_01_high_F",
			"B_HMG_01_F",
			"B_Mortar_01_F"
		],
		[
			//"Ammobox"
			"Box_NATO_Ammo_F",
			"Box_NATO_Support_F",
			"Box_NATO_AmmoVeh_F"
			
		],
		[
			//"Containers"
			"Land_Cargo20_military_green_F",
			"Land_Cargo40_military_green_F"
			
		],
		[
			//"Supplies"
			"Land_Cargo20_red_F"
		],
		[
			//FOB
			btc_fob_mat
		]
	]
];
_c_array = btc_construction_array select 1;
btc_log_def_draggable = (_c_array select 1) + (_c_array select 2);
btc_log_def_loadable = (_c_array select 0) + (_c_array select 1) + (_c_array select 2) + (_c_array select 3) + (_c_array select 4) + (_c_array select 5);
btc_log_def_placeable = (_c_array select 0) + (_c_array select 3) + (_c_array select 4) + (_c_array select 5);
btc_log_max_distance_load = 15;
btc_log_object_selected = objNull;
btc_log_vehicle_selected = objNull;
btc_log_place_placement_area = 20;

btc_log_main_cc =
[
	"Motorcycle",1,
	"Car",3,
	"Truck",10,
	"Wheeled_APC",5,
	"Tank",5,
	"Ship",3,
	"Helicopter",6
];
btc_log_main_rc =
[
	"ReammoBox_F",2,
	"thingX",3,
	"StaticWeapon",3,
	"Strategic",2,
	"Motorcycle",3,
	"Land_BarGate_F",3,
	"HBarrier_base_F",5,
	"Land_BagFence_Long_F",3,
	"Wall_F",5,
	"BagBunker_base_F",5,
	"Car",35,
	"Truck",50,
	"Wheeled_APC",50,
	"Tank",75,
	"Ship",50,
	"Helicopter",9999
];
btc_log_def_cc =
[
	"B_Quadbike_01_F",2,
	"B_UGV_01_rcws_F",4,
	"B_UGV_01_F",4,
	"Land_CargoBox_V1_F",0,
	"Land_Cargo20_red_F",0,
	btc_fob_mat,0,
	"Land_Cargo20_military_green_F",20,
	"Land_Cargo40_military_green_F",40,
	//Trucks
	"B_Truck_01_transport_F",10,
	"B_Truck_01_covered_F",10,
	"I_Truck_02_covered_F",10,
	"O_Truck_02_covered_F",10,
	"I_Truck_02_transport_F",10,
	"O_Truck_02_transport_F",10,
	"O_Truck_02_transport_F",10
];
btc_log_def_rc =
[
	"Land_BagBunker_Small_F",5,
	"Land_CargoBox_V1_F",9999,
	"Land_Cargo20_red_F",10,
	btc_fob_mat,10,
	"Land_Cargo20_military_green_F",20,
	"Land_Cargo40_military_green_F",40
];

btc_fnc_log_get_towable =
{
	_tower = _this select 0;
	_array   = [];
	switch (true) do
	{
		case (_tower isKindOf "Car") : {_array = ["Car"];};
		case (_tower isKindOf "Truck") : {_array = ["Car","Truck"];};
		case (_tower isKindOf "Truck") : {_array = ["Car","Truck","Wheeled_APC"];};
		case (_tower isKindOf "Wheeled_APC") : {_array = ["Car","Truck","Wheeled_APC"];};
	};
	_array
};

//Lift
btc_fnc_log_get_liftable =
{
	_chopper = _this select 0;
	_array   = [];
	switch (typeOf _chopper) do
	{
		//MH9
		case "B_Heli_Light_01_F"     : {_array = ["Motorcycle","ReammoBox","ReammoBox_F","Quadbike_01_base_F","Strategic"];};
		//PO-30
		case "O_Heli_Light_02_F"     : {_array = ["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car"];};
		//UH80
		case "B_Heli_Transport_01_F" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
		//UH80 - CAMO
		case "B_Heli_Transport_01_camo_F" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
		//CH49
		case "I_Heli_Transport_02_F" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Tracked_APC","APC_Tracked_01_base_F","APC_Tracked_02_base_F","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
        //CH53
        case "ga_heli" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Tracked_APC","APC_Tracked_01_base_F","APC_Tracked_02_base_F","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
	};
	_array
};

btc_ropes_deployed = false;
btc_lift_min_h  = 7;
btc_lift_max_h  = 12;
btc_lift_radius = 3;
btc_lift_HUD_x  = 0.825;// * safezoneW + safezoneX;
btc_lift_HUD_y  = 0.825;// * safezoneH + safezoneY;

//Mil
btc_player_side           = west;
btc_enemy_side            = east;

switch (true) do 
{
	case (_p_en == 0) :
	{
		btc_type_units            = ["O_G_Soldier_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"];
		btc_type_crewmen          = "O_G_Soldier_F";
		btc_type_vehicles         = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
		btc_type_motorized        = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_Truck_02_covered_F"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];
	};
	case (_p_en == 1 && isClass(configFile >> "cfgVehicles" >> "CAF_AG_ME_T_AK47")) :
	{
		btc_type_units            = ["CAF_AG_ME_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_RPG","CAF_AG_ME_T_GL"];
		btc_type_crewmen          = "CAF_AG_ME_T_AK47";
		btc_type_vehicles         = ["CAF_AG_ME_T_Offroad_armed_01"];
		btc_type_motorized        = ["CAF_AG_ME_T_Offroad","I_Truck_02_transport_F","CAF_AG_ME_T_Offroad_armed_01","CAF_AG_ME_T_van_01"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];
		btc_civ_type_units  = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_02","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_04"];
	};
	case (_p_en == 2 && isClass(configFile >> "CfgFactionClasses" >> "LOP_ISTS") && isClass(configFile >> "CfgFactionClasses" >> "LOP_TAK_Civ")) :
	{
		btc_type_units            = ["LOP_ISTS_Infantry_TL","LOP_ISTS_Infantry_SL","LOP_ISTS_Infantry_Medic","LOP_ISTS_Infantry_AR","LOP_ISTS_Infantry_AT","LOP_ISTS_Infantry_Marksman","LOP_ISTS_Infantry_Engineer","LOP_ISTS_Soldier","LOP_ISTS_Infantry_GL"];
		btc_type_crewmen          = "LOP_ISTS_Soldier";
		btc_type_vehicles         = ["LOP_ISTS_Landrover_M2","LOP_ISTS_Offroad_M2"];
		btc_type_motorized        = ["LOP_ISTS_Landrover","LOP_ISTS_Landrover_M2","LOP_ISTS_Offroad","LOP_ISTS_Offroad_M2","LOP_ISTS_Truck","LOP_ISTS_M113_W","LOP_ISTS_BTR60","LOP_TAK_Civ_Ural","LOP_TAK_Civ_Ural_open","LOP_TAK_Civ_UAZ","LOP_TAK_Civ_UAZ_Open"];
		btc_type_mg = ["LOP_ISTS_Static_M2","LOP_ISTS_Static_M2_MiniTripod"];
		btc_type_gl = ["LOP_ISTS_Static_Mk19_TriPod"];
		btc_civ_type_units 		  = ["LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_03","LOP_Tak_Civ_Man_04"];
		btc_civ_type_veh    	  = ["LOP_TAK_Civ_Offroad","LOP_TAK_Civ_Hatchback","LOP_TAK_Civ_Landrover","LOP_TAK_Civ_Ural","LOP_TAK_Civ_Ural_open","LOP_TAK_Civ_UAZ","LOP_TAK_Civ_UAZ_Open"];
	};	
	case (_p_en == 3 && isClass(configFile >> "CfgFactionClasses" >> "LOP_AFR") && isClass(configFile >> "CfgFactionClasses" >> "LOP_AFR_Civ")) :
	{
		btc_type_units            = ["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_SL","LOP_AFR_Infantry_Corpsman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AT","LOP_AFR_Infantry_Marksman","LOP_AFR_Infantry_IED","LOP_AFR_Infantry","LOP_AFR_Driver","LOP_AFR_Infantry_GL"];
		btc_type_crewmen          = "LOP_AFR_Driver";
		btc_type_vehicles         = ["LOP_AFR_Landrover_M2","LOP_AFR_Offroad_M2"];
		btc_type_motorized        = ["LOP_AFR_BTR60","LOP_AFR_M113_W","LOP_AFR_Landrover","LOP_AFR_Landrover_M2","LOP_AFR_Offroad_M2","LOP_AFR_Offroad","LOP_AFR_Truck","LOP_AFR_Civ_Ural","LOP_AFR_Civ_Ural_open","LOP_AFR_Civ_UAZ","LOP_AFR_Civ_Landrover","LOP_AFR_Civ_UAZ_Open"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];
		btc_civ_type_units 		  = ["LOP_AFR_Civ_Man_01","LOP_AFR_Civ_Man_02","LOP_AFR_Civ_Man_03","LOP_AFR_Civ_Man_04"];
		btc_civ_type_veh    	  = ["LOP_AFR_Civ_Offroad","LOP_AFR_Civ_Hatchback","LOP_AFR_Civ_Ural","LOP_AFR_Civ_Ural_open","LOP_AFR_Civ_UAZ","LOP_AFR_Civ_Landrover","LOP_AFR_Civ_UAZ_Open"];
	};		
	default
	{
		btc_type_units            = ["O_G_Soldier_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"];
		btc_type_crewmen          = "O_G_Soldier_F";
		btc_type_vehicles         = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
		btc_type_motorized        = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_Truck_02_covered_F"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];	
	}
};
//Patrol
btc_patrol_max = 10;
btc_patrol_active = 0;
btc_patrol_area = 2500;

//Rep
btc_rep_bonus_cache = 100;
btc_rep_bonus_civ_hh = 10;
btc_rep_bonus_disarm = 25;
btc_rep_bonus_hideout = 200;
btc_rep_bonus_mil_killed = 0.25;

btc_rep_malus_civ_hd = - 10;
btc_rep_malus_civ_killed = - 10;
btc_rep_malus_player_respawn = - 10;
btc_rep_malus_veh_killed = 25;

//Rev
BTC_wounds_disabled = true;
btc_rev_medikit_required = if (_rev_medikit_required == 1) then {true} else {false};
btc_rev_lbndg_only_medic = if (_rev_only_medic == 1) then {true} else {false};
btc_rev_mor_only_medic = if (_rev_only_medic == 1) then {true} else {false};
btc_rev_epi_only_medic = if (_rev_only_medic == 1) then {true} else {false};
btc_rev_blood_only_medic = if (_rev_only_medic == 1) then {true} else {false};

btc_rev_max_damage_head = 0.8;
btc_rev_max_damage_body = 1.2;
btc_rev_max_damage_hands = 3;
btc_rev_max_damage_legs = 3;

btc_rev_max_pain = 1;
btc_rev_max_mor  = 3;

btc_rev_examination_time = 10;
btc_rev_examination_completed = false;
btc_rev_examination_failed = false;

//Side
if (isNil "btc_side_assigned") then {btc_side_assigned = false;};

/*
player setpos getpos ((nearestObjects [position player, [btc_cache_type], 200]) select 0)

//REVIVE
btc_fnc_rev_debug =
{
	[] spawn {player allowDamage true;
	btc_rev_debug_cond = true;
	while {btc_rev_debug_cond} do
	{
		hintSilent parseText format 
		[
			"
			UNC: %1<br/>
			BUSY: %2<br/>
			BLOSS: %3 (%4)<br/>
			PAIN: %5<br/>
			MOR: %6<br/>
			FATIGUE: %7<br/>
			P: %8 %9 %10 %11<br/>

			",
			player getVariable ["btc_rev_isUnc",false],
			player getVariable ["btc_int_busy",false],
			player getVariable ["btc_rev_bloss",0],
			player getVariable ["btc_rev_bleed",0],
			player getVariable ["btc_rev_pain",0],
			player getVariable ["btc_rev_mor",0],
			getFatigue player,
			player getVariable ["btc_rev_head",0],
			player getVariable ["btc_rev_body",0],
			player getVariable ["btc_rev_hands",0],
			player getVariable ["btc_rev_legs",0]
		];
		sleep 1;
	};}
};
[] spawn {
	while {true} do {diag_log diag_fps;};};

*/

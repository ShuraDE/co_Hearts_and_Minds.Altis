removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player addWeapon "hgun_P07_F";
player addWeapon "Binocular";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152";
player linkItem "ItemGPS";	

switch (typeOf player) do {
	
	case "B_medic_F" : {
	  //Combat Life Saver aka Medic
		player forceAddUniform "ARC_GER_Tropentarn_Uniform";
		player addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
		player addItemToUniform "ACE_EarPlugs";
		player addVest "ARC_GER_Tropentarn_Plate_Carrier";
		player addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 8 do {player addItemToVest "SMA_30Rnd_556x45_M855A1_Tracer";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 6 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
		player addBackpack "ARC_GER_Backpack_Carryall_Tropentarn";
		for "_i" from 1 to 48 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 12 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 24 do {player addItemToBackpack "ACE_morphine";};
		player addItemToBackpack "ACE_NVG_Wide";
		for "_i" from 1 to 10 do {player addItemToBackpack "SMA_30Rnd_556x45_M855A1_Tracer";};
		player addHeadgear "ARC_Common_TAN_M_Helmet";
		player addWeapon "SMA_HK416afg";
		player addPrimaryWeaponItem "SMA_supp2b_556";
		player addPrimaryWeaponItem "FHQ_acc_LLM01L";
		player addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
	};
	case "B_soldier_LAT_F" : {
	  //Rifleman (AT)
		player forceAddUniform "ARC_GER_Tropentarn_Uniform";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "ARC_GER_Tropentarn_PlateCarrier_2";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
		player addBackpack "ARC_GER_Kitbag_compact_Tropentarn";
		for "_i" from 1 to 16 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
		player addItemToBackpack "ACE_bloodIV";
		player addItemToBackpack "ACE_NVG_Wide";
		player addHeadgear "ARC_GER_Tropentarn_Mich";
		player addWeapon "SMA_HK416afg";		
	};
	case "B_soldier_AR_F" : {
	  //Autorifleman
		player forceAddUniform "ARC_GER_Tropentarn_Uniform";
		player addItemToUniform "ACE_MapTools";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "ARC_GER_Tropentarn_PlateCarrier_2";
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "200Rnd_65x39_cased_Box_Tracer";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
		player addBackpack "ARC_GER_Backpack_Carryall_Tropentarn";
		for "_i" from 1 to 16 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
		player addItemToBackpack "ACE_bloodIV";
		player addItemToBackpack "ACE_NVG_Wide";
		for "_i" from 1 to 6 do {player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
		for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
		player addHeadgear "ARC_GER_Tropentarn_Mich";
		player addWeapon "LMG_Mk200_F";
		player addPrimaryWeaponItem "muzzle_snds_H_MG";
		player addPrimaryWeaponItem "FHQ_acc_LLM01F";
		player addPrimaryWeaponItem "SMA_eotech552_3XDOWN";
		player addPrimaryWeaponItem "bipod_01_F_snd";	
	};
	case "B_Soldier_A_F" : {
	  //Ammo Bearer
		player forceAddUniform "ARC_GER_Tropentarn_Uniform";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "ARC_GER_Tropentarn_PlateCarrier_2";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
		player addBackpack "ARC_GER_Kitbag_compact_Tropentarn";
		for "_i" from 1 to 16 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 2 do {player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};		
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
		player addItemToBackpack "ACE_bloodIV";
		player addItemToBackpack "ACE_NVG_Wide";
		player addHeadgear "ARC_GER_Tropentarn_Mich";
		player addWeapon "SMA_HK416afg";
	};
	case "B_soldier_exp_F" : {
	  //Explosive Specialist
		player forceAddUniform "ARC_GER_Tropentarn_Uniform";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_DefusalKit";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "ARC_GER_Tropentarn_PlateCarrier_2";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
		player addBackpack "ARC_GER_Kitbag_compact_Tropentarn";
		for "_i" from 1 to 16 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
		player addItemToBackpack "ACE_bloodIV";
		player addItemToBackpack "ACE_NVG_Wide";
		player addHeadgear "ARC_GER_Tropentarn_Mich";	
		player addWeapon "SMA_HK416afg";		
	};
	default {
		player forceAddUniform "ARC_GER_Tropentarn_Uniform";
		player addItemToUniform "ACE_MapTools";
		player addItemToUniform "ACE_EarPlugs";
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "ARC_GER_Tropentarn_PlateCarrier_2";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
		player addBackpack "ARC_GER_Kitbag_compact_Tropentarn";
		for "_i" from 1 to 16 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
		player addItemToBackpack "ACE_bloodIV";
		player addItemToBackpack "ACE_NVG_Wide";
		player addHeadgear "ARC_GER_Tropentarn_Mich";
		player addWeapon "SMA_HK416afg";		
	};
}


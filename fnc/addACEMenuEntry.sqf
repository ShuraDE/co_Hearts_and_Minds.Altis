/* https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_addActionToClass.sqf
 * Insert an ACE action to a class, under a certain path
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 *
 * Return value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [typeOf cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToClass;
 *
 * Public: No
 *
 *
 * https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_addActionToObject.sqf
 * Insert an ACE action to an object, under a certain config path
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Object the action should be assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 *
 * Return value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToObject;
 *
 *
 * https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_createAction.sqf
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 *
 * Return value:
 * Action <ARRAY>
 *
 * Example:
 * ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
 */

 //Add Search Intel (dead bodies)
 //_actionIntelSearch = ["SearchIntel", "Search for Intel", "", {btc_int_target = cursorTarget; [] spawn btc_fnc_info_search_for_intel}, {(!Alive cursorTarget);}] call ace_interact_menu_fnc_createAction;
 _actionIntelSearch = ["SearchIntel", "Search for Intel", "", {btc_int_target = cursorTarget; [] spawn btc_fnc_info_search_for_intel}, {true;}] call ace_interact_menu_fnc_createAction;
 [typeOf cursorTarget, 0, ["ACE_MainActions"], _actionIntelSearch] call ace_interact_menu_fnc_addActionToClass;
 //[cursorTarget, 0, ["ACE_MainActions"],_actionIntelSearch] call ace_interact_menu_fnc_addActionToObject;
 //Add Ask Intel (civilians)
 //_actionIntelAsk = ["AskIntel", "Ask for Intel", "", {cursorTarget spawn btc_fnc_info_ask;}, {(side cursorTarget == civilian && {cursorTarget isKindOf 'Civilian_F'} && Alive cursorTarget);}] call ace_interact_menu_fnc_createAction;
 _actionIntelAsk = ["AskIntel", "Ask for Intel", "", {btc_int_target = cursorTarget; [] spawn btc_fnc_info_ask;}, {true;}] call ace_interact_menu_fnc_createAction;
 [typeOf cursorTarget, 0, ["ACE_MainActions"], _actionIntelAsk] call ace_interact_menu_fnc_addActionToClass;
 //[cursorTarget, 0, ["ACE_MainActions"],_actionIntelSearch] call ace_interact_menu_fnc_addActionToObject;
 


 
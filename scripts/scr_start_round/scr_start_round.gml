// scr_start_round.gml
/// @desc Start a new round and update initiative

global.round_number += 1;

// Gain initiative and cap it at the max
global.initiative += global.initiative_gain;
if (global.initiative > global.max_initiative) { // Fixing comparison
    global.initiative = global.max_initiative;
}

// Debug log
show_debug_message("Round: " + string(global.round_number) + 
    " | Initiative: " + string(global.initiative));
// Start a new round
global.round_number += 1;
global.initiative = min(global.max_initiative, global.initiative + global.initiative_gain);

show_debug_message("Round: " + string(global.round_number) + " | Initiative: " + string(global.initiative));

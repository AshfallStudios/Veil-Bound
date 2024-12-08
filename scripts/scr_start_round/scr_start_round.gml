/// scr_start_round()

// Ensure global.initiative_gain is initialized
if (!variable_global_exists("initiative_gain")) {
    global.initiative_gain = 3;  // Set a default value if not initialized
    show_debug_message("Fallback: Reinitialized global.initiative_gain.");
}

// Ensure global.round_number is initialized
if (!variable_global_exists("round_number")) {
    global.round_number = 1;  // Initialize round_number if it doesn't exist
    show_debug_message("Fallback: Reinitialized global.round_number.");
} else {
    global.round_number += 1;  // Increment round_number if it exists
}

// Ensure global.max_initiative is initialized
if (!variable_global_exists("max_initiative")) {
    global.max_initiative = 20;  // Set a default value if not initialized
    show_debug_message("Fallback: Reinitialized global.max_initiative.");
}

global.initiative = min(global.max_initiative, global.initiative + global.initiative_gain);

show_debug_message("Round: " + string(global.round_number) + " | Initiative: " + string(global.initiative));

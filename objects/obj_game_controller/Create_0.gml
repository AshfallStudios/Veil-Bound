// Initialize globals first
scr_initialize_globals();
show_debug_message("Global variables initialized in Create Event.");

// Debug to verify `global.hand`
if (variable_global_exists("hand")) {
    show_debug_message("Hand initialized as: " + string(global.hand));
} else {
    show_debug_message("Error: global.hand does not exist in Create Event!");
}

// Room initialization flags
global.room_initialized = false;
global.room_fully_initialized = false; // New flag to track full initialization
global.hand_logged = false; // New flag to prevent infinite logging of `global.hand`

show_debug_message("Room Start Event triggered for room: " + room_get_name(room));

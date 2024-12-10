// Debug message to confirm room initialization
show_debug_message("Room Start Event triggered for room: " + room_get_name(room));

// Set a global flag to indicate the room has been initialized
global.room_initialized = true;

// Debug message to confirm the flag has been set
show_debug_message("global.room_initialized set to true. Step Event will handle delayed initialization.");




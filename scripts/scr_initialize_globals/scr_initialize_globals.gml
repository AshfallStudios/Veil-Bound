// Initializes all global variables
function scr_initialize_globals() {
    global.room_initialized = false;  // Start as not initialized
    global.hand = [];                 // Initialize an empty hand
    global.max_handsize = 7;          // Set max hand size
    global.max_initiative = 20;       // Set max initiative
    global.initiative = 0;            // Set starting initiative
    global.initiative_gain = 3;       // Set initiative gain
    global.round_number = 1;          // Set round number
    global.deck = [];                 // Initialize an empty deck
    global.graveyard = [];            // Initialize an empty graveyard
    global.player_hp = 40;            // Set player HP

    // Populate the deck with placeholder cards for testing
    for (var i = 1; i <= 30; i++) {
        array_push(global.deck, "Card_" + string(i));  // Add cards named "Card_1", "Card_2", etc.
    }

    show_debug_message("Global variables initialized.");
}


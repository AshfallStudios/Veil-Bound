/// scr_draw_cards(num_cards)
var num_cards = argument0;

// Initialize global variables if they don't exist (failsafe)
if (!variable_global_exists("max_handsize")) {
    global.max_handsize = 7;  // Default value
    show_debug_message("Fallback: Reinitialized global.max_handsize.");
}

// Debug check for global.hand
if (!variable_global_exists("hand")) {
    show_debug_message("Error: global.hand does not exist!");
} else {
    show_debug_message("global.hand is ready with " + string(array_length(global.hand)) + " cards.");
}

// Initialize global.hand if it does not exist
if (!variable_global_exists("hand") || !is_array(global.hand)) {
    global.hand = [];
    show_debug_message("Fallback: Reinitialized global.hand as an empty array.");
}

// Loop to draw the specified number of cards
for (var i = 0; i < num_cards; i++) {
    if (array_length(global.deck) > 0) {
        // Draw a card from the deck
        var drawn_card = array_pop(global.deck);
        array_push(global.hand, drawn_card);
        show_debug_message("Drew card: " + string(drawn_card));
    } else {
        // Perform a fatigue shuffle if the deck is empty
        scr_fatigue_shuffler();
    }
}

// Check for hand overflow and recycle if needed
if (array_length(global.hand) > global.max_handsize) {
    scr_recycle_hand();
}



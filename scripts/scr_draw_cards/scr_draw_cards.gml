/// scr_draw_cards(num_cards)
var num_cards = argument0;

// Debug check
if (!variable_global_exists("hand")) {
    show_debug_message("Error: global.hand does not exist!");
} else {
    show_debug_message("global.hand is ready with " + string(array_length(global.hand)) + " cards.");
}

if (!variable_global_exists("hand") || !is_array(global.hand)) {
    global.hand = [];
    show_debug_message("Fallback: Reinitialized global.hand as an empty array.");
}


/// @param num_cards The number of cards to draw
var num_cards = argument0;

for (var i = 0; i < num_cards; i++) {
    if (array_length(global.deck) > 0) {
        // Draw a card
        var drawn_card = array_pop(global.deck);
        array_push(global.hand, drawn_card);
        show_debug_message("Drew card: " + string(drawn_card));
    } else {
        // Perform a fatigue shuffle if the deck is empty
        scr_fatigue_shuffler();
    }
}

// Check for hand overflow
if (array_length(global.hand) > global.max_handsize) {
    scr_recycle_hand();
}


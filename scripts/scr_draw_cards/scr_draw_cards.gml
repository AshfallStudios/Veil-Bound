/// scr_draw_cards(num_cards)
// Argument: Number of cards to draw
var num_cards = argument0;

// Ensure global variables are properly initialized
if (!variable_global_exists("deck")) {
    show_debug_message("Error: global.deck is not initialized! Initializing an empty deck.");
    global.deck = [];
    return;
}

if (!variable_global_exists("hand")) {
    show_debug_message("Warning: global.hand is not initialized. Initializing an empty hand.");
    global.hand = [];
}

if (!variable_global_exists("max_handsize")) {
    show_debug_message("Warning: global.max_handsize is not initialized. Setting default to 7.");
    global.max_handsize = 7;
}

// Check if the deck is empty
if (array_length(global.deck) == 0) {
    show_debug_message("Error: Deck is empty! Unable to draw cards.");
    return;
}

// Debug: Show the number of cards to draw
show_debug_message("Attempting to draw " + string(num_cards) + " card(s).");

// Draw cards up to the specified number
for (var i = 0; i < num_cards; i++) {
    // Check if the hand is full
    if (array_length(global.hand) < global.max_handsize) {
        // Remove the top card from the deck and add it to the hand
        var drawn_card = array_pop(global.deck);
        array_push(global.hand, drawn_card);
        show_debug_message("Card drawn: " + string(drawn_card));
    } else {
        show_debug_message("Hand is full. Cannot draw more cards.");
        break;
    }
}

// Debug: Display the updated state of the hand and deck
show_debug_message("Updated hand: " + string(global.hand));
show_debug_message("Remaining deck: " + string(global.deck));


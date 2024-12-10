/// scr_draw_cards(num_cards)
var num_cards = argument0;

// Ensure the deck is not empty
if (array_length(global.deck) == 0) {
    show_debug_message("Error: Deck is empty! Unable to draw cards.");
    return;
}

// Draw cards up to the specified number
for (var i = 0; i < num_cards; i++) {
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

// Debug: Display the updated hand
show_debug_message("Updated hand: " + string(global.hand));




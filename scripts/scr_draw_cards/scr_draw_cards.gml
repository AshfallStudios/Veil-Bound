/// scr_draw_cards
/// Function to draw cards into the player's hand
/// @param cards_to_draw (number): Number of cards to draw
function scr_draw_cards(cards_to_draw) {
    // Ensure global.hand is properly initialized
    if (!is_array(global.hand)) {
        global.hand = []; // Reinitialize as an empty array
        show_debug_message("Warning: global.hand was not an array. Reinitializing.");
    }

    // Check if the deck has cards to draw
    if (array_length(global.deck) == 0) {
        show_debug_message("Deck is empty. Shuffling graveyard into deck.");
        scr_fatigue_shuffler();
    }

    // Draw the specified number of cards
    for (var i = 0; i < cards_to_draw; i++) {
        if (array_length(global.deck) > 0) {
            // Remove the top card from the deck
            var card_instance = array_pop(global.deck);
            
            // Ensure the card is valid before adding to the hand
            if (instance_exists(card_instance)) {
                array_push(global.hand, card_instance);
                show_debug_message("Card drawn: " + string(card_instance));
            } else {
                show_debug_message("Invalid card instance drawn. Skipping.");
            }
        } else {
            show_debug_message("Deck is empty. Cannot draw more cards.");
            break;
        }
    }

    // Update hand state for debugging
    show_debug_message("Updated hand: " + string(global.hand));
}

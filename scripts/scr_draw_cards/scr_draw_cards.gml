/// scr_draw_cards(num_cards)
var num_cards = argument0;

if (!variable_global_exists("deck")) {
    show_debug_message("Error: global.deck does not exist! Initializing now.");
    global.deck = [];
}

if (array_length(global.deck) == 0) {
    show_debug_message("Error: Deck is empty! Unable to draw cards.");
    return;
}

for (var i = 0; i < num_cards; i++) {
    if (array_length(global.hand) < global.max_handsize) {
        var drawn_card = array_pop(global.deck);
        array_push(global.hand, drawn_card);
        show_debug_message("Card drawn: " + string(drawn_card));
    } else {
        show_debug_message("Hand is full. Cannot draw more cards.");
        break;
    }
}

show_debug_message("Updated hand: " + string(global.hand));





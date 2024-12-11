// scr_play_card.gml
/// @param card_index the index of the card in hand
/// @desc plays a card from hand and moves it to the graveyard

var card_index = argument0;

if (card_index >= 0 && card_index < array_length(global.hand)) {
    // Retrieve the card to be played
    var played_card = global.hand[card_index];
    
    // Remove the card from the hand
    global.hand = array_delete(global.hand, card_index, 1);
    
    // Move the card to the graveyard
    array_push(global.graveyard, played_card);

    show_debug_message("Played card: " + string(played_card.card_name));
} else { 
    show_debug_message("Invalid card index.");
}

// scr_play_card.gml
/// @param card_index the index of the card inhand
/// @desc plays a card from hand and moves to the graveyard

var card_index = argument0;

if (card_index >= 0 && card_index < array_length(global.hand)) {
    var played_card = array_remove(global.hand, card_index); // Fixing syntax
    array_push(global.graveyard, played_card);

    show_debug_message("Played card: " + string(played_card));
} else { 
    show_debug_message("Invalid card index.");
}
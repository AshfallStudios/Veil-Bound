//scr_recycle_hand.gml
/// @desc recycle cards from the hand into the deck

while (array_length(global.hand) > global.max_handsize) {
	var card_to_recycle = array_pop(global.hand); // pick the last card
	array_push(global.deck, card_to_recycle);
}

show_debug_message("recycled hand to max size.");

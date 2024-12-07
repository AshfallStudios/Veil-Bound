// scr_draw_cards.gml
/// @param amount The number of cards to draw
/// @desc Draw cards and handle graveyard-to-deck shuffle 

var amount = argument0;

for (var i = 0; i < amount; i++) {
	if (array_length(global.deck) > 0) {
		//draw a card from the deck
		var drawn_card = array_pop(global.deck);
		array_push(global.hand, drawn_card);
	} else {
		// If the deck is empty, perform a fatigue shuffle
		if (array_lenght(global.graveyard) > 0) {
			scr_fatigue_shuffle();
			i--; // Retry drawing after shuffle 
		} else { 
			break; // No cards left to draw
		}
	}
}

// Check for hand size overflow 
if (array_lenght(global.hand)> global.max_handsize) {
	scr_recycle_hand();
}


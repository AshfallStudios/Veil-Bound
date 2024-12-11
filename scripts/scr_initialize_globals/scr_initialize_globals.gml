/// scr_initialize_globals()
// Initialize global variables
global.deck = [];  // Initialize the deck as an empty array
global.hand = [];  // Initialize the hand as an empty array
global.max_handsize = 7;
global.initiative = 0;
global.initiative_gain = 3;
global.round_number = 1;

// Populate the deck with test cards
for (var i = 1; i <= 10; i++) {
    var card = {
        sprite: "spr_card_" + string(i), // Replace with actual sprite names
        card_name: "Test Card " + string(i),
        card_id: i
    };
    array_push(global.deck, card);
}

show_debug_message("Globals initialized: Deck size = " + string(array_length(global.deck)));



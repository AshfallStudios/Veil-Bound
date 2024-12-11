/// scr_initialize_globals()
// Initialize global variables
global.deck = [];  // Initialize the deck as an empty array
global.hand = [];  // Initialize the hand as an empty array
global.graveyard = []; // Initialize the graveyard as an empty array
global.max_handsize = 7;
global.initiative = 0;
global.initiative_gain = 3;
global.round_number = 1;
global.selected_card = undefined; // No card selected initially

// Verify if CardsLayer exists
if (!layer_exists("CardsLayer")) {
    show_debug_message("Error: CardsLayer does not exist! Initialization halted.");
    return; // Stop further execution
}

// Add test cards to the deck dynamically (add object references, not instances)
for (var i = 1; i <= 60; i++) {
    var card_name = "obj_test_card" + string(i); // Dynamically generate object names
    if (object_exists(asset_get_index(card_name))) {
        array_push(global.deck, asset_get_index(card_name)); // Add object reference to deck
        show_debug_message("Added card to deck: " + string(card_name));
    } else {
        show_debug_message("Error: Object " + string(card_name) + " does not exist!");
    }
}

// Shuffle the deck
array_shuffle(global.deck);

show_debug_message("Globals initialized: Deck size = " + string(array_length(global.deck)));

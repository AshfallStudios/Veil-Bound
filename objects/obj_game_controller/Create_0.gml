// Create event
global.initiative = 0;
global.initiative_gain = 3;
global.max_initiative = 20;
global.round_number = 1;

global.deck = ["card1", "card2", "card3"]; // Example deck
global.graveyard = [];
global.hand = [];
global.max_handsize = 7;
global.player_hp = 40;

// Populate the deck with placeholder cards for testing (if desired)
for (var i = 4; i <= 30; i++) {
    array_push(global.deck, "Card_" + string(i));
}

show_debug_message("Game initialized.");

// Step event example: Start a round and draw cards
if (keyboard_check_pressed(vk_space)) { // Press space to start a new round
    scr_start_round();
    scr_draw_cards(3);
}


// Create event for obj_game_controller

// Initialize global variables
global.max_handsize = 7;  // Set max hand size
global.max_initiative = 20;  // Set initiative max
global.initiative = 0;  // Set starting initiative
global.initiative_gain = 3;  // Set initiative gain
global.round_number = 1;  // Set round number

global.deck = ["card1", "card2", "card3"];  // Initialize deck with sample cards
global.hand = [];  // Initialize an empty hand
global.graveyard = [];  // Initialize an empty graveyard
global.player_hp = 40;  // Set player HP

// Populate the deck with placeholder cards for testing (if desired)
for (var i = 4; i <= 30; i++) {
    array_push(global.deck, "Card_" + string(i));  // Add more cards to the deck
}

// Debug message to confirm game initialization
show_debug_message("Game initialized.");

// Step event example: Start a round and draw cards
if (keyboard_check_pressed(vk_space)) {  // Press space to start a new round
    scr_start_round();  // Call the start round script
    scr_draw_cards(3);  // Draw 3 cards at the start of the round
}
scr_load_cards();

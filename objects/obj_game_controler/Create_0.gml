// create event
global.initiative = 0;
global.initiative_gain = 3;
global.max_initiative = 20;
global.round_number = 1;

global.deck = ["card1", "card2", "card3"]; //exemple deck
global.graveyard = []
global.hand = []
global.max_handsize = 7;
global.player_hp = 40;

show_debug_message("Game initialized.");

//step event(exemple: start round and draw cards)
if (keyboard_check_pressed(vk_space)) { //press space to start a new round
	scr_start_round();
	scr_draw_cards(3);
}

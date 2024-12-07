//scr_fatigue_shuffle.gml
///@desc Shuffle the graveyard into the deck and apply fatigue damage

for (var i = 0; i < array_length(global.graveyard); i++) {
	array_push(global.deck, global.graveyard[i]);
}
global.graveyard = []; // Clear the graveyard

//apply fatigue damage
var fatigue_damage = floor(global.player_hp * 0.25);
global.player_hp -= fatigue_damage;

show_debug_message("Fatigue shuffle performed. Player HP: " + string(global.player_hp));

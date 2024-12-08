// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fatigue_shuffler(){
if (array_length(global.graveyard) > 0) {
    // Shuffle graveyard into deck
    while (array_length(global.graveyard) > 0) {
        var card = array_pop(global.graveyard);
        array_push(global.deck, card);
    }

    // Shuffle the deck
    array_shuffle(global.deck);

    // Apply fatigue damage
    global.player_hp = max(0, global.player_hp - floor(global.player_hp * 0.25));
    show_debug_message("Fatigue shuffle completed. Player HP: " + string(global.player_hp));
} else {
    show_debug_message("Graveyard is empty. Cannot perform fatigue shuffle.");
}
}
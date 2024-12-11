/// scr_recycle_hand()
// Move excess cards to the graveyard
while (array_length(global.hand) > global.max_handsize) {
    var card = array_pop(global.hand);
    array_push(global.graveyard, card);
    show_debug_message("Recycled card to graveyard: " + string(card.card_name));
}

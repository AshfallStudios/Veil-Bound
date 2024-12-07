/// This is the initialization code for the cards.json logic found in the datafiles
scr_load_cards();

for (var i = 0; i < array_length(global.card_pool); i++) {
    show_debug_message("Card: " + global.card_pool[i].card_name);
}

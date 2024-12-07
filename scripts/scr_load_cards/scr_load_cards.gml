// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_cards(){
// Path to the cards JSON file
    var json_path = "data/cards.json";

    // Read the file contents
    var json_data = file_text_open_read(json_path);
    var json_string = "";
    while (!file_text_eof(json_data)) {
        json_string += file_text_read_string(json_data);
        file_text_readln(json_data);
    }
    file_text_close(json_data);

    // Parse the JSON data
    var card_data = json_parse(json_string);

    // Store the data in a global array for easy access
    global.card_pool = [];

    for (var i = 0; i < array_length(card_data); i++) {
        var card_info = card_data[i];
        array_push(global.card_pool, card_info);
    }
}
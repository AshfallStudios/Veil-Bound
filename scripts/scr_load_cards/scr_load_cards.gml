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

/// scr_load_cards()
var json = file_text_read("cards.json"); // Load JSON data
global.card_data = json_parse(json);    // Parse JSON into a structured array

global.card_instances = []; // Array to store card instances

// Iterate over the card data
for (var i = 0; i < array_length(global.card_data); i++) {
    var card_info = global.card_data[i];
    var card_instance = instance_create_layer(100 + i * 50, 100, "LayerName", obj_card);

    // Set card properties
    card_instance.card_name = card_info.name;
    card_instance.card_type = card_info.type;
    card_instance.card_cost = card_info.cost;
    card_instance.card_effect = card_info.effect;

    // Store the instance in global array
    array_push(global.card_instances, card_instance);
}

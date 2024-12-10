function scr_load_cards() {
    // Path to the cards JSON file
    var json_path = "cards.json";

    // Open the file for reading
    var json_data = file_text_open_read(json_path);
    var json_string = "";

    // Read the file content into the json_string
    while (!file_text_eof(json_data)) {
        json_string += file_text_read_string(json_data);
        file_text_readln(json_data); // Move to next line
    }

    // Close the file after reading
    file_text_close(json_data);

    // Parse the JSON data
    var card_data = json_parse(json_string);

    // Store the data in a global array for easy access
    global.card_pool = [];

    for (var i = 0; i < array_length(card_data); i++) {
        var card_info = card_data[i];
        array_push(global.card_pool, card_info);
    }

    // Check if the "CardsLayer" exists
    if (!layer_exists("CardsLayer")) {
        show_error("The layer 'CardsLayer' does not exist in the current room!", true);
        return; // Stop further execution if the layer is missing
    }

    // After loading the cards, you can also create instances
    global.card_instances = []; // Array to store card instances

    // Iterate over the card data to create instances
    for (var i = 0; i < array_length(global.card_pool); i++) {
        var card_info = global.card_pool[i];
        
        // Create the card instance on the "CardsLayer"
        var card_instance = instance_create_layer(100 + i * 50, 100, "CardsLayer", obj_card);

        // Set card properties using JSON keys
        card_instance.card_name = card_info.card_name;  // Corrected key
        card_instance.card_type = card_info.card_class; // Corrected key for class
        card_instance.card_cost = card_info.card_cost;  // Corrected key for cost
        card_instance.card_effect = card_info.card_effect; // Corrected key for effect

        // Store the instance in the global array
        array_push(global.card_instances, card_instance);
    }
}



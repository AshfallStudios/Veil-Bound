// Only execute if the room has been initialized and not already processed
if (global.room_initialized) {
    show_debug_message("Step Event: Accessing layers after room initialization.");

    // Safely check for each layer
    if (layer_exists("CardsLayer")) {
        var cards_layer_id = layer_get_id("CardsLayer");
        show_debug_message("CardsLayer ID: " + string(cards_layer_id));
    } else {
        show_debug_message("Error: CardsLayer does not exist!");
    }

    if (layer_exists("Instances_1")) {
        var instances_layer_id = layer_get_id("Instances_1");
        show_debug_message("Instances_1 ID: " + string(instances_layer_id));
    } else {
        show_debug_message("Error: Instances_1 does not exist!");
    }

    if (layer_exists("game_controller_layer")) {
        var game_controller_layer_id = layer_get_id("game_controller_layer");
        show_debug_message("game_controller_layer ID: " + string(game_controller_layer_id));
    } else {
        show_debug_message("Error: game_controller_layer does not exist!");
    }

    if (layer_exists("Assets_1")) {
        var assets_layer_id = layer_get_id("Assets_1");
        show_debug_message("Assets_1 ID: " + string(assets_layer_id));
    } else {
        show_debug_message("Error: Assets_1 does not exist!");
    }

    if (layer_exists("Background")) {
        var background_layer_id = layer_get_id("Background");
        show_debug_message("Background ID: " + string(background_layer_id));
    } else {
        show_debug_message("Error: Background does not exist!");
    }

    // Reset the flag to prevent repeating this logic
    global.room_initialized = false;

    // Mark that the room has been fully initialized to skip future checks
    global.room_fully_initialized = true;
}

// Only log `global.hand` once after room initialization
if (!global.hand_logged) {
    if (variable_global_exists("hand")) {
        show_debug_message("Current hand: " + string(global.hand));
    } else {
        show_debug_message("Error: global.hand does not exist in Step Event! Reinitializing.");
        global.hand = []; // Fallback to ensure no further errors
    }

    // Prevent further logging of `global.hand`
    global.hand_logged = true;
}

// Example: Prevent continuous execution by wrapping logic in a condition
if (keyboard_check_pressed(vk_space)) {
    show_debug_message("Space key pressed, drawing cards...");
    scr_draw_cards(3); // Example logic: draw 3 cards
}

// Step Event for obj_game_controller

// Ensure room and layers are fully initialized
if (!global.room_initialized) {
    if (layer_exists("CardsLayer")) {
        global.room_initialized = true;
        show_debug_message("Room and CardsLayer initialized. Proceeding with global setup.");
        scr_initialize_globals(); // Initialize globals after the room is ready
    } else {
        show_debug_message("Waiting for CardsLayer to initialize...");
    }
    return; // Prevent further logic until initialization is complete
}

// Safely check for each layer (only for debugging purposes; can be removed if unnecessary)
if (!global.room_fully_initialized) {
    show_debug_message("Step Event: Accessing layers after room initialization.");

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

    global.hand_logged = true;
}

// Phase Manager Logic
switch (global.game_phase) {
    case "Intent":
        show_debug_message("Phase: Intent");
        if (array_length(global.hand) == 0) {
            show_debug_message("No cards in hand. Attempting to draw.");
            scr_draw_cards(1); // Draw at least one card
        }

        if (array_length(global.hand) > 0) {
            if (keyboard_check_pressed(vk_space)) {
                global.selected_card = global.hand[0]; // Select the first card
                show_debug_message("Selected card: " + string(global.selected_card));
                global.hand = array_delete(global.hand, 0, 1); // Remove selected card from hand
                global.game_phase = "Counter"; // Transition to Counter phase
            }
        } else {
            show_debug_message("Still no cards in hand after drawing. Skipping to Draw phase.");
            global.game_phase = "Draw"; // Skip to Draw phase if no cards can be drawn
        }
        break;

    case "Counter":
        show_debug_message("Phase: Counter");
        if (keyboard_check_pressed(vk_space)) {
            show_debug_message("Counter actions processed.");
            global.game_phase = "Resolve";
        }
        break;

    case "Resolve":
        show_debug_message("Phase: Resolve");
        if (global.selected_card) {
            scr_play_card(global.selected_card); // Use your play card script
            show_debug_message("Card resolved: " + string(global.selected_card));
            global.selected_card = undefined; // Clear the selected card
            global.game_phase = "Recycle"; // Move to Recycle phase
        } else {
            show_debug_message("No card to resolve. Moving to Recycle phase.");
            global.game_phase = "Recycle";
        }
        break;

    case "Recycle":
        show_debug_message("Phase: Recycle");
        if (array_length(global.hand) > global.max_handsize) {
            scr_recycle_hand(); // Call your recycle script
        }
        global.game_phase = "Draw"; // Move to Draw phase
        break;

    case "Draw":
        show_debug_message("Phase: Draw");
        if (array_length(global.deck) == 0) {
            scr_fatigue_shuffler(); // Shuffle graveyard into deck
        }
        scr_draw_cards(1 + global.initiative); // Draw cards logic
        global.game_phase = "EndRound"; // Move to End Round after drawing
        break;

    case "EndRound":
        show_debug_message("Phase: End Round");
        scr_reset_initiative(); // Reset initiative
        global.game_phase = "Intent"; // Restart phases
        break;

    default:
        show_debug_message("Unknown phase! Resetting to Intent.");
        global.game_phase = "Intent";
        break;
}
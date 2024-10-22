// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
            up:    [input_binding_key("W")],
            down:  [input_binding_key("S")],
            left:  [input_binding_key("A")],
            right: [input_binding_key("D")],
            
            south:  [input_binding_key("K")],
            west:  [input_binding_key("J")],
			east: [input_binding_key("I")],
			north: [input_binding_key("U")],
			
            start: [input_binding_key(vk_enter), input_binding_key("Y")],
            select: [input_binding_key(vk_rshift), input_binding_key("T")],
			
			l1: [input_binding_key("C")],
			l2: [input_binding_key("V")],
			r1: [input_binding_key("B")],
			r2: [input_binding_key("N")],
         
        },
        
        gamepad:
        {
            up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
            
            south:  input_binding_gamepad_button(gp_face1),
            east:  input_binding_gamepad_button(gp_face2),
			north:  input_binding_gamepad_button(gp_face4),
            west:  input_binding_gamepad_button(gp_face3),
			
			
            start:  input_binding_gamepad_button(gp_start),
            select: input_binding_gamepad_button(gp_select),
			
			l1: input_binding_gamepad_button(gp_shoulderl),
			l2: input_binding_gamepad_button(gp_shoulderlb),
			r1: input_binding_gamepad_button(gp_shoulderr),
			r2: input_binding_gamepad_button(gp_shoulderrb),
			
        },
        
	}
}
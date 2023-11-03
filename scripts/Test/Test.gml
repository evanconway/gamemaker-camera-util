// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Test() {
	var f = function() {
		var change_x = 0;
		var change_y = 0;
		if (keyboard_check(vk_left)) change_x -= 1;
		if (keyboard_check(vk_right)) change_x += 1;
		if (keyboard_check(vk_up)) change_y -= 1;
		if (keyboard_check(vk_down)) change_y += 1;
		camera_set_position(camera_get_x() + change_x, camera_get_y() + change_y);
			
		if (keyboard_check_pressed(ord("1"))) room_goto(rm_test_1);
		if (keyboard_check_pressed(ord("2"))) room_goto(rm_test_2);
	};
	
	var ts = time_source_create(
		time_source_game,
		1,
		time_source_units_frames,
		f,
		[],
		-1
	);
	time_source_start(ts);
}
Test();

function test() {
	var f = function() {
		var change_x = 0;
		var change_y = 0;
		if (keyboard_check(vk_left)) change_x -= 1;
		if (keyboard_check(vk_right)) change_x += 1;
		if (keyboard_check(vk_up)) change_y -= 1;
		if (keyboard_check(vk_down)) change_y += 1;
		if (change_x != 0 || change_y != 0) {
			var pointless = 5;
		}
		camera_set_position(camera_get_x() + change_x, camera_get_y() + change_y);
			
		if (keyboard_check_pressed(ord("1"))) room_goto(rm_test_1);
		if (keyboard_check_pressed(ord("2"))) room_goto(rm_test_2);
		
		if (keyboard_check_pressed(ord("9"))) camera_set_size(100, 100, 10);
		if (keyboard_check_pressed(ord("0"))) camera_set_size(320, 180);
	};
	
	time_source_start(time_source_create(
		time_source_game,
		1,
		time_source_units_frames,
		f,
		[],
		-1
	));
}
test();

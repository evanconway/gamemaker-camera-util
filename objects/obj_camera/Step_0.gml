frame_count++;
if (frame_count >= game_get_speed(gamespeed_fps)) {
	frame_count = 0;
	count++;
	//show_debug_message($"camera count: {count}");
}

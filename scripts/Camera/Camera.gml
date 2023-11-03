function camera_init() {
	var f = function() {
		show_debug_message("hello world");
	}
	var time_source = time_source_create(
		time_source_global,
		60,
		time_source_units_frames,
		f,
		[],
		-1
	);
	time_source_start(time_source);
}

camera_init();

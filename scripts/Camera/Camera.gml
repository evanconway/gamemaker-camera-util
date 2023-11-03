global.camera = noone;
global.camera_interval = 0;

function camera_init() {
	var f = function() {};
	global.camera_interval = time_source_create(
		time_source_global,
		1,
		time_source_units_frames,
		f
	);
	f = function() {
		if (instance_exists(obj_camera)) {
			time_source_stop(global.camera_interval);
			time_source_destroy(global.camera_interval);
			return;
		}
		instance_create_depth(0, 0, 0, obj_camera);
		show_debug_message("-----------------creating camera...");
	};
	time_source_reconfigure(
		global.camera_interval,
		1,
		time_source_units_frames,
		f,
		[],
		-1
	);
	time_source_start(global.camera_interval);
}

camera_init();

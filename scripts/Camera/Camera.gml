global.camera = noone;
global.camera_interval = 0;

function camera_init() {
	// feather ignore GM1043
	global.camera_interval = time_source_create(
		time_source_global,
		1,
		time_source_units_frames,
		function() {
			if (instance_exists(obj_camera)) {
				time_source_stop(global.camera_interval);
				time_source_destroy(global.camera_interval);
				return;
			}
			global.camera = instance_create_depth(0, 0, 16001, obj_camera);
		},
		[],
		-1
	);
	time_source_start(global.camera_interval);
}

camera_init();

/**
 * Sets the width, heigh, and size multiplier of the camera.
 *
 * @param {real} width
 * @param {real} height
 * @param {real} multiplier
 */
function camera_set_size(width, height, multiplier=1) {
	if (global.camera == noone) return;
	global.camera.width = width;
	global.camera.height = height;
	global.camera.multiplier = multiplier;
	global.camera.setup();
}

/**
 * Set the position of the camera.
 *
 * @param {real} position_x
 * @param {real} position_y
 */
function camera_set_position(position_x, position_y) {
	if (global.camera == noone) return;
	camera_set_view_pos(view_camera[0], position_x, position_y);
}

/**
 * Get the x position of the camera.
 */
function camera_get_x() {
	if (global.camera == noone) return 0;
	return camera_get_view_x(view_camera[0]);
}

/**
 * Get the y position of the camera.
 */
function camera_get_y() {
	if (global.camera == noone) return 0;
	return camera_get_view_y(view_camera[0]);
}

function camera_get_width() {
	if (global.camera == noone) return 0;
	// feather disable GM1035
	return global.camera.width;
}

function camera_get_height() {
	if (global.camera == noone) return 0;
	// feather disable GM1035
	return global.camera.height;
}

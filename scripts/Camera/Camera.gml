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
		instance_create_depth(0, 0, 16001, obj_camera);
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

function camera_warn() {
	if (instance_exists(obj_camera)) return;
	show_error("Camera does not exist yet. Cannot call camera functions.", true);
}

/**
 * Sets the width, heigh, and size multiplier of the camera.
 *
 * @param {real} width
 * @param {real} height
 * @param {real} multiplier
 */
function camera_set_size(width, height, multiplier=1) {
	camera_warn();
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
	camera_warn();
	camera_set_view_pos(view_camera[0], position_x, position_y);
}

/**
 * Get the x position of the camera.
 */
function camera_get_x() {
	camera_warn();
	return camera_get_view_x(view_camera[0]);
}

/**
 * Get the y position of the camera.
 */
function camera_get_y() {
	camera_warn();
	return camera_get_view_y(view_camera[0]);
}

function camera_get_width() {
	camera_warn();
	return global.camera.width;
}

function camera_get_height() {
	camera_warn();
	return global.camera.height;
}

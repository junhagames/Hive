isOpen = !instance_exists(obj_parent_enemy);
image_index = isOpen;

if (isOpen) {
	with (blockID) {
		instance_destroy();
	}
}
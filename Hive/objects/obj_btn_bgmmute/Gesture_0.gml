if (!instance_exists(obj_transition_fadeout)) {
	if (global.bgmVolume > 0) {
		global.bgmVolume = 0;
	}
	else {
		global.bgmVolume = 1;
	}
	ini_open(SETTING_FILE);
	ini_write_real("settings", "bgmVolume", global.bgmVolume);
	ini_close();
}
// 리소스 로드 완료
var isResourcesLoad = audio_group_is_loaded(audiogroup_bgm) && audio_group_is_loaded(audiogroup_sfx);

if (isResourcesLoad) {
	room_goto_next();
}
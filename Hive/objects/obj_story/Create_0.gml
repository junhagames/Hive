textPos = 0;
textSpeed = 4;
skipPos = 0;
skipPosMax = room_speed * 2;
skipAlpha = 0;
continueAlpha = 0;
alarm[ALARM_STORY.TEXT] = textSpeed;

if (global.currentWorld == "school") {
	title = "챕터 1. 영웅등장";
	text = "2020년 이미 멸종된 줄 알았던 수많은 고대 곤충들이 세계 전역 땅속에서 나오기 시작한다.#" +
		"고대 곤충들로부터 인류는 속수무책으로 당하고, 모든 도시들이 파괴되었다.#" +
		"인류는 고대 곤충을 섬멸하기 위해 군대를 총 동원하여 전쟁을 하게 된다.#" +
		"전쟁 도중, \"메가하이브\"라 불리는 곤충 군락의 중심지가 \"선린인터넷고\"에 존재한다는#" +
		"중요한 정보를 입수하게 된다.#" +
		"메가하이브의 위치 정보를 입수함에도 불구하고 고대 곤충들의 엄청난 번식력을 이기지 못해,#" +
		"고대 곤충과의 전쟁에 패배와 함께 생존한 나머지 극소수의 인류는 멸종의 위기를 맞이하게 된다.##" + 
		"모두가 희망을 잃어버렸을 때, 한 영웅이 등장한다.";
}

// 파티클 생성기
particleSys = part_system_create();
emitterSmoke = part_emitter_create(particleSys);
emitterEmber = part_emitter_create(particleSys);
part_emitter_region(particleSys, emitterSmoke, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(particleSys, emitterSmoke, global.particleSmoke, 1);
part_emitter_region(particleSys, emitterEmber, 0, room_width, room_height, room_height, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(particleSys, emitterEmber, global.particleEmber, 1);
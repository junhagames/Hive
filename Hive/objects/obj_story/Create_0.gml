textPos = 0;
textSpeed = 6;
skipPos = 0;
skipPosMax = room_speed;
skipAlpha = 0;
continueAlpha = 0;
alarm[ALARM_STORY.TEXT] = textSpeed;

switch (global.currentWorld) {
	case "city":
        title = "도시 입성!";
        text = "사람이 살지 않는 유령 도시다#메가하이브 외각쪽에 위치하고 있기 때문에 강력하지 않은 고대곤충들이 서식하고 있다#소문에 의하면 매우 위험한 대왕지네가 도시를 장악하고 있다고 한다";
        break;
    case "swamp":
        title = "늪지대 입성!";
        text = "메가하이브의 영향으로 짧은 시간안에 녹색지역으로 버린 도시다#주로 날아다니는 고대 곤충들이 득실거린다";
        break;
    case "underground":
        title = "지하상가 입성!";
        text = "미로처럼 복잡한 구조를 가진 지하상가다#지하에 있기 때문에 매우 어두어서 조심해야겠다#개미가 많아보이는데 개미굴로 추측된다";
        break;
    case "jungle":
        title = "정글 입성!"
        text = "빽빽한 나무가 앞을 가려서 전진하기 힘들어진다#먹을 게 많아보이는데 독을 가진 생물이 많기 때문에 조심해야겠다";
        break;
    case "desert":
        title = "사막 입성!"
        text = "너무 더워서 점점 힘들어지는 기분이 느껴진다#저 멀리서 건물이 보이는데 신기루 인가...";
        break;
    case "school":
        title = "학교 입성!"
        text = "드디어 고대 곤충들의 비밀을 알아낼 수 있는 장소에 도착했다#곧있으면 엄청난 일이 일어날 것같은 예감이 든다";
        break;
}
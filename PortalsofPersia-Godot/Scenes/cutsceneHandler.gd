extends Node2D
class_name AbstractCutscene

var cutsceneTimer = 0;
var cutsceneMovingObjects: Array[Node2D];
var cutsceneMovingStartingPos: Array[Transform2D];
var cutsceneMovingEndingPos: Array[Transform2D];
var cutsceneMovingMoveType: Array[String];
var cutsceneMovingStartTime: Array[float];
var cutsceneMovingEndTime: Array[float];

func cutsceneProcess(delta: float) -> void:
	cutsceneTimer += delta;
	
	for i in range(cutsceneMovingObjects.size()):
		if(cutsceneMovingStartTime[i] <= cutsceneTimer && cutsceneMovingEndTime[i] >= cutsceneTimer):
			if(cutsceneMovingMoveType[i] == "lerp"):
				cutsceneMovingObjects[i].transform = lerp(cutsceneMovingObjects[i].transform, cutsceneMovingEndingPos[i], 0.09 * 60 * delta)

func Cinematic() -> void:
	print("zooming in .,.,")

func cutsceneStart() -> void:
	for i in range(cutsceneMovingObjects.size()):
		cutsceneMovingObjects[i].transform = cutsceneMovingStartingPos[i]

func moveObject(object: Node2D, starting: Transform2D, ending: Transform2D, startTime: float, endTime: float, moveType: String):
	cutsceneMovingObjects.append(object)
	cutsceneMovingStartingPos.append(starting)
	cutsceneMovingEndingPos.append(ending)
	cutsceneMovingStartTime.append(startTime)
	cutsceneMovingEndTime.append(endTime)
	cutsceneMovingMoveType.append(moveType)

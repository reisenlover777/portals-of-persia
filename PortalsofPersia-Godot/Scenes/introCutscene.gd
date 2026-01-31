extends AbstractCutscene

func _ready() -> void:
	moveObject($Camera2D/bar2, Transform2D($Camera2D/bar2.rotation_degrees, Vector2(-576.0, 324.0)), Transform2D($Camera2D/bar2.rotation_degrees, Vector2(-576.0, 324.0 - 100)), 0, 1, "lerp")
	moveObject($Camera2D/bar1, Transform2D($Camera2D/bar1.rotation_degrees, Vector2(-576.0, -481.0)), Transform2D($Camera2D/bar1.rotation_degrees, Vector2(-576.0, -481.0 + 100)), 0, 1, "lerp")
	moveObject($Camera2D, $Camera2D.transform, Transform2D($Camera2D.rotation_degrees, Vector2(576, 324 + 100.0)), 2, 4, "lerp")

	cutsceneStart()

func _process(delta: float) -> void:
	cutsceneProcess(delta)
	if(cutsceneTimer >= 5):
		print("going to level 1!!")
		get_tree().change_scene_to_file("res://Scenes/intropt1.tscn")

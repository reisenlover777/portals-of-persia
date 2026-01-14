extends Node2D

var curPos;

func _physics_process(_delta: float) -> void:
	curPos = get_global_mouse_position();
	$CursorPos.text = "(" + str(curPos.x) + ", " + str(curPos.y) + ")"
	$CursorPos.position = get_local_mouse_position();

func _input(event) -> void:
	if !(event is InputEventMouseButton and event.pressed): return;
	if event.button_index != MOUSE_BUTTON_LEFT: return;
	
	print("spawning box at ", get_viewport().get_mouse_position())
	var scene: PackedScene   = load("res://Objects/Box.tscn")
	var scene_instance: Node = scene.instantiate()
	scene_instance.set_name("Box")
	scene_instance.position = get_global_mouse_position() 
	get_tree().get_current_scene().add_child(scene_instance);

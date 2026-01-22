extends Node2D

var boxArray: Array[Node];
@export var timeBetweenSpawns = 20;
@export var boxLimit = 1;
@export var button: Node;
var timer = timeBetweenSpawns;
var useButton;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	useButton = button != null;
	if(useButton):
		button.connect("buttonChanged", buttonChange)
	
func buttonChange(isDown):
	if(isDown):
		if(boxArray.size() < boxLimit && timer > timeBetweenSpawns):
			spawnBox()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += 1;
	if(boxArray.size() < boxLimit && timer > timeBetweenSpawns && !useButton):
		spawnBox()
		timer = 0;

func processKilledCube(box: Node):
	boxArray.remove_at(boxArray.find(box))
	print(boxArray)
	print( "died killed vox ! ")

func spawnBox():
	print("spawning box at ", get_viewport().get_mouse_position())
	var scene: PackedScene   = load("res://Objects/Box.tscn")
	var scene_instance: Node = scene.instantiate()
	scene_instance.connect("exploded", processKilledCube)
	scene_instance.set_name("Box")
	scene_instance.position = position;
	get_tree().get_current_scene().add_child(scene_instance);
	boxArray.append(scene_instance)

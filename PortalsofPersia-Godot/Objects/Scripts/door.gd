extends Node2D

@export var button: Node2D
@export var heightUp = 256
var downState = true;
var downPos;
var upPos = position;

func _ready() -> void:
	button.connect("buttonChanged", buttonChange)
	downPos = position;
	upPos = position;
	upPos.y -= heightUp;
	
func buttonChange(isDown):
	downState = !isDown;
	if(isDown):
		print("button is down! opening door ,..,")
	#	$AnimationPlayer.play("door_up")
	else:
		print("buttons up! closing ,.,.")
	#	$AnimationPlayer.play("door_down")*/

func _physics_process(delta: float) -> void:
	if(downState):
		position = lerp(position, downPos, 0.03)
	else:
		position = lerp(position, upPos, 0.03)
		

extends Node2D

@export var button: Node2D

func _ready() -> void:
	button.connect("buttonChanged", buttonChange)
	
func buttonChange(isDown):
	if(isDown):
		print("button is down! opening door ,..,")
		$AnimationPlayer.play("door_up")
	else:
		print("buttons up! closing ,.,.")
		$AnimationPlayer.play("door_down")

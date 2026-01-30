extends Node2D
class_name AbstractPickup

signal buttonChanged;
var isDown: bool = false;

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("down") && isDown):
		doThings()
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(isDown == true): return;
	if(body.is_in_group("world") || body.name != "Player"): return;
	
	print(body.name + " entered !")
	isDown = true;
	emit_signal("buttonChanged", isDown)
	$downArrow.show()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if($Area2D.has_overlapping_bodies()): return;
	print(body.name + " left !")
	isDown = false;
	emit_signal("buttonChanged", isDown)
	$downArrow.hide()

func doThings() -> void:
	print("woaw !!")

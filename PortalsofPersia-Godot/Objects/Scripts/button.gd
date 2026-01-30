extends Node2D

signal buttonChanged;
var isDown: bool = false;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(isDown == true): return;
	if(body.is_in_group("world")): return;
	
	print(body.name + " entered !")
	isDown = true;
	emit_signal("buttonChanged", isDown)
	$AnimatedSprite2D.play("Pressed")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if($Area2D.has_overlapping_bodies()): return;
	print(body.name + " left !")
	isDown = false;
	emit_signal("buttonChanged", isDown)
	$AnimatedSprite2D.play("Unpressed")

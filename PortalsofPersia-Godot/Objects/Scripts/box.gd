extends RigidBody2D

signal exploded;

func explode(node: Node):
	print(node.name + " explode")
	var scene: PackedScene   = load("res://Objects/Explosion.tscn")
	var scene_instance: Node = scene.instantiate()
	scene_instance.set_name("Explosion")
	scene_instance.position = node.position;
	get_tree().get_current_scene().add_child(scene_instance);
	node.queue_free()


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if(area.name == "Door" && area.get_parent().get_parent().get_parent().downState):
		print("killing")
		emit_signal("exploded", self)
		explode(self)

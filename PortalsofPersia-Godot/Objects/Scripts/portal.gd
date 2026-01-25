extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match get_tree().get_node_count_in_group("Portal"):
		3:
			get_tree().get_first_node_in_group("Portal").queue_free();
		2:
			if get_tree().get_first_node_in_group("Portal").get_child(2).animation == "Purple":
				$AnimatedSprite2D.play("Green")
			else:
				$AnimatedSprite2D.play("Purple")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

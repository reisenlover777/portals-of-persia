extends Node2D
var pairedPortal: Node2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match get_tree().get_node_count_in_group("Portal"):
		3:
			get_tree().get_first_node_in_group("Portal").queue_free();
			get_tree().get_first_node_in_group("Portal").pairPortal = self;
			pairedPortal = get_tree().get_first_node_in_group("Portal");
		2:
			pairedPortal = get_tree().get_first_node_in_group("Portal");
			if get_tree().get_first_node_in_group("Portal").get_child(2).animation == "Purple":
				$AnimatedSprite2D.play("Green")
			else:
				$AnimatedSprite2D.play("Purple")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.position = pairedPortal.position
	
	pass # Replace with function body.

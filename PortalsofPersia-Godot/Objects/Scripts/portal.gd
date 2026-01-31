extends Node2D
@export var pairedPortal: Node2D;
@export var out: Vector2 = Vector2(70,0);
@export var displacement = 2;
var animationNode: AnimatedSprite2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationNode = $AnimatedSprite2D
	match get_tree().get_node_count_in_group("Portal"):
		3:
			get_tree().get_first_node_in_group("Portal").queue_free();
			get_tree().get_nodes_in_group("Portal").get(1).pairedPortal = self;
			pairedPortal = get_tree().get_nodes_in_group("Portal").get(1);
		2:
			pairedPortal = get_tree().get_first_node_in_group("Portal");
			if pairedPortal==self:
				pairedPortal = get_tree().get_nodes_in_group("Portal").get(1);
			pairedPortal.pairedPortal = self
	if pairedPortal == null:
		$AnimatedSprite2D.play("Green")
	elif pairedPortal.animationNode == null:
		$AnimatedSprite2D.play("Green")
	elif pairedPortal.animationNode.animation == "Purple":
		$AnimatedSprite2D.play("Green")
	else:
		$AnimatedSprite2D.play("Purple")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if pairedPortal == null:
		return
	if body is TileMapLayer or body in get_tree().get_nodes_in_group("Portal"):
		return
	if body is StaticBody2D:
		return
	print(body.global_position)
	body.global_position = pairedPortal.global_position+out.rotated(pairedPortal.global_rotation)
	print(body.global_position)
	if(body is RigidBody2D):
		body.apply_central_impulse(displacement*out.rotated(pairedPortal.global_rotation))
	if(body is CharacterBody2D):
		body.velocity+= out.rotated(pairedPortal.global_rotation)
		pass
	pass # Replace with function body.

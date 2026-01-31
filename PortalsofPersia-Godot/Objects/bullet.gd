extends Node2D
@export var trailsize = 10
const packPortal = preload("res://Objects/portal.tscn")
var spd = 400;
var out:Vector2;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	out = Vector2(cos(self.rotation),sin(self.rotation))
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position+=delta*spd*out
	$Line2D.add_point(global_position)
	if $Line2D.points.size() > trailsize:
		$Line2D.remove_point(0)
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var portalInst = packPortal.instantiate()
	portalInst.global_position = self.global_position
	portalInst.global_rotation = self.global_rotation+PI
	if body is TileMapLayer:
		get_tree().root.add_child(portalInst)
		self.queue_free()
	if body is RigidBody2D:
		body.apply_central_impulse(out*200)
		self.queue_free()
	pass # Replace with function body.

extends Node2D
@export var nextLevelFileName:String;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("default")
	get_tree().change_scene_to_file(nextLevelFileName)
	pass # Replace with function body.

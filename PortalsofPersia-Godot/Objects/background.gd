extends Node2D
@export var spd = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(spd>0):
		for i in self.get_children():
			i.autoscroll = Vector2(spd*4*i.scroll_scale.x,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node2D
@export var spd = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(spd>0):
		$Parallax2D.autoscroll = Vector2(spd*$Parallax2D.scroll_scale.x,0)
		$Parallax2D2.autoscroll = Vector2(spd*$Parallax2D2.scroll_scale.x,0)
		$Parallax2D3.autoscroll = Vector2(spd*$Parallax2D3.scroll_scale.x,0)
		$Parallax2D4.autoscroll = Vector2(spd*$Parallax2D4.scroll_scale.x,0)
		$Parallax2D5.autoscroll = Vector2(spd*$Parallax2D5.scroll_scale.x,0)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var upCounter = 0;
var cameraMoveY = 0;
var camOffsetY = 0.0;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_pressed("up")):
		upCounter += delta;
	else:
		upCounter = 0;
	
	if(upCounter > 0.5):
		camOffsetY = lerp(camOffsetY, -100.0, 0.6)
	elif(camOffsetY != 0):
		camOffsetY = lerp(camOffsetY, 0.0, 0.09);
		
		if(camOffsetY < 0.5 && camOffsetY > -0.5):
			camOffsetY = 0.0;
	
	position.y = lerp(position.y, camOffsetY, 0.03)

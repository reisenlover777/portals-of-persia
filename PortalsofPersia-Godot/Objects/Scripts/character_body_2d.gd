extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const PUSHFORCE = 50.0;

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and !Input.is_action_pressed("sprint"):
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and is_on_floor() and Input.is_action_pressed("sprint"):
		velocity.y = JUMP_VELOCITY * 2 # jump for y limit camera testing

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# code for rigid bodies; https://www.youtube.com/watch?v=SJuScDavstM
	# rigid bodies ontop the player will cause them to be pushed into the floor however
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * PUSHFORCE)

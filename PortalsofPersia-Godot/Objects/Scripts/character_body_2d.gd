extends CharacterBody2D


const SPEED = 375.0
const JUMP_VELOCITY = -400.0
const PUSHFORCE = 50.0;
const SPRINT_MULT = 1.5
const bulletNode = preload("res://Objects/bullet.tscn")
var JUMP = false
@export var lamp = true
var shoot_cooldown := 0.0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if shoot_cooldown > 0.0:
		shoot_cooldown -= delta
	if Input.is_action_just_pressed("shoot") and lamp and shoot_cooldown <= 0.0:
		shoot_cooldown=2
		var bulletInst = bulletNode.instantiate()
		bulletInst.global_position = self.global_position
		if $AnimatedSprite2D.flip_h:
			bulletInst.rotation = PI
		get_tree().root.add_child(bulletInst)
	
	if Input.is_action_just_pressed("reset"):
		for i in get_tree().get_nodes_in_group("Portal") :
			i.queue_free()
		get_tree().reload_current_scene()


		
	# Handle jump.
	if Input.is_action_just_pressed("down"):
		self.position.y+= 1;
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if Input.is_action_pressed("sprint"):
			velocity.y = JUMP_VELOCITY * SPRINT_MULT
		else:
			velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("Jump")
		JUMP = true
		#print("jump")
		move_and_slide()
	if is_on_floor():
		JUMP = false
	var direction := Input.get_axis("left","right")
	if direction!=0:
		if !JUMP:
			$AnimatedSprite2D.play("Run")
		if(direction<0):
			$AnimatedSprite2D.flip_h=true
		else:
			$AnimatedSprite2D.flip_h=false
		velocity.x = direction * SPEED + direction*SPEED*(SPRINT_MULT-1)*int(Input.is_action_pressed("sprint"))
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if !JUMP:
			$AnimatedSprite2D.play("Stand")
		

	move_and_slide()
	
	# code for rigid bodies; https://www.youtube.com/watch?v=SJuScDavstM
	# rigid bodies ontop the player will cause them to be pushed into the floor however
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * PUSHFORCE)

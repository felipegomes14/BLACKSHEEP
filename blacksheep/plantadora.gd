extends CharacterBody2D


const SPEED = 100.0
#const JUMP_VELOCITY = -100.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		pass
		#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		pass
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("PARADO")
		
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("andando-tras")
		
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("andado-frente")
		
		
	

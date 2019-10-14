extends Area2D
signal eat

export var speed = 100

func _ready():
	pass

func _process(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized()*speed
		
		$AnimatedSprite.rotation = velocity.angle()
		
		if abs(velocity.angle())>PI/2:
			$AnimatedSprite.flip_v = true
		else:
			$AnimatedSprite.flip_v = false
#		$AnimatedSprite.play()
#	else:
#		$AnimatedSprite.stop()
#
	position += velocity*delta
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)


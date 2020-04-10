extends PathFollow2D

var speed = 0.05
var dir = 1

func _ready():

	$SharkArea/AnimatedSprite.play("swim")
	if randf()<0.5:
		dir = -1
		set_unit_offset(1.0)
		$SharkArea/AnimatedSprite.flip_v = true
		

func _process(delta):
	var new_offset = get_unit_offset() + speed*dir*delta
	if new_offset > 1.0 or new_offset < 0.0:
		queue_free()
	else:
		set_unit_offset(new_offset)
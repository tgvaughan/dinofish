extends PathFollow2D

var speed = 0.05
var dir = 1

func _ready():
	var u = randf()
	
	if u<0.25:
		$FishArea/AnimatedSprite.play("swim_orange")
	elif u<0.5:
		$FishArea/AnimatedSprite.play("swim_green")
	elif u<0.75:
		$FishArea/AnimatedSprite.play("swim_purple")
	else:
		$FishArea/AnimatedSprite.play("swim_cyan")
		
	if randf()<0.5:
		dir = -1
		set_unit_offset(1.0)
		$FishArea/AnimatedSprite.flip_v = true
		

func _process(delta):
	var new_offset = get_unit_offset() + speed*dir*delta
	if new_offset > 1.0 or new_offset < 0.0:
		queue_free()
	else:
		set_unit_offset(new_offset)
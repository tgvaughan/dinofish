extends Area2D

var speed = 0.1
var dir = 1
var eaten = false
var points = 1

onready var parent = get_parent()

func _ready():
	var u = randf()
	
	if u<0.25:
		$AnimatedSprite.play("swim_orange")
	elif u<0.5:
		$AnimatedSprite.play("swim_green")
	elif u<0.75:
		$AnimatedSprite.play("swim_purple")
	else:
		$AnimatedSprite.play("swim_cyan")
		
	if randf()<0.5:
		dir = -1
		parent.set_unit_offset(1.0)
		$AnimatedSprite.flip_v = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent is PathFollow2D:
		var new_offset = parent.get_unit_offset() + speed*dir*delta
		if new_offset > 1.0 or new_offset < 0.0:
			parent.queue_free()
		else:
			parent.set_unit_offset(new_offset)

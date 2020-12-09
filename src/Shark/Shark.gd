extends Area2D

var speed = 0.05
var dir = 1
var eaten = false

onready var parent = get_parent()

func _ready():

	$AnimatedSprite.play("swim")
	if randf()<0.5:
		dir = -1
		parent.set_unit_offset(1.0)
		$AnimatedSprite.flip_v = true
		

func _process(delta):
	var new_offset = parent.get_unit_offset() + speed*dir*delta
	if new_offset > 1.0 or new_offset < 0.0:
		parent.queue_free()
	else:
		parent.set_unit_offset(new_offset)

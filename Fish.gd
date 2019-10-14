extends Area2D

var speed = 50

func _ready():
	pass

func _process(delta):
	var parent = get_parent()
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed*delta)
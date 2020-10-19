extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	var nframes = $AnimatedSprite.frames.get_frame_count("default")
	$AnimatedSprite.frame = randi() % nframes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Player1_Eat"):
		eat_fish()
	pass

func eat_fish():
	$AnimatedSprite.play("eat")
	#var fish = $EatArea.get_overlapping_areas()
	#if !fish.empty():
	#	$EatPath.add_child(fish)
	

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("default")

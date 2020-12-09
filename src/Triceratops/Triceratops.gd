extends Node2D

var score = 0

signal update_player2_score

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	var nframes = $AnimatedSprite.frames.get_frame_count("default");
	$AnimatedSprite.frame = randi() % nframes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Player2_Eat"):
		eat_fish()
	pass

func eat_fish():
	$AnimatedSprite.play("eat")
	var fish_in_range = $EatArea.get_overlapping_areas()
	if !fish_in_range.empty():
		var fish = fish_in_range[0];
				
		if fish.eaten:
			return
		else:
			fish.eaten = true
			
		var pathFollower = fish.get_parent()
		pathFollower.get_parent().remove_child(pathFollower)
		pathFollower.v_offset = 0
		if fish.dir == -1:
			fish.dir = 1
			fish.get_node("AnimatedSprite").flip_v = false
		fish.speed = 1
		$EatPath.add_child(pathFollower)
		pathFollower.set_unit_offset(0.0)
		
		score += 1
		emit_signal("update_player2_score", score)
	

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("default")

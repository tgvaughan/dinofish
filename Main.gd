extends Node2D
const Fish = preload("res://Fish.tscn")

var maxFishSpawnDelay = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$FishTimer.start(1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_FishTimer_timeout():
	var fish = Fish.instance()
	fish.v_offset = 100*randf() - 50
	$SwimPath.add_child(fish)
	
	$FishTimer.start(randf() * maxFishSpawnDelay);
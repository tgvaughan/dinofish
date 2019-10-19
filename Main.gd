extends Node2D
const Fish = preload("res://Fish.tscn")

var maxFishSpawnDelay = 2
var minFishSpawnDelay = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$FishSpawnTimer.start(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_FishSpawnTimer_timeout():
	var fish = Fish.instance()
	fish.v_offset = 100*randf() - 50
	$SwimPath.add_child(fish)
	
	$FishSpawnTimer.start(
			randf() * (maxFishSpawnDelay-minFishSpawnDelay)
			+ minFishSpawnDelay)
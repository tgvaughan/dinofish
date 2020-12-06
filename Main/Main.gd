extends Node2D
const Fish = preload("res://Fish/Fish.tscn")
const Shark = preload("res://Shark/Shark.tscn")

var maxFishSpawnDelay = 2
var minFishSpawnDelay = 1

var maxSharkSpawnDelay = 15
var minSharkSpawnDelay = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$FishSpawnTimer.start(1)
	$SharkSpawnTimer.start(10)

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

func _on_SharkSpawnTimer_timeout():
	var shark = Shark.instance()
	shark.v_offset = 100*randf() - 50
	$SwimPath.add_child(shark)
	
	$SharkSpawnTimer.start(
			randf() * (maxSharkSpawnDelay-minSharkSpawnDelay)
			+ minSharkSpawnDelay)

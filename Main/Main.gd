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
	var fishPath = PathFollow2D.new()
	fishPath.add_child(fish)
	fishPath.v_offset = 100*randf() - 50
	$SwimPath.add_child(fishPath)
	
	$FishSpawnTimer.start(
			randf() * (maxFishSpawnDelay-minFishSpawnDelay)
			+ minFishSpawnDelay)

func _on_SharkSpawnTimer_timeout():
	var shark = Shark.instance()
	var sharkPath = PathFollow2D.new()
	sharkPath.add_child(shark)
	sharkPath.v_offset = 100*randf() - 50
	$SwimPath.add_child(sharkPath)
	
	$SharkSpawnTimer.start(
			randf() * (maxSharkSpawnDelay-minSharkSpawnDelay)
			+ minSharkSpawnDelay)

extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Steggy_update_player1_score(new_score):
	$Player1Score.text = str(new_score)

func _on_Triceratops_update_player2_score(new_score):
	$Player2Score.text = str(new_score)

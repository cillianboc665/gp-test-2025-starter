extends CanvasLayer

var hearts = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$lives.text = "Lives: " + str(hearts)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	damage.connect()
	pass

func _livesText():
	hearts -= 1
	$lives.text = "Lives: " + str(hearts)

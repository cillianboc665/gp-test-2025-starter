extends Node2D

@onready var mainScene = get_node("/root/Main")
var enemyScene := preload("res://enemy.tscn")
var spawns := []
var numFoes = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "Enemies: " + str(numFoes)
	for child in get_children():
		if child is Marker2D:
			spawns.append(child)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var spawnPoint = spawns[randi() % spawns.size()]
	var enemies = enemyScene.instantiate()
	enemies.position = spawnPoint.position
	mainScene.add_child(enemies)
	numFoes += 1
	$Label.text = "Enemies: " + str(numFoes)
	pass # Replace with function body.

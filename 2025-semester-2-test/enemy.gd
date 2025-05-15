extends CharacterBody2D

class_name foe

var wall: Wall = null
var fella: guy = null

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var dir := Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity = -transform.x * SPEED
	
	move_and_slide()


func _on_sight_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Wall:
		wall = body
	pass # Replace with function body.

func _die():
	queue_free()

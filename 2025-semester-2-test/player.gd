extends CharacterBody2D

class_name guy

signal damage

var enemy: foe = null

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var lives = 5


func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_hitbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is foe:
		body._die()
		if (lives > 0):
			lives -= 1
			damage.emit()
			print("Life lost.")
		else: if (lives == 0):
			print("Death")
			queue_free()
	pass # Replace with function body.

extends CharacterBody2D

var speed = 600.0


func _physics_process(delta):
	# Add the gravity.
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	velocity.y = (velocity.y) / 2
	move_and_slide()

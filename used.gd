extends CharacterBody2D

var current_animation = "idle"
var speed = 200
var angle = 0
var player = null
var player_chase = false
var mouse = player.position - position #

func _physics_process(delta):
	current_animation = "idle"
	if player_chase:
		position += (player.position - position).normalized() * speed * delta
	
	
	angle = snappedf(mouse.angle(), PI / 4) / (PI / 4)
	angle = wrapi(int(angle), 0, 8)
	if (player.position - position)  != 0:
		current_animation = "walk"
		velocity = mouse.normalized() * speed
		move_and_collide(Vector2(0,0))
	$AnimatedSprite2D.play(current_animation + str(angle))
	
# Visualize directional calculations
# Press "Tab" to turn on/off debug drawing
var show_debug = false
var font = preload("res://debug/Roboto-Medium.ttf")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	
	
	
func _on_detection_area_body_exited():
	player = null
	player_chase = false



		

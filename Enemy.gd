extends CharacterBody2D

var speed = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	# add gravity to the enemy
	# add chase functionality
	velocity.y += gravity + delta
	if chase == true:
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * speed
	else:
		velocity.x = 0
	move_and_slide()

func _on_player_detection_body_entered(body):
	# chase when player is within a certain area
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	# stop chasing if player leaves the area
	if body.name == "Player":
		chase = false

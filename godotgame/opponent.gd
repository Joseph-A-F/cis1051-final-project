extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var damage = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	#$Sprite2D/Polygon2D.color = "white"
	
	if damage >= 4:
		queue_free()
	pass

func hurt(directionhit,speedy):
	#print("jndfsnjfsd")
	#$Sprite2D/Polygon2D.color = "blue"
	velocity.y -= 1000 
	position.y -= 20
	damage += 1
	
	if directionhit:
		position.x += 50*damage
		velocity.x += 400/2*damage
	else:
		
		position.x -= 50*damage
		velocity.x -= 400/2*damage
			
	##if !is_on_floor():
	##	rotation += 1
	
	#camera
	$"../Camera2D/AnimationPlayer".play("hit")
	


func _physics_process(delta):
	# Add the gravity.
	$AnimatedSprite2D.play("default")
	if not is_on_floor():
		velocity.y += gravity * delta
		
	else:
		$AnimatedSprite2D.play("default")
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("new_animation")
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("new_animation")
		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity.x /= SPEED
	

	
	move_and_slide()

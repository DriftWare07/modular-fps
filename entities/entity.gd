extends CharacterBody3D

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@export var speed = 3.0
@export var target: Node3D

@export var max_follow_distance = 10.0

var done_navigating = true

func _ready():
	nav_agent.target_reached.connect(_nav_finished)
	

func _process(delta):
	look_at(Vector3(target.position.x, position.y, target.position.z))

func _physics_process(delta):
	
	
	
	update_target(target.global_position)
	var current_location = global_position
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location-current_location).normalized()*speed
	
	
	if not done_navigating: 
		velocity = velocity.move_toward(new_velocity,0.25)
	else:
		velocity = velocity.move_toward(Vector3.ZERO, 0.25)
	velocity.y -= 9.8*delta
	move_and_slide()


func update_target(location):
	await get_tree().physics_frame
	var dist = global_position.distance_to(target.global_position)
	if done_navigating:
		if dist > max_follow_distance:
			done_navigating = false
	nav_agent.target_position = location

func _nav_finished():
	done_navigating = true
	#print("done!")

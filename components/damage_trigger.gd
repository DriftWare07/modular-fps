extends Area3D
class_name Damage_Trigger

# Called when the node enters the scene tree for the first time.
@export var damage = 10.0
@export var tick = 1

var tick_timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collisions = get_overlapping_areas()
	var valid = []
	for i in collisions:
		if i is Damage_Component:
			valid.append(i)
	
	tick_timer+=delta
	print(tick_timer)
	
	if tick_timer > tick:
		tick_timer = 0
		for c in valid:
			c.damage(damage)
	

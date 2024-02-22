extends Node3D


@export var current_weapon = 0 
@export var weaponlist : Array[weapon] = []

@export var target_object : Node3D

@export var gunmesh : MeshInstance3D

@export var raycast : RayCast3D

var weapon_data : weapon

var can_fire = true



func _ready():
	weapon_data = weaponlist[current_weapon]
	load_weapon(current_weapon)
	randomize()
	




func primary_fire():
	if can_fire:
		target_object.apply_recoil()
		if weapon_data.sound: fx.play_sound(weapon_data.sound, target_object.global_position)
		
		flash()
		for p in range(0,weapon_data.projectile_count):
			var spread = weapon_data.spread
			
			raycast.target_position = Vector3(randf_range(-spread,spread),randf_range(-spread,spread), -weapon_data.range)
			#print(raycast.target_position)
			raycast.force_raycast_update()
			if raycast.is_colliding(): 
				if weapon_data.impact_fx: fx.spawn(weapon_data.impact_fx, raycast.get_collision_point())
				if weapon_data.impact_texture: fx.spawn_bullet_decal(raycast.get_collision_point(), raycast.get_collision_normal(), weapon_data.impact_texture)
			#await get_tree().create_timer(0.5).timeout
		
		
		
		can_fire = false
		$"../weapontimer".start()

func toggle(value=1):
	current_weapon += value
	if current_weapon > len(weaponlist)-1: current_weapon = 0
	if current_weapon < 0: current_weapon = len(weaponlist)-1
	#print("toggled")
	load_weapon(current_weapon)

func load_weapon(data=0):
	
	target_object.position = Vector3(0.5,-0.3,-0.5)
	gunmesh.rotation_degrees = Vector3(0,-180,0)
	
	weapon_data = weaponlist[data]
	
	gunmesh.mesh = weapon_data.model
	gunmesh.position = Vector3.ZERO
	
	target_object.recoil_rotation_x = weapon_data.recoil_rotation_x
	target_object.recoil_rotation_z = weapon_data.recoil_rotation_z
	target_object.recoil_position_z = weapon_data.recoil_position_z
	target_object.recoil_amplitude = weapon_data.recoil_amplitude
	target_object.lerp_speed = weapon_data.lerp_speed
	target_object.recoil_speed = weapon_data.recoil_speed
	
	
	
	
	raycast.target_position.z = -weapon_data.range
	
	$"../weapontimer".wait_time = weapon_data.fire_delay
	


func _on_weapontimer_timeout():
	can_fire = true

func flash():
	if weapon_data.muzzle_flash_instance == null: return
	var f = weapon_data.muzzle_flash_instance.instantiate()
	gunmesh.add_child(f)
	f.position += weapon_data.muzzle_flash_position
	f.rotation_degrees.y += 180

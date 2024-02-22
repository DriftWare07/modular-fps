extends Node

var audio = preload("res://scenes/soundinstance.tscn")
var explosion = preload("res://scenes/vfx/explosion_vfx.tscn")

func play_sound(sound, position):
	var a = audio.instantiate()
	a.stream = sound
	get_tree().root.add_child(a)
	a.global_position = position
	

func spawn_explosion(position, scale = Vector3.ONE):
	var e = explosion.instantiate()
	
	get_tree().root.add_child(e)
	e.global_position = position
	e.scale = scale


func spawn(scene:PackedScene, position, rotation_degrees = Vector3.ZERO):
	#var spawn = load(scene)
	var e = scene.instantiate()
	
	get_tree().root.add_child(e)
	e.global_position = position
	e.rotation_degrees = rotation_degrees
	return e
	

func spawn_bullet_decal(position,normal,texture):
	var d = preload("res://scenes/vfx/bullet_decal.tscn")
	#print("decal")
	var e = d.instantiate()
	
	get_tree().root.add_child(e)
	e.global_position = position
	e.transform = align_with_y(e.global_transform,normal)
	e.texture_albedo = texture


func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	xform.basis = xform.basis.orthonormalized()
	return xform

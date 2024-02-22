extends Resource
class_name weapon

@export_group("Model")
@export var model : Mesh


@export_group("Recoil")
@export var recoil_rotation_x : Curve
@export var recoil_rotation_z : Curve
@export var recoil_position_z : Curve
@export var recoil_amplitude := Vector3(1,1,1)
@export var lerp_speed : float = 1
@export var recoil_speed : float = 1


#@export var camera_shake : CameraShake

@export_group("Effects")
@export var camera_shake_amount : float = 0.3


@export var sound : AudioStreamMP3
@export var impact_fx : PackedScene
@export var impact_texture : Texture2D
@export var muzzle_flash_position = Vector3.ZERO
@export var muzzle_flash_instance : PackedScene

@export_group("Stats")
@export var fire_delay = 1.0
@export var range = 100.0
@export var spread = 0.0
@export var projectile_count = 1
@export var damage = 10.0

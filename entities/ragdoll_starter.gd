extends Node
class_name Ragdoll_Init

@export var skelly : Skeleton3D
# Called when the node enters the scene tree for the first time.
func _ready():
	skelly.physical_bones_start_simulation()



extends Area3D
class_name Damage_Component

@export var health_node : Health_Component
@export var damage_multiplier = 1

func damage(damage):
	print("damage")
	if health_node == null: return
	health_node.damage(damage*damage_multiplier)
	

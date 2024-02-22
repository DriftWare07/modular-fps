extends Node
class_name Health_Component

@export var max_health = 100
var health

@export var free_on_death = true

func _ready():
	health = max_health

func damage(dmg):
	
	health -= abs(dmg)
	if health < 0 and free_on_death: get_parent().queue_free()

func heal(healing):
	if health + abs(healing) >= max_health:
		health = max_health
	else:
		health += abs(healing)

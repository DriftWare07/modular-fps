extends Node
class_name Health_Component

signal death
signal damaged
signal healed

@export var max_health = 100.0
var health = 100.0

@export var free_on_death = true

var dead = false

func _ready():
	health = max_health

func damage(dmg):
	
	
	if health < 0 and not dead:
		if free_on_death: get_parent().queue_free()
		death.emit()
		dead = true
	health -= abs(dmg)
	damaged.emit()

func heal(healing):
	if health + abs(healing) >= max_health:
		health = max_health
	else:
		health += abs(healing)
	healed.emit()

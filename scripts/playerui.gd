extends CanvasLayer



@export var health : Health_Component
@export var health_bar : ProgressBar

func _ready():
	if health and health_bar:
		health.damaged.connect(update_healthbar)
		health.healed.connect(update_healthbar)
		health_bar.max_value = health.max_health
		update_healthbar()

func update_healthbar():
	if not health_bar: return
	var hp_tween = create_tween()
	hp_tween.stop()
	hp_tween.tween_property(health_bar,"value", health.health, 1.0)
	hp_tween.play()
	print("tweening")

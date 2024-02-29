extends CanvasLayer



@export var health : Health_Component
@export var health_bar : ProgressBar
@export var tweened_hp_bar : ProgressBar
@export var hp_text : Label

func _ready():
	if health and health_bar and tweened_hp_bar:
		health.damaged.connect(update_healthbar)
		health.healed.connect(update_healthbar)
		health_bar.max_value = health.max_health
		tweened_hp_bar.max_value = health.max_health
		update_healthbar()

func update_healthbar():
	
	if hp_text: hp_text.text = str(health.health)+"/"+str(health.max_health)
	
	if not health_bar and tweened_hp_bar: return
	health_bar.value = health.health
	var hp_tween = create_tween()
	
	hp_tween.tween_property(tweened_hp_bar,"value", health.health, 1.0).set_trans(Tween.TRANS_QUART)
	
	print("tweening")

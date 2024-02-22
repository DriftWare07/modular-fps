extends Node



@export var emitters : Array[GPUParticles3D]
var done = 0

func _ready():
	for i in emitters:
		i.restart()
		i.finished.connect(tally)

func _process(delta):
	
	if done > len(emitters)-1:
		
		queue_free()

func tally():
	done += 1

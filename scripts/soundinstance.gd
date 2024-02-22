extends Node3D

@export var stream : AudioStream
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer3D.stream = stream
	$AudioStreamPlayer3D.play()




func _on_audio_stream_player_3d_finished():
	queue_free()

extends Spatial

var sound_player: AudioStreamPlayer

func _ready():
	sound_player = find_node("ClickSoundPlayer")

func _input(event):
	if (event.is_action_pressed("select")):
		play_click_sound()
		var space = get_world().direct_space_state
		var camera = get_viewport().get_camera()
		var from = camera.project_ray_origin(event.position)
		var to = camera.project_ray_normal(event.position) * 1000
		var result = space.intersect_ray(from, to, [], 0x7FFFFFFF, true, true)
		if result:
			#print("Hit at point: ", result.collider.name)
			if (result.collider.name.find("KeyArea") == -1):
				result.collider.free()
			

func play_click_sound():
	sound_player.play()
	pass

extends Spatial

var rotate_target = 0
var rotate_speed = 1.25
var snap_to_distance = 0.35

func _process(delta):
	if (rotate_target != 0):
		var increment = (rotate_target * delta * rotate_speed)
		if (abs(rotate_target - increment) < snap_to_distance):
			rotate_y(rotate_target)
			rotate_target = 0
			pass

		rotate_y(increment)
		rotate_target -= increment
	else:
		pass

func _input(event):
	if (event.is_action_pressed("rotate_left")):
		rotate_target += deg2rad(-60)
	elif (event.is_action_pressed("rotate_right")):
		rotate_target = rotate_target + deg2rad(60)

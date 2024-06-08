extends State
class_name Ground_State

@export var landingjump: Timer

func enter():
	if not landingjump.is_stopped():
		transitioned.emit(self, 'jumping')
		
func exit():
	pass

func update(_delta: float):
	if Input.is_action_just_pressed('up'):
		transitioned.emit(self, 'jumping')
		

func physics_update(_delta: float):
	pass

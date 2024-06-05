extends State
class_name Jumping
@export var landingjump: Timer

func enter():
	subject.velocity.y = subject.jump_veloctiy
	
func exit():
	pass

func update(_delta: float):
	if Input.is_action_just_pressed('up'):
		landingjump.start()
	if subject.is_on_floor(): 
		transitioned.emit(self, 'idle')
	pass

func physics_update(_delta: float):
	pass

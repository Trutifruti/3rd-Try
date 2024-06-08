extends Air_State
class_name Jumping

func enter():
	super.enter()
	subject.velocity.y = subject.jump_veloctiy
	
func exit():
	pass

func update(_delta: float):
	if subject.is_on_floor(): 
		transitioned.emit(self, 'idle')

func physics_update(_delta: float):
	super.air_straif()

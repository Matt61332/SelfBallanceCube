extends RigidBody

var desiredAngle = PI/4;
var offset = PI * 10/180;
var torque = Vector3(0,0,.01)

var p = 0
var i = 0
var d = 0

var kp = 1
var ki = 5
var kd = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#var torque = Vector3(0,0,.5)
	#apply_torque_impulse(torque)
	pass


func _physics_process(delta):
	#if(rotation.z >= desiredAngle-offset and rotation.z <= desiredAngle+offset):
	var err = desiredAngle - rotation.z
	
	i = i+(ki*p*delta)
	d = (err - p)/(delta)
	p = err
	
	var impulse = torque*(p*kp + i+ d*kd)
	if(impulse >= Vector3(0,0,.05)):
		impulse = Vector3(0,0,.05)
		get_imp
	apply_torque_impulse(impulse)
	
	print(impulse)
	print("  ")
	print(rotation.z)

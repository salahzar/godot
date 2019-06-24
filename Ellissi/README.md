Crea un sistema solare molto semplice.

Usa texture equirettangolari come questa che rappresenta giove:
![Image](20180511_jupiter_map_css_plus_juno_bj_f840.jpg?raw=true)

Il progetto utilizza un gdscript che appare come segue export indica le opzioni che possono essere configurate direttamente dall'editor,
in particolare 
* speed per controllare la rotazione
* node per indicare attorno a quale altro nodo ruotare
* radiusOrbit il raggio dell'orbita
* speedOrbit la velocita' di rotazione nell'orbita

```
export var speed: float = 0.1

export(NodePath) var node = null

export var radiusOrbit: float = 500
export var speedOrbit: float = 0.1

```
Nel physics process abbiamo la parte che fa ruotare il pianeta

```
func _physics_process(delta):
	
	# rotate the planet around itself
	fi+=speed
	rotation_degrees = Vector3(0, fi, 0)
	
```

e se per caso e' presente un nodo anche la parte che posiziona questo oggetto in orbita

```
	if node:
		fiOrbit += speedOrbit
		var n = get_node(node)
		var transform: Transform = n.get_global_transform()
		var origin = transform.origin
		var myTransform: Transform = get_global_transform()
		
		global_transform.origin = origin + Vector3(radiusOrbit*cos(fiOrbit),0,radiusOrbit*sin(fiOrbit))
		#print(global_transform.origin)
	pass
```

tool
extends EditorScript

func _run():
	var scene = get_scene()
	var children = scene.get_children()
	
	for node in children:
		if node is MeshInstance:
			print("Node name: ", node.name)
			var area_node = Area.new()
			area_node.name = node.name + "_area"
			scene.add_child(area_node)
			area_node.set_owner(scene)
			
			var node_shape = node.mesh.create_trimesh_shape()
			var coll_shape = CollisionShape.new()
			coll_shape.name = node.name + "_col"
			coll_shape.shape = node_shape
			area_node.add_child(coll_shape)
			coll_shape.add_owner(area_node)
		else:
			pass
	
#	for node in selected_nodes:
#		print("Node name: ", node.name)
#		# Create new area node w/ node name concat w/ _area
#		var area_node = Area.new()
#		area_node.name = node.name + "_area"
#
#		# set node parent to the area node
#		#if node.get_parent():
#		#	node.get_parent().remove_child(node)
#
#		#area_node.add_child(node)
#		#node.owner = area_node
#
#		# create a trimesh sibling for the node and set it's parent to the area node
#		#var node_shape = node.mesh.create_trimesh_shape()
#		var coll_shape = CollisionShape.new()
#		coll_shape.name = node.name + "_col"
#		#coll_shape.shape = node_shape
#		area_node.add_child(coll_shape)
#		coll_shape.owner = area_node
#
#		parent_node.add_child(area_node)
#		area_node.owner = parent_node
#		pass
	
#	print(parent_node.name)

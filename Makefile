build-manager:
	docker build --rm=true -t "plumage_manager" manager_image

build-node: 
	docker build --rm=true -t "plumage_node" node_image

build-base-blender:
	docker build --rm=true -t "render_base:blender" base_images/blender

run-manager:
	docker run -v /store1/Plumage/scenes/:/var/plumage/scenes:ro -v /scratch.1/Plumage/data/:/var/plumage/data:rw --name plumage_manager -d -p 0.0.0.0:8888:8888 plumage_manager -p 8888 -d /var/plumage/data/ -s /var/plumage/scenes/ -a hamilton.cs.wisc.edu:5672/BlenderRenderCC -U PlumageManager -P manager

run-node:
	docker run -v /store1/Plumage/scenes/:/data/scenes:ro --name plumage_node -d plumage_node -s /data/scenes -U BlenderClient -P client -a hamilton.cs.wisc.edu:5672/BlenderRenderCC -m http://cantor:8888 -t 10800 --attempts 3

dump-node:
	docker save -o ./plumage_node.tar.gz  plumage_node 


up:
	cd forward-proxy; make up
	cd keycloak-new; make up
	cd minio; make up 
	cd vault; make up


down:
	cd forward-proxy; make down
	cd keycloak-new; make down
	cd minio; make down 
	cd vault; make down


perm:
	sudo find . -user pasa -print0 | xargs -0 sudo chown :dreamdocs
	sudo find . -group dreamdocs -print0 | xargs -0 sudo chmod g+rw
	sudo find . -group dreamdocs -type d -print0 | xargs -0 sudo chmod g+s
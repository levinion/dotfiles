run:
	${MAKE} install
	${MAKE} deploy

install:
	paru -S --needed $(shell cat packages.txt)

deploy:
	ansible-playbook -Ki inventory.ini playbook.yaml

.PHONY: install run deploy

install: install-deps apply-user apply-system

install-deps:
	paru -S --needed stor 

apply-user:
	stor -f user/*/

apply-system:
	sudo stor -cf -t / system/*/

push: deps
	git add .
	git commit -m "$(shell date)"
	git push -u origin main

.PHONY: apply-user apply-system install-deps deps install push

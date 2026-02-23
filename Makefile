install: install-deps apply-user apply-system

install-deps:
	paru -S --needed $(shell cat pacman.list)

deps:
	pacman -Qqe > pacman.list

apply-user:
	stor -f user/*/

apply-system:
	sudo stor -cf -t / system/*/

.PHONY: apply-user apply-system install-deps deps install

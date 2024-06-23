.PHONY: sync commit desktop

sync:
	python scripts/dot.py sync

commit:
	python scripts/dot.py commit

desktop:
	cp desktop/* $(HOME)/.local/share/applications/

update:
	git add .
	git commit -m $(shell date "+%Y-%m-%d")
	git push origin main

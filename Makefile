.PHONY: sync commit desktop

sync:
	python scripts/dot.py sync

commit:
	python scripts/dot.py commit

desktop:
	cp desktop/* $(HOME)/.local/share/applications/

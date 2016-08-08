CONFIG_ROOT=~/.config

all: dirs homedots

dirs:
	for f in $$(find . -maxdepth 1 -type d -not \( -name ".git" -o -name '.' \)); do \
		f=$$(basename $$f); \
		ln -sfn $(CURDIR)/$$f $(CONFIG_ROOT)/$$f; \
	done

homedots:
	for f in $$(find . -maxdepth 1 -type f -name "\.*" -not -name '.gitignore'); do \
		f=$$(basename $$f); \
		ln -sf $(CURDIR)/$$f ~/$$f; \
	done

external:
	sh external_packages.sh

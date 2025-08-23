## Install brew packages
.PHONY: packages-install
packages-install:
	./setup.sh brew-install

## Install pure prompt
.PHONY: prompt-install
prompt-install:
	./setup.sh prompt-install

## Install dotfiles
.PHONY: dotfiles-install
dotfiles-install:
	./setup.sh dotfiles-install

## Delete brew packages
.PHONY: packages-delete
packages-delete:
	./setup.sh brew-delete

## Delete pure prompt
.PHONY: prompt-delete
prompt-delete:
	./setup.sh prompt-delete

## Install brew packages, pure prompt and dotfiles
.PHONY: install
install: packages-install prompt-install dotfiles-install

## Delete brew packages and pure prompt
.PHONY: delete
delete: packages-delete prompt-delete

# Help documentation https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@cat Makefile | grep -v '\.PHONY' |  grep -v '\help:' | grep -B1 -E '^[a-zA-Z0-9_.-]+:.*' | sed -e "s/:.*//" | sed -e "s/^## //" |  grep -v '\-\-' | sed '1!G;h;$$!d' | awk 'NR%2{printf "\033[36m%-30s\033[0m",$$0;next;}1' | sort

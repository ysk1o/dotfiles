.PHONY: install dryrun upgrade

install:
	@./install.sh

dryrun:
	@DRYRUN=1 ./install.sh

upgrade:
	brew update
	brew upgrade
	brew cleanup

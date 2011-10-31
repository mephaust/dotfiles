default: normal vim

# Normal files
.PHONY: normal

normal: $(HOME)/.ackrc $(HOME)/.bash_profile $(HOME)/.bashrc $(HOME)/.gemrc \
	$(HOME)/.gitconfig $(HOME)/.screenrc

$(HOME)/.ackrc:
	ln -s $(PWD)/ackrc $@

$(HOME)/.bash_profile:
	ln -s $(PWD)/bash_profile $@

$(HOME)/.bashrc:
	ln -s $(PWD)/bashrc $@

$(HOME)/.gemrc:
	ln -s $(PWD)/gemrc $@

$(HOME)/.gitconfig:
	ln -s $(PWD)/gitconfig $@

$(HOME)/.screenrc:
	ln -s $(PWD)/screenrc $@


.PHONY: vim vim-bundles

vim: $(HOME)/.vimrc $(HOME)/.vim vim-bundles
# Vim has some extra steps
$(HOME)/.vim:
	ln -s $(PWD)/vim $@

$(HOME)/.vimrc:
	ln -s $(PWD)/vimrc $@

vim-bundles:
	git submodule update


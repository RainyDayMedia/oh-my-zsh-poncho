## [RDM](http://rainydaymedia.net)'s Custom Theme for OH-MY-ZSH

Two flavors of the RDM Theme for [OH-MY-ZSH](https://github.com/robbyrussell/oh-my-zsh) that are both git aware.

* `/.oh-my-zsh/themes/rdm.zsh-theme`  *(borrowing from Eastwood and Fino)*
* `/.oh-my-zsh/themes/rdm2.zsh-themed` *(borrowing from [jeremyFreeAgent - powerline omz theme](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme))*

I'm using [iTerm2](http://www.iterm2.com/#/section/home) with the [RDM2 color scheme](https://github.com/zdj/themes) and [Source Code Pro Font](http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960) for both Regular and Non-ASCII fonts.

---

## Install:

1. Clone the repo:
`git clone git@github.com:ginfuru/oh-my-zsh-rdm-theme.git`
2. Create a symlink of **rdm2.zsh-theme** in **~/.oh-my-zsh/themes/**.
	* `ln -s /Path/to/original/folder ~/oh-my-zsh/themes/rdm2.zsh-theme `
	* Alternatively - You can use the install script **install_rdm2_theme.sh**:
`./install_rdm2_theme.sh`

3. Configure the theme in your **.zshrc** file:
`ZSH_THEME="rdm2"`

## TODO:

- [X] better rvm integration I've moved away from RVM in place of RBENV
- [X] clean up - optimize
- [X] better git awareness
- [ ] fix git awareness on rdm to match rdm2

## Screen shots:

**rdm.zsh-theme:**
![rdm.zsh-theme](https://raw.github.com/ginfuru/omz_setup/master/preview-rdm_theme.png)

**rdm2.zsh-theme:**
![rdm.zsh-theme](https://raw.github.com/ginfuru/omz_setup/master/rdm2_theme.png)



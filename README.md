## [RDM](http://rainydaymedia.net)'s Custom Theme for OH-MY-ZSH

There are two flavors of the Poncho for [OH-MY-ZSH](https://github.com/robbyrussell/oh-my-zsh) both are _git aware_.

The Poncho themes are inspired and borrowing from:

* `/.oh-my-zsh/themes/poncho.zsh-theme`  *(borrowing from Eastwood and Fino)*
* `/.oh-my-zsh/themes/the_poncho.zsh-themed` *(borrowing from [jeremyFreeAgent - powerline omz theme](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme))*

In the preview images, I'm using [iTerm2](http://www.iterm2.com/#/section/home) with the [KitKat color scheme](https://github.com/zdj/themes) and [Source Code Pro Font](http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960) for both Regular and Non-ASCII fonts.

---

## Install:

1. Clone the repo:
`git clone git@github.com:RainyDayMedia/oh-my-zsh-poncho.git`
2. Create a symlink of **the_poncho.zsh-theme** in **~/.oh-my-zsh/themes/**.
	* `ln -s /Path/to/original/folder ~/oh-my-zsh/themes/the_poncho.zsh-theme `
	* Alternatively - You can use the install script **install_poncho.sh**:
`./install_poncho.sh`

3. Configure the theme in your **.zshrc** file:
`ZSH_THEME="the_poncho"`

## TODO:

- [X] better rvm integration **I've moved away from RVM in place of RBENV**
- [X] clean up - optimize
- [X] better git awareness
- [ ] fix git awareness on poncho to match the_ponocho

## Screen shots:

**poncho.zsh-theme:**
![poncho.zsh-theme](https://raw.githubusercontent.com/RainyDayMedia/oh-my-zsh-RDMTheme/master/preview-poncho.png)

**the_poncho.zsh-theme:**
![the_poncho.zsh-theme](https://raw.githubusercontent.com/RainyDayMedia/oh-my-zsh-RDMTheme/master/preview-the_poncho.png)



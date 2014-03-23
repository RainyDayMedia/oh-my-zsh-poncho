## oh-my-zsh custom theme

Two flavors of the RDM Theme for [OH-MY-ZSH](https://github.com/robbyrussell/oh-my-zsh) that are both git aware.  

* `/.oh-my-zsh/themes/rdm.zsh-theme`  *(borrowed from Eastwood and Fino)*
* `/.oh-my-zsh/themes/rdm2.zsh-themed` *(borrowed the concept from [jeremyFreeAgent - powerline omz theme](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme))*

I'm using [iTerm2](http://www.iterm2.com/#/section/home) with the [kitkat color scheme](https://github.com/zdj/themes) with [Inconsolata for Powerline](https://github.com/Lokaltog/powerline-fonts/tree/master/Inconsolata) for both Regular and Non-ASCII fonts. 

---

## Install:

1. Clone the repo:  
`git clone git@github.com:edtv82/oh-my-zsh-rdm-theme.git`
2. Create a symlink of **rdm2.zsh-theme** in **~/.oh-my-zsh/themes/**. 
	* `ln -s /Path/to/original/folder ~/oh-my-zsh/themes/rdm2.zsh-theme ` 
	* Alternatively - You can use the install script **install_rdm2_theme.sh**:
`./install_rdm2_theme.sh`

3. Configure the theme in your **.zshrc** file:  
`ZSH_THEME="rdm2"` 

## Screen shots:

**rdm.zsh-theme:**
![rdm.zsh-theme](https://raw.github.com/edtv82/omz_setup/master/preview-rdm_theme.png)

**rdm2.zsh-theme:**
![rdm.zsh-theme](https://raw.github.com/edtv82/omz_setup/master/preview-rdm2_theme.png)


## TODO:

1. ~~better rvm integration~~
2. ~~clean up - optimize~~
3. better git awareness

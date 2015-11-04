## Oh My ZSH themes
by those cloud junkies over at [Rainy Day Media](http://rainydaymedia.net)

All three *(3)* flavors of the Poncho are ***“git aware”*** and specifically designed for [OH-MY-ZSH](https://github.com/robbyrussell/oh-my-zsh) 

>Each are inspired and borrowing from:

* [Eastwood](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/eastwood.zsh-theme)
* [Fino](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/fino.zsh-theme)
* [RobbyRussell](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme)
* [jeremyFreeAgent - powerline omz theme](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme)

The Poncho preview images are using [iTerm2](http://www.iterm2.com/#/section/home) with the [KitKat color scheme](https://github.com/zdj/themes) and [Source Code Pro Font](http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960) font.
The Rain Coat gif is using again the same but the iTerm2 color scheme is a slight modified version of [Oceanic Next](https://github.com/voronianski/oceanic-next-color-scheme) and using [Inconsolata](https://github.com/powerline/fonts/tree/master/Inconsolata) font.

>NOTE: You'll need to make sure you set the Non-ASCII in iTerm2 to a Powerline font
>![iTerm2 Settings](https://raw.githubusercontent.com/RainyDayMedia/oh-my-zsh-poncho/master/preview-iterm-settings.png)

##### Screen shots:

**rain_coat.zsh-theme:**
![rain_coat.zsh-theme](https://raw.githubusercontent.com/RainyDayMedia/oh-my-zsh-RDMTheme/master/preview-rain_coat.gif)

**poncho.zsh-theme:**
![poncho.zsh-theme](https://raw.githubusercontent.com/RainyDayMedia/oh-my-zsh-RDMTheme/master/preview-poncho.png)

**the_poncho.zsh-theme:**
![the_poncho.zsh-theme](https://raw.githubusercontent.com/RainyDayMedia/oh-my-zsh-RDMTheme/master/preview-the_poncho.png)

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
- [ ] fix git awareness on poncho to better match the_ponocho


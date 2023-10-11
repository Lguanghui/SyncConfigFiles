# 个人配置同步

## killSCIM.sh

用于解决 macOS 外接三方显示器的时候，因设置显示器独立空间导致的，在切换中文输入法时引起系统卡死卡顿的问题。

设置该脚本定时执行：

```shell
crontab -e

0 */2 * * * kill -9 `pgrep SCIM`

# 保存并退出
```

> 参考：
> 
> https://www.v2ex.com/t/898932
> 
> [如何解决-macos-13-系统频繁出现卡死问题](https://blog.xlclan.com/posts/%E5%A6%82%E4%BD%95%E8%A7%A3%E5%86%B3-macos-13-%E7%B3%BB%E7%BB%9F%E9%A2%91%E7%B9%81%E5%87%BA%E7%8E%B0%E5%8D%A1%E6%AD%BB%E9%97%AE%E9%A2%98/)

## vimrc

Vim 配置文件

## ideavimrc

在 IDEA 等 jetbrains 系列 IDE 里面使用的 Vim 插件配置。

IDE 里面需要安装 IdeaVim 以及 IdeaVimExtension 插件，后者用于自动切换中英文输入法。

## zshrc

oh-my-zsh 的配置文件。

## gitignore_global

git 的全局忽略配置。

## git-commit-template

git 全局提交模板。

## sublime-commands

Sublime Merge 的自定义指令。

## tmux.conf

使用 [Oh my tmux](https://github.com/gpakosz/.tmux)，可以由 git 管理，不在此仓库中单独管理。

这个配置默认没有开启支持鼠标滚动查看内容，需要按一下 `prefix + [` 进入复制模式，才可以用鼠标/触控板滚动查看历史内容。最后按 `esc` 退出复制模式。

> 参考：https://www.cnblogs.com/bamanzi/archive/2012/08/17/mouse-wheel-in-tmux-screen.html

## lvim/config.lua

lunarVim 的自定义配置。
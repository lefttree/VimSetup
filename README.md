# Vim Setup
my vim setup, plugins and .vimrc

##To Do

1. add install script to automatically setup on new system
   like [k-vim](https://github.com/wklken/k-vim)

##Compile Vim from source

系统自带的vim往往功能有阉割（我的ubuntu 14.04就没有clipboard支持），所以一般我们需要compile from source, 一般使用Vim 7.4+

具体如何compile请看在`YouCompleteMe`下的这个[文章](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)

上面那个blog compile的vim有可能没有clipboard support，这篇[blog](https://kowalcj0.wordpress.com/2013/11/19/how-to-compile-and-install-latest-version-of-vim-with-support-for-x11-clipboard-ruby-python-2-3/)讲了如何更好地compile vim

###Install on Mac(stackoverflow)

Download the latest MacVim which comes with a very complete vim executable and use it in Terminal.app like so.

`alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'`

##插件管理

>[转载](https://github.com/yangyangwithgnu/use_vim_as_ide)

一般有两种选择`vundle`和`pathogen`，这里我选择`pathogen`.

使用：
安装
1. 先在 `~/.vim/bundle/` 下创建目录 `plugin_name/`
2. 然后到 vim 官网下载 `plugin_name` 压缩包并解压至 `~/.vim/bundle/plugin_name/`

>注意不要重复包含多次 plugin_name/ 目录，如，~/.vim/bundle/plugin_name/plugin_name/。

卸载
1. 直接删除 plugin_name/ 插件目录即可。

通过 pathogen 管理插件后，相较以前有几点变化：

- 切勿通过发行套件自带的软件管理工具安装任何插件，不然 .vim/ 又要混乱了；
- pathogen 无法安装配色主题风格，只能将主题插件手工放置于 ~/.vim/colors/；

###plugin list

- [vim-airline](https://github.com/bling/vim-airline)
    + power status line
- [vim-indent-guide](https://github.com/nathanaelkane/vim-indent-guides.git)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
    + easily comment/uncomment codes
- [STL Syntax](https://github.com/Mizuchi/STL-Syntax.git)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation)
    + ycm安装过程请参考[link](https://github.com/yangyangwithgnu/use_vim_as_ide)
- [syntastic](https://github.com/scrooloose/syntastic)
    + syntax check for vim
- [rainbow parentheses](https://github.com/kien/rainbow_parentheses.vim)
    + colorful parentheses
- [nerdTree](https://github.com/scrooloose/nerdtree)
    + browse file structure
- [python syntax highlight](https://github.com/hdima/python-syntax)
- [vim-pyflakes](https://github.com/nvie/vim-flake8.git)
    + static syntax and style checker for python
    + supersedes both `vim-pyflakes` and `vim-pep8`
- [vim-jsdoc](https://github.com/heavenshell/vim-jsdoc.git)
- [DoxygenToolkit](http://www.vim.org/scripts/script.php?script_id=987)
    + doc generator
    + c/c++. python
    + put in `~/.vim/plugin`
- [tagbar](https://github.com/majutsushi/tagbar)
    + browse the tags of the current file and get an overview of its structure
    + uses `ctags`
- [tag list](https://github.com/vim-scripts/taglist.vim)
    + put in `~/.vim/plugin` and `~/.vim/doc`
    + uses `ctags`
- [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)
- [vim-easymotion](https://github.com/easymotion/vim-easymotion)
    + very cool, jump into any position
- [ultisnips](https://github.com/SirVer/ultisnips)
    + insert customized code
    + use [vim-snippets](https://github.com/honza/vim-snippets.git)
- [delemitMate](https://github.com/Raimondi/delimitMate)
    + automatic add closing quotes, parenthesis, brackets....
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [vim-javascript]( git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript)
- [vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax)
- [tabular](https://github.com/godlygeek/tabular)

- [emmet](https://github.com/mattn/emmet-vim)
    + html edit, learn the syntax from their site
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git)
- [simplyFold](https://github.com/tmhedberg/SimpylFold)
- [jslint](https://github.com/hallettj/jslint.vim)

##Theme

我表示一直用[solarized](https://github.com/altercation/vim-colors-solarized)
将solarized.vim copy到`~/.vim/colors/`, 然后在`.vimrc`中设置其为theme

想换的可以到这个[网站](http://vimcolors.com/)

###Mac Iterm color settings

if you iterm doesn't show correct color, see this [stackoverflow link](http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized)

##Fonts

如何在linux上安装字体 (link)(http://my.oschina.net/itblog/blog/278566)


##Short-Cuts

**search**

search for where cursor is

`<shift> + #` search for next occurance
`<shift> + *` search for previous occurance


**insert**

```
ci[ 删除一对 [] 中的所有字符并进入插入模式
ci( 删除一对 () 中的所有字符并进入插入模式
ci< 删除一对 <> 中的所有字符并进入插入模式
ci{ 删除一对 {} 中的所有字符并进入插入模式
cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
ci" ci' ci` 删除一对引号字符 (" 或 ' 或 `) 中所有字符并进入插入模式
```

```
vi[ 选择一对 [] 中的所有字符
vi( 选择一对 () 中的所有字符
vi< 选择一对 <> 中的所有字符
vi{ 选择一对 {} 中的所有字符
vit 选择一对 HTML/XML 的标签内部的所有字符
vi" vi' vi` 选择一对引号字符 (" 或 ' 或 `) 中所有字符
```

**comment**

```
<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
<leader>cu，取消选中文本块的注释。
```

**indent**

```
插入模式
  Ctrl-T增加缩进，Ctrl-D减小缩进。
命令模式
  >> 右缩进， << 左缩进，注意n<< 或 n>>是缩进多行，如4>>
可视模式
  < 、 > 用于左右缩进， n< 、 n> 可做多节缩进，如 2> 。
```

**跳转**

```
跳转到定义
  gd到局部变量的定义，gD到全局变量的定义
搜索
  *, # 可对光标处的词向前/向后做全词搜索，g*, g# 做相对应的非全词匹配搜索
代码块首尾
  [[, ]] 可跳到当前代码块起始或结束的大括号处。
括号首尾
  % 可在配对的括号、块首尾之前跳转。
位置历史
  Ctrl-O 在历史记录中后台，Ctrl-I 则为前进。
```

**quickFix**

```
:cw
:cn
:cp
```

**vim-flake8**

press `<F7>` to run `flake8` on python file

**NerdTree**

```
<Leader>fl #nerdTree toggle
```

**JsDoc**

1. move cursor on `function` ketword line
2. `:JsDoc`
3. follow prompt to insert JSDoc

**DoxygenToolkit**

License `:DoxLic`
Author `:DoxAuthor`
Function/Class `:Dox`
Group `:DoxBlock`

**Tagbar**

`<F8>`

```
nmap <F8> :TagbarToggle<CR>
```

**Taglist**

```
:TlistToggle
```

**easy motion**

```
<Leader><Leader> w
<Leader><Leader> fe //search for e
```

**vim-surround**

delete use `ds`
change use `cs`
`ys` takes a valid Vim motion or text object as the first object, and wraps       
it using the second argument as with cs.  (It's a stretch, but a good           
mnemonic for "ys" is "you surround".)

It's easiest to explain with examples. Press `cs"'` inside

`"Hello world!"`
to change it to

`'Hello world!'`

To remove the delimiters entirely, press `ds'`.

`Hello world!`

**vim expand**

`+` to expand
`-` to shrink

**emmet**

[tutorial](https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL)

**Jslint**

- `:JSLintUpdate`
- `:JSLintToggle`

##Reference

- [use vim as a ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
- [把vim打造成一个真正的IDE](http://www.vimer.cn/2009/10/%E6%8A%8Avim%E6%89%93%E9%80%A0%E6%88%90%E4%B8%80%E4%B8%AA%E7%9C%9F%E6%AD%A3%E7%9A%84ide1.html)
- [用vim编程-配置与技巧](http://linux-wiki.cn/wiki/zh-hans/%E7%94%A8Vim%E7%BC%96%E7%A8%8B%E2%80%94%E2%80%94%E9%85%8D%E7%BD%AE%E4%B8%8E%E6%8A%80%E5%B7%A7)
- [配置基于vim的python变成环境](http://linux-wiki.cn/wiki/%E9%85%8D%E7%BD%AE%E5%9F%BA%E4%BA%8EVim%E7%9A%84Python%E7%BC%96%E7%A8%8B%E7%8E%AF%E5%A2%83)
- [linux my vim](http://www.wklken.me/posts/2013/06/11/linux-my-vim.html)
- [linux my vim - kvim](https://github.com/wklken/k-vim)

##Vim学习
- [新手练习稿](http://blog.csdn.net/wklken/article/details/7533272) 
- [简明vim练级攻略](http://coolshell.cn/articles/5426.html)
- [vim skill](http://vimskill.readthedocs.org/zh/latest/index.html)

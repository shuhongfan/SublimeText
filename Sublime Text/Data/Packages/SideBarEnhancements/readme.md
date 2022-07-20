# Sidebar Enhancements

### In other languages

English - <https://github.com/SideBarEnhancements-org/SideBarEnhancements.git>

Japanese - <http://taamemo.blogspot.jp/2012/10/sublime-text-2-sidebarenhancements.html?m=1>

Russian - <https://www.youtube.com/watch?v=8I0dJTd58kI&feature=youtu.be&a>

## 介绍

此版本为[Sidebar Enhancements](https://github.com/SideBarEnhancements-org/SideBarEnhancements)的中文版，为[Sublime Text](http://www.sublimetext.com/)侧栏文件和文件夹操作提供增强功能。

- 提供“删除”、“打开”和“剪贴板”操作。
- 关闭、移动、打开、恢复受重命名/移动命令的缓冲区。（甚至在文件夹上）
- 基本功能：新建文件/文件夹、编辑、打开/运行、打开文件位置、查找所选/父文件夹/项目、剪切、复制、粘贴、粘贴到父目录、重命名、移动、删除、刷新……
- 高级功能：可选复制URL编码后的路径、复制UTF-8编码的内容、复制base64转码后的内容（适合嵌入css）、复制快速生成img/a/script/style等标签内容
- 当删除操作受影响时，使用“首选项”来控制是否关闭缓冲区
- 允许在状态栏上显示“文件修改日期”和“文件大小”。（可能有点儿麻烦）



## 安装

下载或复制到与包名同名的文件夹到ST的Packages文件夹中（首选项Preferences->浏览插件目录Browse Packages...）


也可以到[releases](https://github.com/52fisher/SideBarEnhancements/releases)页面下载，**请注意：解压后其对应的文件夹路径应为：Sublime Text 3\Data\Packages\SideBarEnhancements**

如下载后的压缩包打开后是这样的：


```
--SideBarEnhancements-5.0.23（一级文件夹）
----bin（二级文件夹）
----desktop（二级文件夹）
----edit（二级文件夹）
----Commands.sublime-commands(二级文件)
…
```
正确的形式是：
```
--bin（一级文件夹）
--desktop（一级文件夹）
--edit（一级文件夹）
--Commands.sublime-commands(一级文件)
…
```

### **安装故障排除**


如果您在安装时遇到问题，请执行以下操作：
- 首先请注意，此包只会在“文件夹”部分添加上下文菜单，而不是“打开方式”部分。
- 打开插件目录。“主菜单 ->首选项 -> 浏览插件目录”.(Main menu -\> Preferences -\> Browse Packages)
- 关闭Sublime Text
- 删除/Packages/SideBarEnhancements文件夹
- 删除User/SideBarEnhancements文件夹
- 打开上级目录，到“Installed Packages”文件夹，检查SideBarEnhancements的任何packages并将其删除
- 打开ST，使用Package Control转到：Remove Package，检查SideBarEnhancements的任何package并将其删除。
- 重启ST
- 打开ST，检查Package Control中是否含有SideBarEnhancements的任何内容（在Remove Package和Enable Package中都要检查）
- 重复直到找不到任何有个内容
- 重启ST
- 重新安装SideBarEnhancements
- 正常使用
## 快捷键 F12

（请注意，从版本2.122104开始，此软件包不再提供快捷键设置，您需要手动将其添加到您的sublime-keymap文件中（请参阅下一节））
使用F12可以在浏览器中打开当前文件

`url_testing` 允许您设置本地服务器的URL，通过F12打开


`url_production`允许您设置产品服务器的URL，通过ALT + F12打开

### 关于绝对路径

- 右键单击侧栏上的任何文件，然后选择：“项目 - >编辑预览地址”
- 编辑此文件，并使用以下结构添加路径和URL：
<!-- -->

    {
        "S:/www/domain.tld":{
            "url_testing":"http://testing",
            "url_production":"http://domain.tld"
        },
        "C:/Users/luna/some/domain2.tld":{
            "url_testing":"http://testing1",
            "url_production":"http://productiontld2"
        }
    }

### 关于相对路径

假如我们有一个具有以下结构的项目

    Project/ < - root project folder
    Project/libs/
    Project/public/ < - the folder we want to load as "http://localhost/"
    Project/private/
    Project/experimental/ < - other folder we may run as experimental/test in another url "http://experimental/"

接着创建配置文件：

`Project/.sublime/SideBarEnhancements.json`

内容：

    {
        "public/":{
            "url_testing":"http://localhost/",
            "url_production":"http://domain.tld/"
        },
        "experimental/":{
            "url_testing":"http://experimental/",
            "url_production":"http://domain.tld/"
        },
        "":{
            "url_testing":"http://the_url_for_the_project_root/",
            "url_production":"http://the_url_for_the_project_root/"
        }
    }

...

你可以创建配置文件 `some/folder/.sublime/SideBarEnhancements.json` 在任何地方.

#### F12 快捷键冲突

在Sublime Text 3中，`F12`键默认绑定到`“goto_definition”`命令中。 此Package该快捷键相冲突，便不会有任何反应。 您需要立即手动添加按键配置：转到“首选项 - >Package Settings - >Side Bar -> Key Bindings - User”中并添加以下任何内容：
        [
            { "keys": ["f12"],
                "command": "side_bar_open_in_browser" ,
                "args":{"paths":[], "type":"testing", "browser":""}
            },
            { "keys": ["alt+f12"],
                "command": "side_bar_open_in_browser",
                "args":{"paths":[], "type":"production", "browser":""}
            },
            {
                "keys": ["ctrl+t"],
                "command": "side_bar_new_file2"
            },
            {
                "keys": ["f2"],
                "command": "side_bar_rename"
            },
        ]
## 绑定"在路径中查找"按键
您可能希望添加一个用于打开“在路径中查找...”的按键。
```
[
	{
		"keys": ["f10"],
		"id": "side-bar-find-files",
		"command": "side_bar_find_files_path_containing",
		"args": {
			"paths": []
		}
	}
]
```
## 配置“打开方式”（用……打开）菜单的注意事项：


文件地址: `User/SideBarEnhancements/Open With/Side Bar.sublime-menu` . 右键单击打开项目中的任何文件，然后选择“用……打开>Edit Applications...”

-   在OSX上, 如果用“打开…”命令，“application”属性只需要传递应用程序的*名称*，最为接近的文件完整路径将传递到该文件，例如：“application”：“google chrome”
-  在OSX上，不支持调用* shell *命令。
-  菜单项的Caption和id应该为唯一名称

<!-- -->

	//application 1
	{
		"caption": "Photoshop",
		"id": "side-bar-files-open-with-photoshop",
		"command": "side_bar_files_open_with",
		"args": {
			"paths": [],
			"application": "Adobe Photoshop CS5.app", // OSX
			"extensions":"psd|png|jpg|jpeg",  //任何该后缀名的文件
			"args":[]
		}
		"open_automatically" : true // 关闭视图/选项卡并启动应用程序
	},

### 参数变量说明

- $PATH - 当前文件的全部路径，如C:\Files\Chapter1.txt.
- $PROJECT - 当前项目的根目录
- $DIRNAME - 当前文件的目录, 如C:\Files.
- $NAME - 当前文件的名称部分,如Chapter1.txt.
- $NAME_NO_EXTENSION - 当前文件的名称部分(不含扩展名), "Chapter1"
- $EXTENSION - 当前文件的扩展名,如 txt.

## 库使用说明

(check each license in project pages)

-   "getImageInfo" to get width and height for images from "bfg-pages". See: <http://code.google.com/p/bfg-pages/>
-   "desktop" to be able to open files with system handlers. See: <http://pypi.python.org/pypi/desktop>
-   "send2trash" to be able to send to the trash instead of deleting for ever!. See: <http://pypi.python.org/pypi/Send2Trash>
-   "hurry.filesize" to be able to format file sizes. See: <http://pypi.python.org/pypi/hurry.filesize/>
-   "Edit.py" ST2/3 Edit Abstraction. See: <http://www.sublimetext.com/forum/viewtopic.php?f=6&t=12551>

## 源代码

<https://github.com/SideBarEnhancements-org/SideBarEnhancements>

## 论坛

<http://www.sublimetext.com/forum/viewtopic.php?f=5&t=3331>

# 贡献者:
(非常感谢)
(Thank you so much!)
Aleksandar Urosevic, bofm, Dalibor Simacek, Devin Rhode, Eric Eldredge, Hewei Liu, Jeremy Gailor, Joao Antunes, Leif Ringstad, MauriceZ, Nick Zaccardi, Patrik Göthe, Peder Langdal, Randy Lai, Raphael DDL Oliveira, robwala, Stephen Horne, Sven Axelsson, Till Theis, Todd Wolfson, Tyler Thrailkill, Yaroslav Admin

## 待完成

<https://github.com/SideBarEnhancements-org/SideBarEnhancements/issues/223>

## License

"None are so hopelessly enslaved as those who falsely believe they are free." Johann Wolfgang von Goethe

Copyright (C) 2014 Tito Bouzout [tito.bouzout@gmail.com][]

This license apply to all the files inside this program unless noted different for some files or portions of code inside these files.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation. <http://www.gnu.org/licenses/gpl.html>

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/gpl.html>

## 觉得有用?欢迎支持（原作者） ^_^


捐赠该项目.

  [Sublime Text 3+](http://www.sublimetext.com/)

  [dropbox]( https://www.dropbox.com/s/ckz5n2ncn2pxkii/sidebar.png?dl=1)

  [desktop](http://pypi.python.org/pypi/)
  
  [Send2Trash]( http://pypi.python.org/pypi/Send2Trash)

  [bfg-pages]( http://code.google.com/p/bfg-pages/)

  [tito.bouzout@gmail.com](tito.bouzout@gmail.com)

  [Donate to support this project.]( https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DD4SL2AHYJGBW)

# uall
unicode all files in current working directory (CWD) and files in all subdirectories of CWD recursively. For Stata users updated from version 13 to version 14 or higher.

### 1. ua 
适用于 stata15 用户。可以一次性对当前工作路径以及所有子文件夹中的文件进行转码(unicode)，以保证中文字符可以正常显示。

#### 安装
下载 `ua.ado` 和 `ua.hlp`，放置于 `D:\stata15\ado\base\u` 或 `D:\stata15\ado\plus\u` 文件夹中。

#### 使用
- 在 Stata 命令窗口中输入 `help ua`，查看命令介绍和 Stata 范例。参照范例使用即可。

## Stata help for `ua` 

### Title

`uall` -- unicode all files in current working directory (CWD) and files in all subdirectories of CWD recursively.


### Syntax

- Short version (Chinese only):

```stata
. uall
```
-  Full version:
```stata
 . uall [encoding-name]
```

### Description

`uall` is shortcut for `help ua`.

It executes the following two commands:
```stata
      . ua: unicode encoding set gb18030
      . ua: unicode translate *
```
where, **encoding-name** is the name of encoding, see the list of encodings.  The default is **gb18030** for Chinese. So, for Chinese user, you need not specify this option.

### Warning

We recommend you read **help unicode**, and for safety, backup your files and do some tests before you use ua.


### Examples
```stata
  * Change current working directory (CWD)
    . cd D:\stata15\ado\personal\mypaper

  * For Chinese users:
    . uall

  * For Japnese users:
    . uall ibm-943_P15A-2003
                
  * For Korean users:
    . uall ibm-970_P110_P110-2006_U2
```

                
### Author

Yujun,Lian (Arlion) Department of Finance, Lingnan College, Sun Yat-Sen University.    
E-mail: arlionn@163.com.
Blog: https://github.com/arlionn/  ||  http://www.jianshu.com/u/69a30474ef33


### Acknowledgements

    I would like to thank Dr. Hua Peng at StataCorp LP for helpful suggestions.

    Codes from rcd by Nikos Askitas and Dan Blanchette have been incorporated.



Also see

</pre>



#### Examples
```stata

  * Change current working directory (CWD)
    . cd D:\stata15\ado\personal\mypaper

  * Unicode all .dta files in CWD and files in sub-directories
    . ua: unicode encoding set gb18030
    . ua: unicode translate *.dta

  * Unicode all files (.do, .ado, .dta, .hlp, etc.) in CWD and files in sub-directories
    . ua: unicode encoding set gb18030
    . ua: unicode translate *

```

---
### 2. `uall` 

#### Description

`uall` is shortcut for `help ua`.

It executes the following two commands:
```stata
  . ua: unicode encoding set gb18030
  . ua: unicode translate *
```

#### Syntax

- Short version (Chinese only):
```stata
     . uall
```
- Full version:
```stata
     . uall [encoding-name]
```
- encoding-name is the name of encoding, see the list of encodings.  
- The default is *gb18030* for Chinese. So, for Chinese user, you need not specify this option.



#### Examples
```stata
  * Change current working directory (CWD)
    . cd D:\stata15\ado\personal\mypaper

  * For Chinese users:
    . uall

  * For Japnese users:
    . uall ibm-943_P15A-2003
                
  * For Korean users:
    . uall ibm-970_P110_P110-2006_U2
```

#### Author

- Yujun,Lian (Arlion) Department of Finance, Lingnan College, Sun Yat-Sen University.
- E-mail: arlionn@163.com.
- 连玉君 ([知乎](https://zhuanlan.zhihu.com/arlion) | [简书](http://www.jianshu.com/u/69a30474ef33) | [码云](https://gitee.com/arlionn))    

  



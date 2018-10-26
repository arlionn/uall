# uall
- unicode all files in current working directory (CWD) and files in all subdirectories of CWD recursively. For Stata users updated from version 13 to version 14 or higher.
- (中文-Chinese) 适用于 stata15 用户。可以一次性对当前工作路径以及所有子文件夹中的文件进行转码(unicode)，以保证中文字符可以正常显示。

## 安装 (install package)
- 方法1: 下载 `uaall.ado` 和 `uall.hlp`，放置于 `D:\stata15\ado\base\u` 或 `D:\stata15\ado\plus\u` 文件夹中。
- 方法2: 在 Stata 命令窗口中输入命令 `github install arlionn/uall, replace`

## 使用
- 在 Stata 命令窗口中输入 `help uall`，查看命令介绍和 Stata 范例。参照范例使用即可。

## Examples
```stata
  * Change current working directory (CWD), 待转换文件路径
    . cd D:\stata15\ado\personal\mypaper

  * For Chinese users: (对该文件夹下的所有文件进行转码)
    . uall

  * For Japnese users:
    . uall ibm-943_P15A-2003
                
  * For Korean users:
    . uall ibm-970_P110_P110-2006_U2
```

                
## Author

- Yujun,Lian (Arlion) Department of Finance, Lingnan College, Sun Yat-Sen University.    
- E-mail: arlionn@163.com.
- Blog: https://github.com/arlionn/  ||  http://www.jianshu.com/u/69a30474ef33
- 连玉君 ([知乎](https://zhuanlan.zhihu.com/arlion) | [简书](http://www.jianshu.com/u/69a30474ef33) | [码云](https://gitee.com/arlionn))    


## Acknowledgements

I would like to thank Dr. Hua Peng at StataCorp LP for helpful suggestions.      
Codes from `rcd` by Nikos Askitas and Dan Blanchette have been incorporated.

  



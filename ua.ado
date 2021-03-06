
*! version 1.0 2017/12/19 9:42
*! Yujun Lian, arlionn@163.com
*! -rcd.ado- is written by Dan Blanchette and Nikos Askitas
// cap program drop unicodeall
// program define unicodeall  

cap program drop ua
program define   ua  
version 15

preserve 
clear
  
  local currdir `c(pwd)'  //一级目录当前路径
  
  capture _on_colon_parse `0'  //  
  local ucmd `s(after)'   // unicode command specified by user

  dis _n(5) 
  dis in w _dup(35) "=" 
  dis in w "Files in the following directories"
  dis in w "are to be analyzed or translated:"  
  dis in w _dup(35) "=" _n _n

  rcd   // get the list of all sub-directories
  
*-record the return directories by -rcd- in my locals, 
* otherwise they will be overwrited by -unicode *- cmds
  forvalues i = 1(1)`r(tdirs)'{ 
     local dir`i' `"`r(ndir`i')'"'
  }
 
*-unicode all directories 

forvalues i = 1(1)`r(tdirs)'{

  qui cd `"`dir`i''"'
  dis _n(2) in w _dup(18) "=" _n    ///
      in r "Current directory: " _n ///
	  in w _col(5) `"`dir`i''"' _n
	  
  * confirm there are files in current directory
  * For blank directory, -unicode analyze *- will report error messeage
  local withfiles : dir . files *  
  if `"`withfiles'"' != ""{
     `ucmd'   // unicode *
  }
  else{
     dis in w "No files needed to be analyzed or translated in this folder"
  }
  
}

restore

qui cd `currdir'

end


/*
Notes:
1. 需要增加 clear 选项： 用 Preserve 代替了
2. 当前文件夹为空时的错误信息处理： 用 `withfiles' 代替了
*/


/*

 A recursive cd command written by Dan Blanchette and Nikos Askitas.
 
*/


program rcd, rclass
version 9

if inlist(`"`1'"',",",":","") {
  local pwd `""`c(pwd)'""'
}
else  {
  local pwd `""`1'""' 
}


local version : di "version " string(_caller()) ":"
capture _on_colon_parse `0'

if c(rc) == 0 {
  if `"`s(before)'"' != "" {
    // reset 0 before -syntax- so that options of the command submitted to -walk- don't create an invalid option message
    local 0 `"`s(before)'"'
  }
  else if `"`s(before)'"' == "" & `"`s(after)'"' == ""  {
    local 0 `", verbose"'
  }
  else if `"`s(before)'"' == "" | `"`s(after)'"' != "" {
    // reset 0 before -syntax- so that options of the command submitted to -walk- don't create an invalid option message
    local 0 `""'
    local subcmd : word 1 of `s(after)'
    if `"`subcmd'"' != "" {
      capture which `subcmd'  // abbreviated commands are fine
      if _rc != 0 {
	capture program list `subcmd'  // now check if it's just command user just loaded
        if _rc != 0 {
          display as error  `"command `subcmd' not found as either built-in or ado-file"'
          exit 111
        }
      }
      *if "`subcmd'" == "rcd" {
      * display as error  `"are you crazy?! ;-)"'
      * exit 111
      *}
    }
  }
}
else {
  if `"`1'"' == "" {
    local 0 `", verbose"'
  }
}


syntax [anything]  [, Verbose depth(integer 999999999) DIRFilter(string) ] 

if `pwd' != `"`c(pwd)'"' {
  local cwd `""`c(pwd)'""'
  if `"`c(os)'"' == "Windows" {
    local cwd `""`c(pwd)'`c(dirsep)'""'
  }
  capture cd `pwd'
  quietly cd `cwd'
  if _rc != 0 {
    display as error `"directory `pwd' not found"'
    exit 601
  }
}

return local sdir `"`c(pwd)'"'

tempfile rcdirs
tempname rcdf
file open `rcdf' using `"`rcdirs'"', write text

Rcd `pwd' , command(`"`s(after)'"') `verbose' depth(`depth') dirfilter(`"`dirfilter'"') nds(0) rcdf(`rcdf')

file close `rcdf'

local ndir = 0
capture confirm file "`rcdirs'"
if _rc == 0 {
  tempname rcd 
  file open `rcd' using `"`rcdirs'"' , text read
  file read `rcd' line
  while r(eof) == 0 {
    return local ndir`++ndir' `"`line'"'
    file read `rcd' line
  }
  file close `rcd' 
}
return local tdirs = `ndir'

end

program def Rcd
version 9.0
syntax [anything(name=pwd)]  [, command(string) Verbose depth(integer 999999999) dirfilter(string) nds(integer 0) ///
        dir(string) rcdf(string) ] 
local footd `""`c(pwd)'""'
if `"`c(os)'"' == "Windows" {
  local footd `""`c(pwd)'`c(dirsep)'""'
}

local nds=`nds' + 1

if `nds' <= `depth' {
  local cwd `""`c(pwd)'""'
  if `"`c(os)'"' == "Windows" {
    local cwd `""`c(pwd)'`c(dirsep)'""'
  }
  capture cd `pwd'  // pwd is has quotes around it
  quietly cd `cwd'  // cwd is has quotes around it
  if _rc == 0 {
    quietly cd `pwd'
    file write `rcdf' `"`c(pwd)'"' _n
    if "`verbose'" != "" {
      display as text `"cd "`c(pwd)'" "'
    }
    local dirlist : dir . dirs *, nofail // create dirlist before command since command could change directories: cd, rcd etc
    local prefix `"`c(pwd)'"'
    if regexm(`"`dir'"',`"`dirfilter'"') {
      `command'
    }
    quietly cd `"`prefix'"'
  
    foreach dir of local dirlist {
  
      Rcd `"`dir'"' , command(`"`command'"') `verbose' depth(`depth') dirfilter(`"`dirfilter'"') nds(`nds') ///
            dir(`"`dir'"') rcdf(`rcdf')
    }
  }
  quietly cd `footd'  // footd is has quotes around it

}
end


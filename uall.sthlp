{smcl}
{* 21dec2017}{...}
{hi:help uall}
{hline}

{title:Title}

{p 4 4 2}{hi:uall} {hline 2} {cmdab:u:nicode} {cmdab:all:} files in current working directory (CWD) and files in all subdirectories of CWD recursively.


{title:Syntax}

{p 4 15 2} 
Short version (Chinese only):    

{p 12 15 2}  {cmd:    . uall} 

{p 4 15 2} 
Full  version:     

{p 12 15 2} {cmd:    . uall [encoding-name]} 


{title:Description}

{p 4 4 6}
{cmd:uall} is shortcut for {helpb ua:help ua}. 

{p 4 4 6}
It executes the following two commands:

{p 6 8 2} . ua: unicode encoding set gb18030{p_end}
{p 6 8 2} . ua: unicode translate *{p_end}

{p 4 4 6}
{opt encoding-name} is the name of encoding, see {help encodings:the list of encodings}.
The default is {it: gb18030} for Chinese. So, for Chinese user, you need not 
specify this option.


{title:Warning}

{p 4 4 6}
We recommend you read {helpb unicode}, and for safety, backup your files and do some tests before you use {cmd:ua}.


{title:Examples}

{p 2 8 2} * Change current working directory (CWD){p_end}
{p 4 8 2} . cd D:\stata15\ado\personal\mypaper{p_end}

{p 2 8 2} * For Chinese users: {p_end}
{p 4 8 2} . uall{p_end}

{p 2 8 2} * For Japnese users: {p_end}
{p 4 8 2} . uall  ibm-943_P15A-2003{p_end}
		
{p 2 8 2} * For Korean users: {p_end}
{p 4 8 2} . uall  ibm-970_P110_P110-2006_U2{p_end}


		
{title:Author}

{phang}
{cmd:Yujun,Lian (Arlion)} Department of Finance, Lingnan College, Sun Yat-Sen University.{break}
E-mail: {browse "mailto:arlionn@163.com":arlionn@163.com}. {break}
Blog: {browse "http://www.jianshu.com/u/69a30474ef33":http://www.jianshu.com/u/69a30474ef33}. {break}
{p_end}


{title:Acknowledgements}

{p 4 8 2}
I would like to thank Dr. Hua Peng at StataCorp LP for helpful suggestions.

{p 4 8 2}
Codes from {help rcd} by Nikos Askitas and Dan Blanchette have been incorporated.

{p 4 8 2}


{title:Also see}

{psee}
    Online:  help for {helpb unicode}, {helpb rcd}

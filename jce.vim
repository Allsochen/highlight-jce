" Vim syntax file " 
" Language: Jce 
" Maintainer: Allsochen <345078251@qq.com>
" URL: http://t.qq.com/allsochen
" Last Change: 2011 October 20

" Quit when a syntax file was already loaded
if !exists("main_syntax")
    if version < 600
        syntax clear
    elseif exists("b:current_syntax")
        finish
    endif
    " We define it here so that include files can highlight it.
    let main_syntax='jce'
endif

" Dont't use standard HiLink, it will not work with included syntax files
if version < 508
    command! -nargs=+ JceHiLink hi link <args>
else
    command! -nargs=+ JceHiLink hi def link <args>
endif

" Base keyword definitions 
syn match	jceInclude	display "^\s*\(%:\|#\)\s*include\>\(\s*["<]\)\@="
syn keyword jceModule module
syn keyword jceType bool char byte short int long float double unsigned singned
syn match jceConstant "\s\+\(\([A-Z]\{2,}\)\|\(\([A-Z]\{2,}\)_\([A-z]\{1,}\)\)\+\)\s\+"
syn keyword jceStructure struct enum interface
syn keyword jceRequire require
syn keyword jceOptional optional
syn match jceNumber "\s\+\<\d\+\>\s\+"
syn match jceIn "\(\s\+\)\<in\>\s\+"
syn match jceIn "\((\|,\)\<in\>\s\+"ms=s+1
syn match jceOut "\(\s\+\)\<out\>\s\+"
syn match jceOut "\((\|,\)\<out\>\s\+"ms=s+1
syn match jceFoldInclude "\"\(/.*/.*\)*\""
syn match jceSpecialCharError contained "[^']"
syn match jceSpecialChar	 contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region jceString start=+"+ end=+"+ end=+$+ contains=jceSpecialChar,jceSpecialError
syn keyword jceStlType vector map queue hash hash_map priority_queue rope iterator multimap set multiset string
syn region jceComment start="/\*" end="\*/"
syn match jceLineComment "//.*" 

JceHiLink jceInclude            Include
JceHiLink jceModule             Statement 
JceHiLink jceStructure          Structure
JceHiLink jceType               Type
JceHiLink jceConstant           Constant
JceHiLink jceComment            Comment
JceHiLink jceLineComment        Comment
JceHiLink jceFoldInclude        String
JceHiLink jceNumber             Number
JceHiLink jceIn                 Type
JceHiLink jceOut                Repeat 
JceHiLink jceRequire           Special
JceHiLink jceOptional           Repeat
JceHiLink jceString             String
JceHiLink jceStlType            String

delcommand JceHiLink

let b:current_syntax = "jce"

if main_syntax == 'jce'
    unlet main_syntax
endif

let b:splell_options="contained"



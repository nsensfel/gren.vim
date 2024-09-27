" Vim syntax file
" Language: Gren
" Maintainer: magenta <mag@blazma.st>
" Original Author: Joseph Hager <ajhager@gmail.com>
" Copyright: Joseph Hager <ajhager@gmail.com>
" License: BSD3
" Latest Revision: 2024-09-27

if exists('b:current_syntax')
  finish
endif

" Keywords
syn keyword grenConditional else if of then case
syn keyword grenAlias alias
syn keyword grenTypedef contained type port
syn keyword grenImport exposing as import module where

" Operators
" gren/core
syn match grenOperator contained "\(<|\||>\|||\|&&\|==\|/=\|<=\|>=\|++\|::\|+\|-\|*\|/\|//\|^\|<>\|>>\|<<\|<\|>\|%\)"
" gren/parser
syn match grenOperator contained "\(|.\||=\)"
" gren/url
syn match grenOperator contained "\(</>\|<?>\)"

" Types
syn match grenType "\<[A-Z][0-9A-Za-z_-]*"
syn keyword grenNumberType number

" Modules
syn match grenModule "\<\([A-Z][0-9A-Za-z_'-\.]*\)\+\.[A-Za-z]"me=e-2
syn match grenModule "^\(module\|import\)\s\+[A-Z][0-9A-Za-z_'-\.]*\(\s\+as\s\+[A-Z][0-9A-Za-z_'-\.]*\)\?\(\s\+exposing\)\?" contains=grenImport

" Delimiters
syn match grenDelimiter  "[,;]"
syn match grenBraces  "[()[\]{}]"

" Functions
syn match grenTupleFunction "\((,\+)\)"

" Comments
syn keyword grenTodo TODO FIXME XXX contained
syn match grenLineComment "--.*" contains=grenTodo,@spell
syn region grenComment matchgroup=grenComment start="{-|\=" end="-}" contains=grenTodo,grenComment,@spell fold

" Strings
syn match grenStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match grenStringEscape "\\[nrfvbt\\\"]" contained
syn region grenString start="\"" skip="\\\"" end="\"" contains=grenStringEscape,@spell
syn region grenTripleString start="\"\"\"" skip="\\\"" end="\"\"\"" contains=grenStringEscape,@spell
syn match grenChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" Lambda
syn region grenLambdaFunc start="\\"hs=s+1 end="->"he=e-2

" Debug
syn match grenDebug "Debug.\(log\|todo\|toString\)"

" Numbers
syn match grenInt "-\?\<\d\+\>"
syn match grenFloat "-\?\(\<\d\+\.\d\+\>\)"

" Identifiers
syn match grenTopLevelDecl "^\s*[a-zA-Z][a-zA-z0-9_]*\('\)*\s\+:\(\r\n\|\r\|\n\|\s\)\+" contains=grenOperator
syn match grenFuncName /^\l\w*/

" Folding
syn region grenTopLevelTypedef start="type" end="\n\(\n\n\)\@=" contains=ALL fold
syn region grenTopLevelFunction start="^[a-zA-Z].\+\n[a-zA-Z].\+=" end="^\(\n\+\)\@=" contains=ALL fold
syn region grenCaseBlock matchgroup=grenCaseBlockDefinition start="^\z\(\s\+\)\<case\>" end="^\z1\@!\W\@=" end="\(\n\n\z1\@!\)\@=" end="\n\z1\@!\(\n\n\)\@=" contains=ALL fold
syn region grenCaseItemBlock start="^\z\(\s\+\).\+->$" end="^\z1\@!\W\@=" end="\(\n\n\z1\@!\)\@=" end="\(\n\z1\S\)\@=" contains=ALL fold
syn region grenLetBlock matchgroup=grenLetBlockDefinition start="\<let\>" end="\<in\>" contains=ALL fold

hi def link grenFuncName Function
hi def link grenCaseBlockDefinition Conditional
hi def link grenCaseBlockItemDefinition Conditional
hi def link grenLetBlockDefinition TypeDef
hi def link grenTopLevelDecl Function
hi def link grenTupleFunction Normal
hi def link grenTodo Todo
hi def link grenComment Comment
hi def link grenLineComment Comment
hi def link grenString String
hi def link grenTripleString String
hi def link grenChar String
hi def link grenStringEscape Special
hi def link grenInt Number
hi def link grenFloat Float
hi def link grenDelimiter Delimiter
hi def link grenBraces Delimiter
hi def link grenTypedef TypeDef
hi def link grenImport Include
hi def link grenConditional Conditional
hi def link grenAlias Delimiter
hi def link grenOperator Operator
hi def link grenType Type
hi def link grenNumberType Identifier
hi def link grenLambdaFunc Function
hi def link grenDebug Debug
hi def link grenModule Type

syn sync minlines=500

let b:current_syntax = 'gren'

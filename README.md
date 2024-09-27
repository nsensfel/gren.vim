# gren.vim

A (very basic) Vim plugin for [the Gren programming language](https://gren-lang.org/).
Just install it with your favourite plugin manager or copy the files manually (there's just two of them) and you should have `.gren`-file detection and some basic syntax highlighting, courtesy of the `syntax/elm.vim`-file, which I just modified slightly.

Hopefully I'll have time and energy to spend some more time fleshing this out, because Gren seems amazing, but I've barely gotten to touch the language for  𝒓 𝒆 𝒂 𝒔 𝒐 𝒏 𝒔~*, but this takes one hurdle away at least :3


## h4x
iiif you wanna hack `gren format` into [ALE](nope i wont link to m$-site, sorry) - say, because you're mid learning [Nix](https://nix.dev/) and can't be bothered to figure out all the _New and Cool_ Neovim formatting plugins - here's a snippet to add to your `vimrc`:

```vimscript
function! GrenFormat(buffer) abort
  return { 'command': 'gren format --stdin' }
endfunction

execute ale#fix#registry#Add('gren format', 'GrenFormat', ['gren'], 'grens builtin formatter', ['gren-format'])
```

Then you can add it to e.g. `let g:ale_fixers` as either `gren format` or, if you're not a fan of whitespace, `gren-format`.

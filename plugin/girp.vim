function! s:init()
    command! -nargs=+ Girp :call girp#Girp(<f-args>)
    command! GirpCurrentWord :call girp#GirpCurrentWord()
endfunction

call s:init()

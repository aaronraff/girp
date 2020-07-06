function! s:init()
    command! -nargs=+ Girp :call girp#Girp(<f-args>)
endfunction

call s:init()

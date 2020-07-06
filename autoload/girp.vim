function! girp#Girp(...)
    let args = ""
    for arg in a:000
        let args = args . " " . arg
    endfor

    let findings =  systemlist("git grep -n " . args)
    let res = []

    for finding in findings
        let fields = split(finding, ":")
        let info = {
            \ "filename": fields[0],
            \ "lnum": fields[1],
            \ "text": fields[2],
        \ }

        call add(res, info)
    endfor

    call setqflist(res, "r")
    execute "copen"
endfunction 

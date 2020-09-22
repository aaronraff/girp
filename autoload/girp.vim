" Some results may look have ':'s in them. If so, they will be split up and
" need to be joined back together.
function! girp#concatFoundLine(elts)
    let res = ""
    for e in a:elts
        if res == ""
            " Don't add in the colon or else we end up with an extra one
            " at the beginning of the line
            let res = e
        else
            let res = res . ":" . e
        endif
    endfor
    
    return res
endfunction

function! girp#gatherGrepResults(args)
    let findings = systemlist("git grep -n " . a:args)
    let res = []

    for finding in findings
        let fields = split(finding, ":")
        let info = {
            \ "filename": fields[0],
            \ "lnum": fields[1],
            \ "text": girp#concatFoundLine(fields[2:]),
        \ }

        call add(res, info)
    endfor

    return res
endfunction

function! girp#populateAndOpenQuickfix(list)
    call setqflist(a:list, "r")
    execute "copen"
endfunction

function! girp#Girp(...)
    let args = ""
    for arg in a:000
        let args = args . " " . arg
    endfor

    let findings = girp#gatherGrepResults(args)
    call girp#populateAndOpenQuickfix(findings)
endfunction 

function! girp#GirpCurrentWord()
    let currentWord = expand("<cword>")
    let findings = girp#gatherGrepResults(currentWord)
    call girp#populateAndOpenQuickfix(findings)
endfunction

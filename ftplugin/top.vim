if exists("b:loaded_top_plugin")
  finish
endif
let b:loaded_top_plugin = 1

let b:current_file=fnamemodify(expand("<sfile>"), ":h")."/top.dict"
echomsg b:current_file
execute "setlocal dictionary+=".b:current_file
setlocal complete+=k

function! WhatSection()
    let regexp = '^[ \t]*\[ *\zs[a-z]\+\ze *\]'
    let pos = getpos(".")
    call cursor(pos[1]+1, 1)
    let res = search(regexp, "bnW")
    let section = matchstr(getline(res), regexp)
    call cursor(pos[1:3])
    let headlines = {
        \'angles':';  ai    aj    ak funct           c0     c1',
        \'angles':'; i     j       k       funct   angle   force_constant',
        \'angletypes':'; i    j    k func       th0         cth',
        \'angletypes':'; i	j	k	func	th0	cth	ub0	cub',
        \'angletypes':'  ; i    j    k func       tHC         cth',
        \'atoms':'; id	at type		res nr 	residu name	at name  cg nr	charge',
        \'atomtypes':';name   atnr     mass      charge   ptype       c6   c12',
        \'atomtypes':';name	at.num	mass	charge	ptype	sigma	epsilon',
        \'bonds':';  ai    aj funct           c0           c1',
        \'bonds':'; i     j       funct   length  force_constant',
        \'bondtypes':'; i    j  func       b0          kb',
        \'constraints':';  ai    aj funct         dist',
        \'defaults':'; nbfunc	comb-rule	gen-pairs	fudgeLJ	fudgeQQ',
        \'dihedrals':' ;   ai    aj    ak    al funct  definition',
        \'dihedraltypes':';i  j   k  l	 func	C0  ...  C5',
        \'dihedraltypes':';i  j   k  l	 func      phase      kd      pn',
        \'dihedraltypes':'; i	j	k	l	func	phi0	cp	mult',
        \'dihedraltypes':'; i	j	k	l	func	q0	cq',
        \'exclusions':'; iatom excluded from interaction with i',
        \'moleculetype':'; molname      nrexcl',
        \'nonbond_params':'; i    j func          c6           c12',
        \'pairs':';  ai    aj funct           c0           c1',
        \'pairtypes':'; i    j func          c6           c12',
        \'position_restraints':'; iatom type	fx	fy	fz',
        \'settles':'; i     funct   doh     dhh',
        \'virtual_sites3':'; Vsite from			funct	a		b',
        \}
    if (has_key(headlines, section))
        echomsg headlines[section]
    endif
endfunction

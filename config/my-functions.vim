function MySave()
	call MyAutoformat()
    " update
	echo 'updated, current time is ' . strftime('%c')
endfunction

function MyAutoformat()
	echo "autoformat"
endfunction
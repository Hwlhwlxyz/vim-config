function MySave()
	call MyAutoformat()
    " update
	"echow 'echow information'
	echo 'updated, current time is ' . strftime('%c')
endfunction

function MyAutoformat()
	echo "autoformat"
endfunction
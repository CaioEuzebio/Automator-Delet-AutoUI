on run {input, parameters}
	-- Press ⌘V
	delay 0.191293
	set timeoutSeconds to 2.0
	set uiScript to "keystroke \"v\" using command down"
	my doWithTimeout(uiScript, timeoutSeconds)
	
	-- Press ⌥
	delay 0.247519
	set timeoutSeconds to 2.0
	set uiScript to "keystroke \"\" using option down"
	my doWithTimeout(uiScript, timeoutSeconds)
	
	-- Type 'y'
	delay 1.147629
	set timeoutSeconds to 2.0
	set uiScript to "keystroke \"y\""
	my doWithTimeout(uiScript, timeoutSeconds)
	
	-- Press Return
	delay 0.888833
	set timeoutSeconds to 2.0
	set uiScript to "keystroke \"
\" "
	my doWithTimeout(uiScript, timeoutSeconds)
	return input
end run

on doWithTimeout(uiScript, timeoutSeconds)
	set endDate to (current date) + timeoutSeconds
	repeat
		try
			run script "tell application \"System Events\"
" & uiScript & "
end tell"
			exit repeat
		on error errorMessage
			if ((current date) > endDate) then
				error "Can not " & uiScript
			end if
		end try
	end repeat
end doWithTimeout

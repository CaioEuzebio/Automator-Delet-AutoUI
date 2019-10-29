on run {input, parameters}
	-- Type ''
	delay 1.437367
	set timeoutSeconds to 2.0
	set uiScript to "keystroke \"\""
	my doWithTimeout(uiScript, timeoutSeconds)
	
	-- Press ⌘C
	delay 0.517464
	set timeoutSeconds to 2.0
	set uiScript to "keystroke \"c\" using command down"
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

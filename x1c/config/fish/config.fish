if status is-interactive
    # Commands to run in interactive sessions can go here

    # start X at login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
	exec startx -- -keeptty
    end
end

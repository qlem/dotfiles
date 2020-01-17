# Start X at login
if status is-interactive 
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
    if test -z "$TMUX"
        set id (tmux ls | grep -vm1 attached | cut -d: -f1)
        if test -z "$id"
            tmux new-session
        else
            tmux attach-session -t "$ID"
        end
    end
end

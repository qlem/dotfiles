# start X at login
if status is-interactive 
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# start tmux
if status is-interactive
    if test -z "$TMUX"
        set id (tmux ls | grep -vm1 attached | cut -d: -f1)
        if test -z "$id"
            tmux new-session -s "main"
            if test $status -ne 0
                set -xU TMUX_COUNT (math $TMUX_COUNT + 1) 
                tmux new-session -s "$TMUX_COUNT"
            end
        else
            tmux attach-session -t "$id"
        end
    end
end

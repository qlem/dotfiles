# Defined in - @ line 0
function pacf --description 'List foreign packages'
	pacman -Qm $argv
end

# Defined in - @ line 0
function pacl --description 'List explicitly installed packages'
	pacman -Qe $argv
end

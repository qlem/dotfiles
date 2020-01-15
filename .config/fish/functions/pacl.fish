# Defined in - @ line 0
function pacl --description 'List packages explicitly installed'
	pacman -Qet $argv
end

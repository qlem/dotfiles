# Defined in - @ line 0
function pacr --description 'Remove package'
	sudo pacman -Rs $argv
end

# Defined in - @ line 0
function pacc --description 'Clean cached packages'
	sudo pacman -Sc $argv
end

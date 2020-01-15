# Defined in - @ line 0
function pacu --description 'Upgrade packages'
	sudo pacman -Syu $argv
end

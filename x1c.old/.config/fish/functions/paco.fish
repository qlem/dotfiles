# Defined in - @ line 0
function paco --description 'List orphans packages'
	pacman -Qdt $argv
end

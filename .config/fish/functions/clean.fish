# Defined in - @ line 0
function clean --description 'Remove *~ #*# files'
	find . -type f -name "*~" -delete -o -type f -name "#*#" -delete $argv
end

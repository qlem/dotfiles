# Defined in - @ line 0
function listp --description 'List listening TCP sockets'
	ss -nrlpt $argv
end

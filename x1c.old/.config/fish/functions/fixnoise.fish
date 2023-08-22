# Defined in - @ line 0
function fixnoise --description 'Fix noise through headphone'
	sudo hda-verb /dev/snd/hwC0D0 0x1d SET_PIN_WIDGET_CONTROL 0x0
end

# Defined in - @ line 0
function startemu --description 'Start android emulator'
    emulator -avd emu -accel on -gpu host -memory 2048 -no-boot-anim $argv
end

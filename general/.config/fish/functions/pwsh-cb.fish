# Defined via `source`
function pwsh-cb --wraps='powershell.exe' --description 'alias pwsh-cb powershell.exe -Command Get-Clipboard'
    powershell.exe -Command Get-Clipboard $argv; 
end

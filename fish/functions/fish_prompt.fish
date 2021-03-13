# Defined in /Users/jason/.config/initial.fish @ line 40
function fish_prompt
 printf "[%s:%s]%% " (hostname -s) (basename $PWD); 
end

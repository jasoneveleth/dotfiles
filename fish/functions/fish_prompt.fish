function fish_prompt
    set -l suffix
    if functions -q fish_is_root_user; and fish_is_root_user
        set suffix '#'
    else
        set suffix '>'
    end
    printf "[%s:%s]$suffix " (prompt_hostname) (basename (prompt_pwd))
end

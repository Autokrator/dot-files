function fish_prompt --description 'Write out the prompt'
    if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (set_color yellow)(hostname|cut -d . -f 1)
    set fish_color_cwd brcyan
    end

    if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color brred)"⮁ "(set_color normal)
    end

    if not set -q __git_cb
    set __git_cb (set_color bryellow)"« "(set_color brred)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color bryellow)" » "(set_color normal)
    end

    switch $USER

    case root

    if not set -q __fish_prompt_cwd
        if set -q fish_color_cwd_root
            set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        else
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
    end

    printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

    case '*'

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    if not set -q SSH_CLIENT
    printf '\n%s%s %s%s' "$__fish_prompt_cwd" (prompt_pwd) "$__git_cb" "$__fish_prompt_normal"
    else
    printf '\n%s %s%s %s%s' "$__fish_prompt_hostname" "$__fish_prompt_cwd" (prompt_pwd)  "$__git_cb" "$__fish_prompt_normal"
    end

    end
end

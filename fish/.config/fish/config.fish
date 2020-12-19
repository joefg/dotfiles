# Non-interactive users (sshy, sync)
if not status --is-interactive
    exit # Skips the rest of this file, not exiting the shell
end

if test -e ~/.config/fish/aliases.fish
    . ~/.config/fish/aliases.fish
end

if test -e ~/.private_aliases.fish
    . ~/.private_aliases.fish
end

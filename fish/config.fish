function fish_prompt -d "Write out the prompt"
	# This shows up as USER@HOST /home/user/ >, with the directory colored
	# $USER and $hostname are set by fish, so you can just use them
	# instead of using `whoami` and `hostname`
	printf '%s@%s %s%s%s > ' neida archwork \
		(set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

fish_add_path $HOME/.local/share/nvim/mason/bin $HOME/bin /usr/local/bin $HOME/go/bin/

set -g fish_autosuggestion_enabled 0
set -g fish_sequence_key_delay_ms 200
set -g fish_key_bindings fish_vi_key_bindings

set -x MANPATH "/usr/local/man:$MANPATH"
set -x EDITOR "nvim"
set -x OLLAMA_MODELS "/home/ncarob/.ollama/"

if status is-interactive # Commands to run in interactive sessions can go here
	# No greeting
	set fish_greeting

	# Use starship
	starship init fish | source
	if not set -q TMUX
		if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
			cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
		end
	end

	# Aliases
	alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
	alias celar "printf '\033[2J\033[3J\033[1;1H'"
	alias claer "printf '\033[2J\033[3J\033[1;1H'"
	alias ls "eza --icons"
	alias pamcan pacman
	alias q "qs -c ii"
	alias neofetch fastfetch
	alias wgu "sudo awg-quick up $HOME/.config/amnezia/archdev.conf"
	alias wgd "sudo awg-quick down $HOME/.config/amnezia/archdev.conf"
	alias vpu "sudo vipnetclient --psw 'yfp,tkbphuec' start && sleep 1 && sudo resolvectl dns tun0 10.11.36.11 10.11.36.31"
	alias vpd "sudo vipnetclient --psw 'yfp,tkbphuec' stop"
	alias vim="nvim"

	function __cancel_and_save_to_killring
		set -l buf (commandline -b)

		if test -n "$buf"
			commandline -f kill-whole-line
			commandline -r -- $buf
		end

		commandline -f cancel-commandline
	end

	function fish_user_key_bindings
		bind -M insert \cp up-or-search
		bind -M insert \cn down-or-search
		bind -M default \cp up-or-search
		bind -M default \cn down-or-search
		bind -M insert \cl complete
		bind -M insert \cc __cancel_and_save_to_killring
		bind -M visual \cc __cancel_and_save_to_killring
		bind -M replace \cc __cancel_and_save_to_killring
		bind -M insert -m default j,k repaint-mode
		bind -M visual -m default j,k repaint-mode
		bind -M replace -m default j,k repaint-mode

	end
	if test (tty) = "/dev/tty1"
		exec start-hyprland
	end
end

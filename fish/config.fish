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
# bind -M insert \cc kill-whole-line repaint

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

  function fish_user_key_bindings
    bind -M insert \ck up-or-search
    bind -M insert \cj down-or-search
    bind -M insert \cl complete
    bind -M insert -m default j,k cancel repaint-mode
    bind -M visual -m default j,k cancel repaint-mode

    # make vi mode yanks copy to clipboard
    bind yy kill-whole-line yank_to_clipboard yank
    bind Y kill-whole-line yank_to_clipboard yank
    bind y,\$ kill-line yank_to_clipboard yank
    bind y,\^ backward-kill-line yank_to_clipboard yank
    bind y,0 backward-kill-line yank_to_clipboard yank
    bind y,w kill-word yank_to_clipboard yank
    bind y,W kill-bigword yank_to_clipboard yank
    bind y,i,w forward-single-char forward-single-char backward-word kill-word yank_to_clipboard yank
    bind y,i,W forward-single-char forward-single-char backward-bigword kill-bigword yank_to_clipboard yank
    bind y,a,w forward-single-char forward-single-char backward-word kill-word yank_to_clipboard yank
    bind y,a,W forward-single-char forward-single-char backward-bigword kill-bigword yank_to_clipboard yank
    bind y,e kill-word yank_to_clipboard yank
    bind y,E kill-bigword yank_to_clipboard yank
    bind y,b backward-kill-word yank_to_clipboard yank
    bind y,B backward-kill-bigword yank_to_clipboard yank
    bind y,g,e backward-kill-word yank_to_clipboard yank
    bind y,g,E backward-kill-bigword yank_to_clipboard yank
    bind y,f begin-selection forward-jump kill-selection yank_to_clipboard yank end-selection
    bind y,t begin-selection forward-jump-till kill-selection yank_to_clipboard yank end-selection
    bind y,F begin-selection backward-jump kill-selection yank_to_clipboard yank end-selection
    bind y,T begin-selection backward-jump-till kill-selection yank_to_clipboard yank end-selection
    bind y,h backward-char begin-selection kill-selection yank_to_clipboard yank end-selection
    bind y,l begin-selection kill-selection yank_to_clipboard yank end-selection
    bind y,i,b jump-till-matching-bracket and jump-till-matching-bracket and begin-selection jump-till-matching-bracket kill-selection yank_to_clipboard yank end-selection
    bind y,a,b jump-to-matching-bracket and jump-to-matching-bracket and begin-selection jump-to-matching-bracket kill-selection yank_to_clipboard yank end-selection
    bind y,i backward-jump-till and repeat-jump-reverse and begin-selection repeat-jump kill-selection yank_to_clipboard yank end-selection
    bind y,a backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection yank_to_clipboard yank end-selection
    bind -M visual -m default y kill-selection yank_to_clipboard yank end-selection repaint-mode
    
    # use system clipboard for vi mode pastes
    bind -s p 'set -g fish_cursor_end_mode exclusive' forward-char 'set -g fish_cursor_end_mode inclusive' fish_clipboard_paste
    bind -s P fish_clipboard_paste

  end
  if test (tty) = "/dev/tty1"
    exec start-hyprland
  end
end

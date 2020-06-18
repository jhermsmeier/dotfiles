# name: Classic + Vcs
# author: Lily Ballard

function fish_prompt --description 'Write out the prompt'

  set -l last_pipestatus $pipestatus
  set -l normal (set_color normal)
  set -l color_cwd $fish_color_cwd
  set -l suffix ' >'
  set -l date (set_color 696969)'['(date "+%H:%M:%S")']'

  # Color the prompt differently when we're root
  if contains -- $USER root toor
    if set -q fish_color_cwd_root
      set color_cwd $fish_color_cwd_root
    end
    set suffix '#'
  end

  # If we're running via SSH, change the host color.
  set -l color_host $fish_color_host
  if set -q SSH_TTY
    set color_host $fish_color_host_remote
  end

  # if set -q NODE_VERSION
  #   set node_version (set_color 339933) '⬡ ' (set_color 66cc33) $NODE_VERSION
  # end

  # if set -q VIRTUAL_ENV
  #   set -l python (set_color blue) '(⺒' (basename "$VIRTUAL_ENV") ')'
  # end

  # Write pipestatus
  set -l prompt_status (__fish_print_pipestatus ' [' ']' '|' (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)
  echo -e -n -s "\n" $date ' ' (set_color $color_cwd) (prompt_pwd) (fish_vcs_prompt) $normal $prompt_status (set_color $color_host) $suffix ' '

end

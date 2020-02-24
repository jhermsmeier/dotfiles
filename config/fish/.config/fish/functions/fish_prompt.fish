function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# Time
	set_color 696969
  printf '\n[%s] ' (date "+%H:%M:%S")
  set_color normal
  # printf '\n'

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)

	if set -q VIRTUAL_ENV
    echo -n -s " " (set_color blue) "(python:" (basename "$VIRTUAL_ENV") ")" (set_color normal) ""
	end

	set_color normal
	echo -n -s (__fish_git_prompt) " "
	set_color normal

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

  printf '\n'
	echo -n ' > '
	set_color normal

end

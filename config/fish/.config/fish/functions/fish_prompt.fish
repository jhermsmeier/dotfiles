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
	
	set -l ruby_version (rbenv version-name 2>&1 /dev/null)
	set -l ruby_status $status
	if test $ruby_status -eq 0
    switch $ruby_version;
      case 'system';
      case '*';
      	echo -n -s " " (set_color red) "(ruby:" $ruby_version ")" (set_color normal) ""
    end
	end
	
	set_color normal
	echo -n -s (__fish_git_prompt) " "
	set_color normal
	
	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	echo -n '$ '
	set_color normal

end

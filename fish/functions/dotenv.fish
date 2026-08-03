function dotenv --description 'Load KEY=value pairs from a .env file into the environment'
	set -l file (test -n "$argv[1]"; and echo $argv[1]; or echo .env)

	if not test -f $file
		echo "dotenv: no such file: $file" >&2
		return 1
	end

	for line in (string match -rv -r '^\s*(#|$)' < $file)
		set -gx (string split -m 1 '=' -- (string trim -- $line | string replace -r '\r$' ''))
	end
end

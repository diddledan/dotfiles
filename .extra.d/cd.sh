export CDPATH=".:/data:$BANGDIR:$HOME"

function cd {
	builtin cd "$@" > /dev/null
}
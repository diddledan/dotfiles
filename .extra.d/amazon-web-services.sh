AWSDIR="$HOME/Private/AWS"
export BANG_AWS_CREDENTIAL_FILE="$AWSDIR/bang-aws.creds"
export MINE_AWS_CREDENTIAL_FILE="$AWSDIR/my-aws.creds"
export BOWLHAT_AWS_CREDENTIAL_FILE="$AWSDIR/bowlhat-aws.creds"

aws() {
	if [ -z "$1" ]; then
		echo Usage: aws [creds_name] [further aws opts as below]
		/usr/local/bin/aws
		return $?
	fi

	creds="$(echo "$1" | tr [a-z] [A-Z])"
	creds="${creds}_AWS_CREDENTIAL_FILE"
	shift

	export AWS_CREDENTIAL_FILE="${!creds}"

	/usr/local/bin/aws $@
}


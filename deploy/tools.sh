
GREEN="\e[32;1m"
NORMAL="\\033[0;39m"
RED="\\033[0;41;1m"
WHITE="\e[1m"
IGREEN="\e[42m"
IRED="\e[101m"
IWHITE="\e[107m"

function error {
  echo -e "$IRED" "$NORMAL" "$RED"$1"$NORMAL"
}

function info {
  echo -e "$IWHITE" "$NORMAL" "$WHITE"$1"$NORMAL"
}

function debug {
  #echo -e "$WHITE" "$NORMAL" "$WHITE"$1"$NORMAL"
  echo "  $1"
}

function success {
  echo -e "$IGREEN" "$NORMAL" "$GREEN"$1"$NORMAL"
}

function exit_success {
  message=$1
  
  echo
  success
  success "Success $message"
  success
  echo

	exit 0
}

function exit_failure {
  message=$1

  echo
  error
  error "Failure $message"
  error
  echo


  exit 2
}


#------------------------------------------------------------------------------
function checkSuccess {
  message=$2

	if [ $1 -gt 0 ]; then
		exit_failure $message
	fi

}

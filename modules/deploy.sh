
deploy_main() {
	USER=`whoami`
	ROOT="/home/$USER/src/github.com"

	if [ -d "$ROOT/penlook/deploy" ]
	then
		ROOT_DEPLOY="$ROOT/penlook"
	else
		ROOT_DEPLOY="/tmp"
		cd $ROOT_DEPLOY
		penlook clone deploy
	fi

	deploy_run $ROOT_DEPLOY
}

deploy_run() {
	echo "START DEPLOY"
}


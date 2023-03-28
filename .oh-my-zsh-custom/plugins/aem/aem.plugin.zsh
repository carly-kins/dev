REPO="$HOME/Repositories"

function aem() {
  PROJECT="$1"
  INPUT="$2"
  case ${INPUT} in
  directory)
    cd $REPO/{$PROJECT}-author/crx-quickstart #make sure we are in the project-author repo
    ;;
  start)
    bin/start #start the server 
    ;;
  logs)
    tail -f logs/error.log #open logs
    ;;
  stop)
    bin/stop #stop the server
    ;;
  *)
    echo "
    ERROR: Command not found 

    Syntax: aem PROJECT COMMAND
        
    Avaliable Commands:
    directory        get to aem author directory
    start            start the aem server
    logs             show logs
    stop             stop the aem server
    "
    ;;
  esac
}






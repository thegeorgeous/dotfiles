at=~/Workspace/accesstype
aw=~/Workspace/accesstype-worker
mt=~/Workspace/metype
sketches=~/Workspace/sketches

alias start_mock_server='mockserver -serverPort 1080'

cherry-pick() {
    mkdir -p tmp;
    git log master --grep=$1 --pretty=%h --no-merges > tmp/cherry-pick.txt;
    output=$(cat tmp/cherry-pick.txt | sed 's/:.*//');
    for string in $output
    do
      git cherry-pick $(echo $string) --strategy=recursive -X theirs;
    done
    rm tmp/cherry-pick.txt;
}

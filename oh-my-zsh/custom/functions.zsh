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

mcd() {
  mkdir $1
  cd $1
}

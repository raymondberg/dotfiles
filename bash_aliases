
alias cd.="cd .."
alias cd2.="cd ../.."
alias cd3.="cd ../../.."
alias cd4.="cd ../../../.."
alias cd5.="cd ../../../../.."
alias cd6.="cd ../../../../../.."

bmux_start () {
  if [[ -n $1 ]]; then
    tmux -S /tmp/$1 new-session -s $1 -d 
    chmod 777 /tmp/$1
    tmux -S /tmp/$1 attach -t $1
  else
    echo "Please specify the name of a tmux to start"
  fi
}

bmux_list () {
  ps -o ruser,command -ax | grep '[n]ew-session -s' | ruby -ne '$_ =~ /^(\w+).*-s (\w+)/; puts "#{$1} started #{$2}"'
}

alias bmux-start="bmux_start"
alias bmuxs="bmux_start"
alias bmux-list="bmux_list"
alias bmuxl="bmux_list"

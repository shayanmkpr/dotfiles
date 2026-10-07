set -o vi

gadd() {
    git add . -- ':!*notes.md :!*.pdf'
}

alias gerami-stage='ssh root@gerami-stage'
alias asam-proxy='ssh -D 1080 -f -C -N root@100.89.45.48'

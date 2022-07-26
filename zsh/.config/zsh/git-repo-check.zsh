for n in ~/src/* ~/dotfiles ~/notes ~/.root/MATLAB; do
    (cd $n; [ -d .git ] && [ -n "$(git status -s)" ] && echo "unsaved changes: $n")
done


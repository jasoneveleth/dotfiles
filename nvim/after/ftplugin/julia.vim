setlocal commentstring=#\ %s
setlocal makeprg=julia\ --load\ %\ -e\ \"main($2)\"

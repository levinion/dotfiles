function fast_push
    git add .
    git commit -m "$argv"
    git push origin main
end

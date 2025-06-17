function fastpush
    git add .
    git commit -m "$argv"
    git push origin main
end

(eval-after-load "grep"
  '(progn
    (add-to-list 'grep-find-ignored-files "*.tmp")
    (add-to-list 'grep-find-ignored-directories "*/node_modules")))

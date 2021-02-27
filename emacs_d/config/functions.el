;;; load spec file for current buffer
(defun load-spec (specfile)
  "Load the spec file for the current buffer"
  (interactive
   (list (completing-read "Load spec: ")))
  (load specfile)
)

(defun sort-lines-nocase ()
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

(defun convert-hashrockets ()
  "Replace ruby hashrockets with new hash syntax"
  (interactive)
  (goto-char 1)
  (while (search-forward-regexp ":\\([-_A-Za-z0-9]+\\)[[:space:]]=>" nil t)
    (replace-match ( concat (match-string 1) ":") t nil )))

(defun insert-double-quotes ()
  "Inserts quotes (\") around the current region or work."
  (interactive)
  (let (start end bounds)
    (if (and transient-mark-mode mark-active)
        (setq start (region-beginning)
              end (region-end))
      (progn
        (setq bounds (bounds-of-thing-at-point 'symbol))
        (setq start (car bounds)
              end (cdr bounds))))
    (goto-char start)
    (insert "\"")
    (goto-char (+ end 1))
    (insert "\"")))

(defun insert-single-quotes ()
  "Inserts single quotes (\') around the current region or work."
  (interactive)
  (let (start end bounds)
    (if (and transient-mark-mode mark-active)
        (setq start (region-beginning)
              end (region-end))
      (progn
        (setq bounds (bounds-of-thing-at-point 'symbol))
        (setq start (car bounds)
              end (cdr bounds))))
    (goto-char start)
    (insert "'")
    (goto-char (+ end 1))
    (insert "'")))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width 120))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
                 (cons 'height (/ (- (x-display-pixel-height) 250) (frame-char-height))))
    (add-to-list 'default-frame-alist
                 (cons 'top 50))
    )))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
      (if (equal 'fullboth current-value)
        (if (boundp 'old-fullscreen) old-fullscreen nil)
        (progn (setq old-fullscreen current-value)
          'fullboth)))))

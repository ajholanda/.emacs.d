;; http://pragmaticemacs.com/emacs/how-i-view-my-google-calendar-agenda-in-emacs/
(defun ajh/open-gcal-agenda ()
  "Open my google calendar agenda file. The agenda is displayed in the buffer *gcal*."
 (interactive)
 ;; set name of calendar buffer and location of file containing my agenda
 (let ((tmp-buff-name "*gcal*") (cal-file (expand-file-name "~/.emacs.d/gcal")))
 ;; switch to calendar buffer
 (switch-to-buffer tmp-buff-name)
 ;; turn off read only to overwrite if buffer exists
 (read-only-mode -1)
 ;; clear buffer
 (erase-buffer)
 ;; insert agenda file
 (insert-file-contents cal-file)
 ;; turn on colours
 (display-ansi-colors)
 ;; turn on special mode
 (special-mode)
 ;; turn off line wrapping
 (visual-line-mode -1)))

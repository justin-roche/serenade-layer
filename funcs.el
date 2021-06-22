
(defun serenade--double-line-numbers-on () 
  (global-display-line-numbers-mode +1) 
  (global-nlinum-mode +1) 
  (global-nlinum-relative-mode -1))

(defun serenade--double-line-numbers-off () 
  (global-nlinum-relative-mode -1) 
  (global-nlinum-mode -1))

(defun serenade-double-line-numbers-on () 
  (interactive) 
  (serenade--double-line-numbers-on))

(defun serenade-double-line-numbers-off () 
  (interactive) 
  (serenade--double-line-numbers-off))

(defun spacemacs-serenade/serenade-zap-line (n) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "o"))))

(defun spacemacs-serenade/serenade-zap-line (n) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "Vx"))))

(defun spacemacs-serenade/serenade-zap-lines (n n2) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "V")) 
                  (goto-line n2) 
                  (execute-kbd-macro (kbd "d"))))

(defun spacemacs-serenade/serenade-spacer-line (n) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "o"))))

(defun spacemacs-serenade/serenade-borrow-line (n) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "V")) 
                  (execute-kbd-macro (kbd "y"))) 
  (execute-kbd-macro (kbd "p")))

(defun spacemacs-serenade/serenade-borrow-lines (n n2) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "V")) 
                  (goto-line n2) 
                  (execute-kbd-macro (kbd "y"))) 
  (execute-kbd-macro (kbd "p")))

(defun spacemacs-serenade/serenade-steal-line (n) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "V")) 
                  (execute-kbd-macro (kbd "x"))) 
  (execute-kbd-macro (kbd "p")))

(defun spacemacs-serenade/serenade-steal-lines (n n2) 
  (save-excursion (goto-line n) 
                  (execute-kbd-macro (kbd "V")) 
                  (goto-line n2) 
                  (execute-kbd-macro (kbd "x"))) 
  (execute-kbd-macro (kbd "p")))

(defun serenade--helm-insert (arg) 
  (setq unread-command-events (listify-key-sequence arg)))

;;helm commands

(defun  spacemacs-serenade/helm-describe-variable (arg) 
  (serenade--helm-insert arg) 
  (helm-describe-variable))

(defun  spacemacs-serenade/helm-imenu (arg) 
  (serenade--helm-insert arg) 
  (helm-imenu))
(defun spacemacs-serenade/helm-yas-create-snippet-on-region (arg) 
  (serenade--helm-insert arg) 
  ( helm-yas-create-snippet-on-region ))

(defun spacemacs-serenade/helm-project-smart-do-search (arg) 
  (serenade--helm-insert arg) 
  (spacemacs/helm-project-smart-do-search))

(defun spacemacs-serenade/helm-M-x-fuzzy-matching (arg) 
  (serenade--helm-insert arg) 
  (spacemacs/helm-M-x-fuzzy-matching))

(defun spacemacs-serenade/helm-find-files (arg) 
  (serenade--helm-insert arg) 
  (helm-find-files))

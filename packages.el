;;; packages.el --- serenade layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: Justin Roche <justinroche@mail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `serenade-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `serenade/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `serenade/pre-init-PACKAGE' and/or
;;   `serenade/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst serenade-packages 
  '(
    ;; A package recipe
    nlinum nlinum-relative (serenade-mode :location (recipe :fetcher github 
                                                            :repo "justin-roche/serenade-mode"))))
(defun serenade/init-nlinum-relative () 
  (use-package 
    nlinum-relative))

(defun serenade/init-nlinum () 
  (use-package 
    nlinum))

(defun serenade/init-serenade-mode () 
  (use-package 
    serenade-mode 
    :config (serenade-spacemacs-set-defaults)) 
  (if (configuration-layer/package-usedp 'diminish) 
      (diminish 'serenade-mode 
                '(:propertize "Ⓢ" 
                              face 
                              '(:foreground "#CD009600CD00")))))

(defun serenade-spacemacs-set-defaults () 
  (add-hook 'serenade-double-line-numbers-off-hook 'serenade--double-line-numbers-off) 
  (add-hook 'serenade-double-line-numbers-on-hook 'serenade--double-line-numbers-on)
  ;; builtin
  (serenade-global-set-speech '(;;
                                ("close tab" . delete-window  ) 
                                ("continue debug" . nil  ) 
                                ("create tab" . split-window-right-and-focus) 
                                ("debug inline breakpoint" . nil)
                                ("debug step into" . nil  ) 
                                ("debug step over" . nil) 
                                ("debug toggle breakpoint" . nil) 
                                ("go to definition" . spacemacs/jump-to-definition  ) 
                                ("next tab" . next-buffer  ) 
                                ("open file list" . spacemacs-layouts/non-restricted-buffer-list-helm)
                                ("open file" . nil  ) 
                                ("pause debug" . nil  ) 
                                ("previous tab" . previous-buffer) 
                                ("redo" .   serenade--redo ) 
                                ("save"  . save-buffer  ) 
                                ("scroll" . zz-scroll-half-page-down  ) 
                                ("show hover" . nil) 
                                ("start debug" . nil  ) 
                                ("stop debug" . nil  ) 
                                ("style" . nil) 
                                ("switch tab" . nil  ) 
                                ("undo" .   serenade--undo ) 
                                ))

  ;; custom
  (serenade-global-set-speech '(;;
                                ("kill other buffers" . spacemacs/kill-other-buffers) 
                                ("delete window" . delete-window) 
                                ("show messages" . spacemacs/switch-to-messages-buffer) 
                                ("treemacs" . treemacs) 
                                ("save" . save-buffer) 
                                ("next buffer" . next-buffer) 
                                ("previous buffer" . previous-buffer) 
                                ("expand region" . er/expand-region) 
                                ("save all" . save-all) 
                                ("left window" . evil-window-left) 
                                ("right window" . evil-window-right) 
                                ("window down" . evil-window-down) 
                                ("window up" . evil-window-up) 
                                ("delete-buffer" . evil-delete-buffer) 
                                ("new frame" . make-frame) 
                                ("next frame" . ns-next-frame) 
                                (  "swap window" . ace-swap-window) 
                                ("describe variable" . describe-variable) 
                                ("describe key" . describe-key) 
                                ("abort" . keyboard-quit) 
                                ("describe mode" . describe-mode) 
                                ("previous field" . yas-prev-field) 
                                ("next field" . yas-next-field) 
                                ("center" . evil-scroll-line-to-center) 
                                ("visual line mode" . visual-line-mode) 
                                ("golden ratio" . golden-ratio) 
                                ("dotfile" . spacemacs/find-dotfile) 
                                ("list packages" . list-packages) 
                                ("restart emacs" . restart-emacs-resume-layouts) 
                                ("delete other windows" . delete-other-windows) 
                                ("get status" . magit-status) 
                                ("record macro" . evil-record-macro) 
                                ("scratch" . spacemacs/switch-to-scratch-buffer ) 
                                ("last macro" . call-last-kbd-macro) 
                                ("jump to definition" . jump-to-definition) 
                                ("invert" . copy-and-comment-lines-inverse) 
                                ("apropos" . apropos) 
                                ("reload snippets" . yas-reload-all) 
                                ("visit snippets" . yas-visit-snippet-file) 
                                ("query replace" . query-replace) 
                                ("window <n>" . winum-select-window-by-number) 
                                ("transpose expression" . transpose-sexps) 
                                ("describe function" . describe-function) 
                                ("zap line <n>" . spacemacs-serenade/serenade-zap-line) 
                                ("zap lines <n> to <n2>" . spacemacs-serenade/serenade-zap-lines) 
                                ("spacer line <n>" . nil) 
                                ("borrow lines <n> to <n2>" .
                                 spacemacs-serenade/serenade-borrow-lines)
                                ("steal lines <n> to <n2>" .
                                 spacemacs-serenade/serenade-steal-lines)
                                ("steal line <n>" . spacemacs-serenade/serenade-steal-line) 
                                ("borrow line <n>" . spacemacs-serenade/serenade-borrow-line) 
                                ("spacer line <n>" . spacemacs-serenade/serenade-spacer-line))) 
  (serenade-define-speech 'global '(;;
                                    ("registers" . helm-show-kill-ring ) 
                                    ("helm resume" . helm-resume) 
                                    ("find file" . spacemacs-serenade/helm-find-files) 
                                    ("search project" .
                                     spacemacs-serenade/helm-project-smart-do-search )
                                    ("helm" . spacemacs-serenade/helm-M-x-fuzzy-matching) 
                                    ("search functions" . spacemacs-serenade/helm-imenu) 
                                    ("eye menu" . spacemacs-serenade/helm-imenu) 
                                    ("create snippet" .
                                     spacemacs-serenade/helm-yas-create-snippet-on-region)))
  ;;
  (serenade-define-speech 'emacs-lisp '(;;
                                        ("raise" . sp-raise-sexp) 
                                        ("slurp" . sp-forward-slurp-sexp) 
                                        ("barf" . sp-forward-barf-sexp) 
                                        ("delete expression" . sp-kill-sexp) 
                                        ("eval buffer" . evaluate-buffer) 
                                        ("add expression" . insert-sexp-after))) 
  (serenade-define-speech 'org-mode '(;;
                                      ("cycle" . org-global-cycle) 
                                      ("promote" . org-do-promote) 
                                      ("demote" . org-do-demote) 
                                      ("fold" . org-toggle-heading) 
                                      ("parent" . org-up-element))) 
  (serenade-define-speech 'treemacs '(;;
                                      ("parent" . treemacs-goto-parent-node) 
                                      ("focus treemacs" . treemacs-select-window) 
                                      ("toggle" . treemacs-RET-action) 
                                      ("create" . treemacs-create-file) 
                                      ("add project" . treemacs-add-project) 
                                      ("switch workspace" . treemacs-switch-workspace) 
                                      ("new workspace" . treemacs-create-workspace) 
                                      ("create directory" . treemacs-create-dir) 
                                      ("rename" . treemacs-rename) 
                                      ("refresh" . treemacs-refresh))))

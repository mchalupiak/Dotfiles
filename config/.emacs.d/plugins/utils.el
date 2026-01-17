;;; utils.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Michael Chalupiak
;;
;; Author: Michael Chalupiak <mikec@archbox>
;; Maintainer: Michael Chalupiak <mikec@archbox>
;; Created: January 16, 2026
;; Modified: January 16, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/mikec/utils
;; Package-Requires: ((emacs "29.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(use-package surround
  :ensure t
  :defer t
  :bind-keymap ("M-'" . surround-keymap))

(use-package dirvish
  :ensure t
  :defer t
  :init
  (dirvish-peek-mode 1))
;  (dirvish-override-dired-mode 1))

(use-package multiple-cursors
  :ensure t
  :defer t)

(use-package hl-todo
  :ensure t
  :defer t)

(use-package dtrt-indent
  :ensure t
  :defer 5
  :config
  (dtrt-indent-global-mode 1))

(use-package undo-fu
  :ensure t
  :defer 5
  :bind (("C-_" . 'undo-fu-only-undo)
         ("C-/" . 'undo-fu-only-redo)))
(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (undo-fu-session-global-mode))

(use-package blamer
  :ensure t
;  :bind (("s-i" . blamer-show-commit-info)
;         ("C-c i" . blamer-show-posframe-commit-info))
  :defer 10
  :custom
  (blamer-idle-time 0.2)
  (blamer-min-offset 70)
  :config
  (global-blamer-mode 1))

(use-package git-gutter
  :defer 10
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :defer 10
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package visual-replace
  :ensure t
  :defer 5
  :config
  (visual-replace-global-mode 1))
   ;; :bind (("C-c r" . visual-replace)
   ;;        :map isearch-mode-map
   ;;        ("C-c r" . visual-replace-from-isearch)))

(use-package parinfer-rust-mode
  :ensure t
  :defer t
  :hook emacs-lisp-mode
  :config
  (electric-pair-mode -1))

(use-package apheleia
  :ensure t
  :defer t)

(provide 'utils)
;;; utils.el ends here

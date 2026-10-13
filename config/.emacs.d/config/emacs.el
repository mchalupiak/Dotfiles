;;; emacs.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Michael Chalupiak
;;
;; Author: Michael Chalupiak <mikec@archbox>
;; Maintainer: Michael Chalupiak <mikec@archbox>
;; Created: January 15, 2026
;; Modified: January 15, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/mikec/emacs
;; Package-Requires: ((emacs "30.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
(setq url-proxy-services '(("no_proxy" . "localhost")
                           ("http" . "proxygov.ray.com:80")
                           ("https" . "proxygov.ray.com:80")))
;; (require 'misc)
(setopt treesit-enabled-modes t)
(set-face-attribute 'default nil
  :width 'normal :weight 'normal
  :slant 'normal :font (font-spec :family "Iosevka Term SS12" :size 20))
(set-face-attribute 'fixed-pitch nil
  :width 'normal :weight 'normal
  :slant 'normal :font (font-spec :family "Iosevka Term SS12" :size 20))
;; (set-face-attribute 'variable-pitch nil
;;   :width 'normal :weight 'normal
;;   :slant 'normal :font (font-spec :family "Gentium Plus" :size 18))
(defconst default-mode-line-format (copy-sequence mode-line-format))
(setq dired-kill-when-opening-new-dired-buffer t)
(setq gdb-show-main t
      gdb-many-windows t)
(setq elfeed-use-curl nil)
(setq use-short-answers t)
(setq compilation-scroll-output t)
(setq history-length 100
      global-auto-revert-non-file-buffers t
      use-dialog-box nil
      custom-safe-themes t
      make-backup-files nil
      read-file-name-completion-ignore-case t
      tab-always-indent nil
      display-buffer-alist '(
                             ("\\*elfeed-.*\\*" (display-buffer-same-window))))
(setq-default
    indent-tabs-mode nil
    tab-width 4
    tab-stop-list (number-sequence 4 400 4))
(customize-set-variable 'treesit-font-lock-level 4)
(column-number-mode t)
(global-display-line-numbers-mode t)
;(global-display-fill-column-indicator-mode t)
(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(context-menu-mode 1)
(define-globalized-minor-mode global-electric-pair-mode electric-pair-mode
  (lambda () (if (memq 'major-mode
                       '(emacs-lisp-mode common-lisp-mode lisp-mode scheme-mode))
                 (electric-pair-mode 1))))
(define-globalized-minor-mode global-electric-indent-mode electric-indent-mode
  (lambda () (electric-indent-mode 1)))
(global-electric-pair-mode)
(global-electric-indent-mode)
;; (treesit-auto-install-grammar 'ask)
;; (treesit-enabled-modes t)
;; (enable-recursive-minibuffers t)
;; (read-extended-command-predicate #'command-completion-default-include-p)


;; Disable line numbers for some modes
;; (dolist (mode '(org-mode-hook
;;                 eshell-mode-hook))
;;   (add-hook mode (lambda ()
;;                    (display-line-numbers-mode 0)
;;                    (display-fill-column-indicator-mode 0)
;;                    ())))

(provide 'emacs)
;;; emacs.el ends here

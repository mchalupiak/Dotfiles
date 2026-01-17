;;; early-init.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Michael Chalupiak
;;
;; Author: Michael Chalupiak <mikec@archbox>
;; Maintainer: Michael Chalupiak <mikec@archbox>
;; Created: January 15, 2026
;; Modified: January 15, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/mikec/early-init
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(setq gc-cons-threshold (* 50 1000 1000)
      inhibit-startup-message t
      ring-bell-function 'ignore
      package-enable-at-startup nil
      auto-save-default nil
      custom-file (locate-user-emacs-file "config/custom.el"))
;; (load custom-file 'noerror 'nomessage)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (defconst fonts '("Iosevka Term SS12" "Cascadia Code" "CaskaydiaCove Nerd Font"))
;; (defconst default-font-size 16)

;; (defun font-size (font)
;;   (let ((size (plist-get font :size)))
;;     (if size size default-font-size)))
;; (defun font-name (font)
;;   (let ((name (plist-get font :name)))
;;     (if name name font)))

;; (defun font-string (font)
;;   (let ((name (font-name font))
;;         (size (font-size font)))
;;     (concat name " " (number-to-string size))))

;; (defun set-fonts ()
;;   (let ((default-font (car fonts))
;;         (fallback-fonts (cdr fonts)))
;;     ;; (when (window-system)
;;     (progn
;;       (set-face-attribute 'default nil :font (font-string default-font))
;;       (mapc (lambda (font)
;;               (let ((face (font-string font))
;;                     (script (plist-get font :script)))
;;                 (if script
;;                     (progn
;;                       (set-fontset-font t script face)
;;                       (set-fontset-font t script (font-spec :script script) nil 'prepend))
;;                   (set-fontset-font t nil face nil 'prepend)))) fallback-fonts))))

;; (set-fonts)

;; (set-face-attribute 'default nil :font "Iosevka Term
;;(set-frame-font "Iosevka Term SS12-16")
(add-to-list 'default-frame-alist
             '(font . "Iosevka Term SS12-14"))
(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)
(provide 'early-init)
;;; early-init.el ends here

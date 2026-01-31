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

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)
(provide 'early-init)
;;; early-init.el ends here

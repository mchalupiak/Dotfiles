;;; apps.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Michael Chalupiak
;;
;; Author: Michael Chalupiak <mikec@archbox>
;; Maintainer: Michael Chalupiak <mikec@archbox>
;; Created: January 16, 2026
;; Modified: January 16, 2026
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/mikec/apps
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(straight-use-package
 '(eat :type git
   :host codeberg
   :repo "akib/emacs-eat"
   :files ("*.el" ("term" "term/*.el") "*.texi"
           "*.ti" ("terminfo/e" "terminfo/e/*")
           ("terminfo/65" "terminfo/65/*")
           ("integration" "integration/*")
           (:exclude ".dir-locals.el" "*-tests.el"))
   :defer t))

(add-hook 'eshell-load-hook #'eat-eshell-mode)

(use-package magit
  :ensure t
  :defer t)

(use-package org
  :ensure t
  :defer t)

(provide 'apps)
;;; apps.el ends here

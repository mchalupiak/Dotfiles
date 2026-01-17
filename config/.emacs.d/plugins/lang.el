;;; lang.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Michael Chalupiak
;;
;; Author: Michael Chalupiak <mikec@archbox>
;; Maintainer: Michael Chalupiak <mikec@archbox>
;; Created: January 16, 2026
;; Modified: January 16, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/mikec/lang
;; Package-Requires: ((emacs "29.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(use-package treesit-auto
  :ensure t
  ;; :defer t
  :custom
  (treesit-auto-install t)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; (use-package gitconfig-mode
;;   :ensure t
;;   :defer t)
;; (use-package gitignore-mode
;;   :ensure t
;;   :defer t)

(use-package odin-ts-mode
  :ensure t
  :defer t
  :straight '(:type git :host github :repo "Sampie159/odin-ts-mode"))

(use-package zig-ts-mode
  :ensure t
  :defer t
  :straight '(:type git :host codeberg :repo "meow_king/zig-ts-mode"))

(use-package eglot-x
  :ensure t
  :defer t
  :straight '(:type git :host github :repo "nemethf/eglot-x"))

(dolist (mode '(c-ts-mode-hook
                rust-ts-mode-hook
                odin-ts-mode-hook
                zig-ts-mode-hook))
  (add-hook mode 'eglot-ensure))

(with-eval-after-load 'eglot
  (require 'eglot-x)
  (eglot-x-setup))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(zig-ts-mode . ("zls"))))

(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-ts-mode))
(add-to-list 'auto-mode-alist '("\\.zig\\(?:\\.zon\\)?\\'" . zig-ts-mode))

(defvar treesit-language-source-alist '())
(add-to-list 'treesit-language-source-alist '(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin"))
(add-to-list 'treesit-language-source-alist '(zig "https://github.com/tree-sitter-grammars/tree-sitter-zig"))

(provide 'lang)
;;; lang.el ends here

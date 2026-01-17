;;; init.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Michael Chalupiak
;;
;; Author: Michael Chalupiak <mikec@mchalupiak.com>
;; Maintainer: Michael Chalupiak <mikec@mchalupiak.com>
;; Created: January 15, 2026
;; Modified: January 15, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/mikec/init
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defconst config-dirs '("config" "plugins"))

(defun load-user-config ()
  (let*
      ((expanded-dirs (mapcar
                       (lambda (dir) (concat (expand-file-name dir user-init-dir) "/*.el"))
                       config-dirs))
       (config-files (seq-filter (lambda (file) (not (string= file (expand-file-name "plugins/straight.el" user-init-dir)))) (mapcan (lambda (expanded-dir) (file-expand-wildcards expanded-dir)) expanded-dirs))))
    (progn
      (load-file (expand-file-name "plugins/straight.el" user-init-dir))
      (mapc (lambda (file) (load-file file)) config-files))))

(load-user-config)
(setq gc-cons-threshold (* 2 1000 1000))

(provide 'init)
;;; init.el ends here

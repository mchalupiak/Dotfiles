;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Michael Chalupiak"
      user-mail-address "mikecchalupiak@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Olympe Mono Hacked" :size 28 )
      doom-variable-pitch-font (font-spec :family "Cantarell" :size 28 :weight 'bold))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-rose-pine)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Custom Config ;;

;; fixes slow vterm performance (especially in cava)
(setq vterm-timer-delay 0.001)

;; deft directory & recursive search in that directory
;; (setq deft-directory "~/notes")
;; (setq deft-recursive t)
;; set naming rules for deft
;; (setq deft-org-mode-title-prefix t)
;; (setq deft-file-naming-rules
;; '((noslash . "-")
;; (nospace . "-")
;; (case-fn . downcase)))

;; enable tree-sitter
;; (global-tree-sitter-mode)

;; enable tree-sitter syntax highlighting
;; (add-hook 'c-mode-hook #'tree-sitter-hl-mode)
(global-flycheck-mode t)
(global-prettify-symbols-mode)
(global-display-fill-column-indicator-mode)
(after! js
  (setq-default js--prettify-symbols-alist '()))
(add-hook 'typescript-tsx-mode-hook
          (lambda () (setq prettify-symbols-alist '())))
(defun racket-alist-hook-function () (push '("lambda" . ?λ) prettify-symbols-alist))
(add-hook 'racket-mode-hook
          'racket-alist-hook-function)

;;(setq mpc-host "137.112.200.154")
(setq mpc-browser-tags '(Artist Album|Playlist Title|File))
(add-hook 'mpc-mode-hook
          (lambda ()
            (keymap-local-set "C-k"        'windmove-up)
            (keymap-local-set "C-j"        'windmove-down)
            (keymap-local-set "C-h"        'windmove-left)
            (keymap-local-set "C-l"        'windmove-right)
            (keymap-local-set "C-q" 'mpc-quit)
            (keymap-local-set "a"   (lambda () (interactive) (mpc-select) (mpc-playlist-add)))
            (keymap-local-set "D"   (lambda () (interactive) (mpc-select) (mpc-playlist-delete)))))
(add-hook 'mpc-songs-mode-hook
          (lambda ()
            (keymap-local-set "p" 'mpc-playlist)))
;; (keymap-local-set "C-<return>" 'mpc-play-at-point)
;; (keymap-local-set "<SPC>"      'mpc-toggle-play)
;; (keymap-local-set "s"          'mpc-toggle-shuffle)
;; (keymap-local-set "n"          'next-line)
;; (keymap-local-set "p"          'previous-line)
;; (keymap-local-set "f"          'mpc-next)
;; (keymap-local-set "b"          'mpc-prev)))

(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
        send-mail-function #'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function #'message-send-mail-with-sendmail))
(set-email-account! "mikec@mchalupiak.com"
                    '((mu4e-sent-folder       . "/mikec@mchalupiak.com/Sent")
                      (mu4e-drafts-folder     . "/mikec@mchalupiak.com/Drafts")
                      (mu4e-trash-folder      . "/mikec@mchalupiak.com/Junk")
                      (mu4e-refile-folder     . "/mikec@mchalupiak.com/INBOX"))
                    ;;(smtpmail-smtp-user     . "foo@bar.com")
                    ;;(user-mail-address      . "foo@bar.com")    ;; only needed for mu < 1.4
                    ;;(mu4e-compose-signature . "---\nYours truly\nThe Baz"))
                    t)
(set-email-account! "mikecchalupiak@outlook.com"
                    '((mu4e-sent-folder       . "/mikecchalupiak@outlook.com/Sent")
                      (mu4e-drafts-folder     . "/mikecchalupiak@outlook.com/Drafts")
                      (mu4e-trash-folder      . "/mikecchalupiak@outlook.com/Junk")
                      (mu4e-refile-folder     . "/mikecchalupiak@outlook.com/INBOX"))
                    ;;(smtpmail-smtp-user     . "foo@bar.com")
                    ;;(user-mail-address      . "foo@bar.com")    ;; only needed for mu < 1.4
                    ;;(mu4e-compose-signature . "---\nYours truly\nThe Baz"))
                    t)

(set-email-account! "chalupmc@rose-hulman.edu"
                    '((mu4e-sent-folder       . "/chalupmc@rose-hulman.edu/Sent")
                      (mu4e-drafts-folder     . "/chalupmc@rose-hulman.edu/Drafts")
                      (mu4e-trash-folder      . "/chalupmc@rose-hulman.edu/Junk")
                      (mu4e-refile-folder     . "/chalupmc@rose-hulman.edu/INBOX"))
                    ;;(smtpmail-smtp-user     . "foo@bar.com")
                    ;;(user-mail-address      . "foo@bar.com")    ;; only needed for mu < 1.4
                    ;;(mu4e-compose-signature . "---\nYours truly\nThe Baz"))
                    t)
;;(setq +notmuch-sync-backend 'mbsync)

(defun open-mpc () (interactive)
       (setq mpc-host (read-string "IP Address:"))
       (call-interactively 'mpc))

;; (set-frame-parameter nil 'alpha-background 80) ; For current frame
;; (add-to-list 'default-frame-alist '(alpha-background . 80)) ; For all new frames henceforth
(setq inhibit-x-resources t)

(require 'dime)
(dime-setup '(dime-repl dime-note-tree))
(setq dime-dylan-implementations
      '((opendylan ("/home/mikec/Documents/suckless/dylan/opendylan-2024.1/bin/dswank")
         :env ("OPEN_DYLAN_USER_REGISTRIES=/tmp/dime-test/registry"))))

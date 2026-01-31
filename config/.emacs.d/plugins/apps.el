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

(use-package libmpdel
  :ensure t
  :demand t)

(use-package mpdel
  :ensure t
  :demand t
  :after libmpdel
  :bind (:map mpdel-playlist-mode-map
              ("h" . mpdel-song-normal-decrement)
              ("l" . mpdel-song-normal-increment)
              ("b" . libmpdel-playback-next)
              ("z" . libmpdel-playback-next)
              ("c" . libmpdel-playback-play-pause)
              ("C" . mpdel/connect-with-ip)
              ("v" . libmpdel-stop)
              ("x" . (lambda () (interactive) (libmpdel-playback-seek 0)))
              ("i" . mpdel-song-open)
              ("s" . (lambda () (interactive) (if (libmpdel-get-state 'random #'identity) (libmpdel-playback-unset-random) (libmpdel-playback-set-random))))
              ("r" . (lambda () (interactive) (if (libmpdel-get-state 'repeat #'identity) (libmpdel-playback-unset-repeat) (libmpdel-playback-set-repeat))))
              ("X" . (lambda () (interactive (libmpdel-send-command "clear"))))
              ("RET" . mpdel-playlist-play)
              (";" . mpdel/switch-context-i))
              
  :init
  (setq mpdel-prefix-key (kbd "C-c z"))
  :config
  (add-to-list 'libmpdel-profiles '("Desktop" "127.0.0.1" 6600 ipv4))
  (add-to-list 'libmpdel-profiles '("Laptop" "127.0.0.1" 6600 ipv4))
  (keymap-set global-map "C-c z" mpdel-playlist-mode-map)
  (defun mpdel/connect-with-ip ()
    (interactive)
    (let* ((profile (completing-read "Connect to: " (mapcar #'car libmpdel-profiles) nil t))
           (ip (completing-read "IP: " nil)))
      (setf (alist-get profile libmpdel-profiles nil nil #'equal) `(,ip ,6600 ipv4))
      (libmpdel-connect-profile (assoc-string profile libmpdel-profiles))))
  (defun mpdel/add-all-to-queue ()
    (interactive)
    (libmpdel-send-command "clear")
    (libmpdel-send-command "add /"))
  (defun mpdel/start-all-music ()
    (interactive)
    (mpdel/add-all-to-queue)
    (mpdel-playlist-open)
    (libmpdel-play))
  (defun mpdel/music-status ()
    (interactive)
    (funcall mpdel/music-status))
  (defvar mpdel/music-status nil)
  (let ((status nil))
    (setq mpdel/music-status
          (lambda ()
           (require 'libmpdel)
           (if (libmpdel-connected-p)
               (let* ((song (libmpdel-current-song))
                      (volume (libmpdel-get-state 'volume #'identity))
                      (song-name (if song (libmpdel-entity-name song) nil))
                      (shuffle (or (libmpdel-get-state 'random (lambda (state) (if state "S" ""))) ""))
                      (repeat (or (libmpdel-get-state 'repeat (lambda (state) (if state "R" ""))) ""))
                      (progress ""))
                 (libmpdel-send-command "status" (lambda (s)
                                                   (setq status (copy-alist s))))
                 (when status
                   (let ((elapsed (libmpdel-time-to-string (cdr (assoc 'elapsed status))))
                         (duration (libmpdel-time-to-string (cdr (assoc 'duration status)))))
                     (setq progress (format " - %s/%s" elapsed duration))))

            
                 (cond
                  ((libmpdel-playing-p) (format "> %s%s %s%s %s%%%%" song-name progress repeat shuffle volume))
                  ((libmpdel-paused-p)  (format "| %s%s %s%s %s%%%%" song-name progress repeat shuffle volume))
                  ((libmpdel-stopped-p) "")))))))
  (setq-default mode-line-format (append default-mode-line-format '((:eval (mpdel/music-status)))))
  (defconst mpdel/contexts
    `((podcasts . ((enter-hooks . ,(lambda (context) (libmpdel-send-commands '("clear"
                                                                               "load podcasts"
                                                                               "random 0"
                                                                               "repeat 0"
                                                                               "consume 1"
                                                                               "single 0"))))
                   (song-change . ,(lambda (context) (libmpdel-send-commands '("rm podcasts"
                                                                               "save podcasts"))))
                   (exit-hooks . ,(lambda (context) (libmpdel-send-commands '("rm podcasts"
                                                                              "save podcasts"
                                                                              "consume 0"))))))
      (allmusic . ((enter-hooks . ,(lambda (context)
                                     (libmpdel-send-commands '("random 1"
                                                               "repeat 1"
                                                               "consume 0"
                                                               "single 0"))
                                     (mpdel/add-all-to-queue)))))
      (playlist . ())))
  (defvar mpdel/current-context (assq 'allmusic mpdel/contexts))
  (defun mpdel/run-context-hooks (hook-name context)
    (let ((hook (cdr (assq hook-name (cdr context)))))
      (when hook
        (funcall hook context))))
  (add-to-list 'savehist-additional-variables 'mpdel/current-context)
  (add-hook 'libmpdel-current-song-changed-hook (lambda ()
                                                  (let ((context mpdel/current-context))
                                                    (mpdel/run-context-hooks 'song-change context))))
  (defun mpdel/is-current-context (context)
    (eq context (car mpdel/current-context)))
  (defun mpdel/switch-context-i ()
    (interactive)
    (mpdel/switch-context (intern (completing-read "Context: " (mapcar #'car mpdel/contexts) nil t))))
  (defun mpdel/switch-context (context)
    (interactive)
    (libmpdel-ensure-connection)
    (unless (eq (car mpdel/current-context) context)
      (libmpdel-send-command "stop")
      (mpdel/run-context-hooks 'exit-hooks mpdel/current-context)
      (setq mpdel/current-context (assq context mpdel/contexts))
      (mpdel/run-context-hooks 'enter-hooks mpdel/current-context))))
  
(use-package org
  :ensure t
  :defer t)

(use-package org-msg
  :ensure t
  :defer t
  :hook ((mu4e-main-mode . org-msg-mode)
         (mu4e-compose-mode . org-msg-mode))
  :config
  (setq mail-user-agent 'mu4e-user-agent)
  (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
        org-msg-startup "hidestars indent inlineimages"
        org-msg-default-alternatives '((new . (text html))
                                       (reply-to-html . (text html))
                                       (reply-to-text . (text)))
        org-msg-convert-citation t))
  

(use-package mu4e
  :ensure t
  :commands (mu4e)
  :config
  (setq mu4e-mu-binary (executable-find "mu"))

  (setq mu4e-read-option-use-builtin nil
        mu4e-completing-read-function 'completing-read)
  ;; this is the directory we created before:
  (setq mu4e-maildir "~/.local/share/mail/")

  ;; this command is called to sync imap servers:
  (setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
  ;; how often to call it in seconds:
  (setq mu4e-update-interval 300)

  ;; save attachment to desktop by default
  ;; or another choice of yours:
  (setq mu4e-attachment-dir "~/Downloads")

  ;; rename files when moving - needed for mbsync:
  (setq mu4e-change-filenames-when-moving t)

  ;; list of your email adresses:
  (setq mu4e-user-mail-address-list '("mikecchalupiak@outlook.com"
                                      "chalupmc@rose-hulman.edu"
                                      "mikec@mchalupiak.com"
                                      "spamreciver1@outlook.com"))
                                        ; the following is to show shortcuts in the main view.
  (setq mu4e-bookmarks ())
  (add-to-list 'mu4e-bookmarks
               '(:name "spamreciver"
                 :query "maildir:/spamreciver1@outlook.com/INBOX"
                 :key ?s))
  (add-to-list 'mu4e-bookmarks
               '(:name "mchalupiak.com"
                 :query "maildir:/mikec@mchalupiak.com/INBOX"
                 :key ?h))
  (add-to-list 'mu4e-bookmarks
               '(:name "rose"
                 :query "maildir:/chalupmc@rose-hulman.edu/INBOX"
                 :key ?r))
  (add-to-list 'mu4e-bookmarks
               '(:name "outlook"
                 :query "maildir:/mikecchalupiak@outlook.com/INBOX"
                 :key ?o))

  
  (setq mu4e-contexts
        `(,(make-mu4e-context
            :name "outlook"
            :match-func
            (lambda (msg)
              (when msg
                (mu4e-message-contact-field-matches msg
                                                    :to "mikecchalupiak@outlook.com")))
            :vars '((user-mail-address . "mikecchalupiak@outlook.com")
                    (user-full-name . "Michael Chalupiak")
                    (mu4e-drafts-folder . "/mikecchalupiak@outlook.com/Drafts")
                    (mu4e-refile-folder . "/mikecchalupiak@outlook.com/Archive")
                    (mu4e-sent-folder . "/mikecchalupiak@outlook.com/Sent")
                    (mu4e-trash-folder . "/mikecchalupiak@outlook.com/Trash")))

          ,(make-mu4e-context
            :name "rose"
            :match-func
            (lambda (msg)
              (when msg
                (mu4e-message-contact-field-matches msg
                                                    :to "chalupmc@rose-hulman.edu")))
            :vars '((user-mail-address . "chalupmc@rose-hulman.edu")
                    (user-full-name . "Michael Chalupiak")
                    (mu4e-drafts-folder . "/chalupmc@rose-hulman.edu/Drafts")
                    (mu4e-refile-folder . "/chalupmc@rose-hulman.edu/Archive")
                    (mu4e-sent-folder . "/chalupmc@rose-hulman.edu/Sent")
                    (mu4e-trash-folder . "/chalupmc@rose-hulman.edu/Trash")))

          ,(make-mu4e-context
            :name "hosted"
            :match-func
            (lambda (msg)
              (when msg
                (mu4e-message-contact-field-matches msg
                                                    :to "mikec@mchalupiak.com")))
            :vars '((user-mail-address . "mikec@mchalupiak.com")
                    (user-full-name . "Michael Chalupiak")
                    ;; check your ~/.maildir to see how the subdirectories are called
                    ;; e.g `ls ~/.maildir/example'
                    (mu4e-drafts-folder . "/mikec@mchalupiak.com/Drafts")
                    (mu4e-refile-folder . "/mikec@mchalupiak.com/Archive")
                    (mu4e-sent-folder . "/mikec@mchalupiak.com/Sent")
                    (mu4e-trash-folder . "/mikec@mchalupiak.com/Trash")))
          ,(make-mu4e-context
            :name "spam"
            :match-func
            (lambda (msg)
              (when msg
                (mu4e-message-contact-field-matches msg
                                                    :to "spamreciver1@outlook.com")))
            :vars '((user-mail-address . "spamreciver1@outlook.com")
                    (user-full-name . "spamreciver")
                    ;; check your ~/.maildir to see how the subdirectories are called
                    ;; e.g `ls ~/.maildir/example'
                    (mu4e-drafts-folder . "/spamreciver1@outlook.com/Drafts")
                    (mu4e-refile-folder . "/spamreciver1@outlook.com/Archive")
                    (mu4e-sent-folder . "/spamreciver1@outlook.com/Sent")
                    (mu4e-trash-folder . "/spamreciver1@outlook.com/Trash")))))

 (setq mu4e-context-policy 'pick-first) ;; start with the first (default) context;
 (setq mu4e-compose-context-policy 'ask)
  ; gpg encryptiom & decryption:
  ;; this can be left alone
 (require 'epa-file)
 (epa-file-enable)
 (setq epa-pinentry-mode 'loopback)
 (auth-source-forget-all-cached)

  ;; don't keep message compose buffers around after sending:
 (setq message-kill-buffer-on-exit t)

  ;; send function:
 (setq send-mail-function 'message-send-mail-with-sendmail
       message-send-mail-function 'message-send-mail-with-sendmail)

  ;; send program:
  ;; this is exeranal. remember we installed it before.
 (setq sendmail-program (executable-find "msmtp"))

  ;; select the right sender email from the context.
 (setq message-sendmail-envelope-from 'header)

  ;; chose from account before sending
  ;; this is a custom function that works for me.
  ;; well I stole it somewhere long ago.
  ;; I suggest using it to make matters easy
  ;; of course adjust the email adresses and account descriptions
 (defun timu/set-msmtp-account ()
   (if (message-mail-p)
       (save-excursion
         (let*
             ((from (save-restriction
                      (message-narrow-to-headers)
                      (message-fetch-field "from")))
              (account
               (cond
                ((string-match "mikecchalupiak@outlook.com" from) "outlook")
                ((string-match "chalupmc@rose-hulman.edu" from) "rose")
                ((string-match "mikec@mchalupiak.com" from) "hosted")
                ((string-match "spamreciver1@outlook.com" from) "spam"))))
           (setq message-sendmail-extra-arguments (list '"-a" account)))))

  (add-hook 'message-send-mail-hook 'timu/set-msmtp-account)

  ;; mu4e cc & bcc
  ;; this is custom as well
  (add-hook 'mu4e-compose-mode-hook
            (defun timu/add-cc-and-bcc ()
              "My Function to automatically add Cc & Bcc: headers.
    This is in the mu4e compose mode."
              (save-excursion (message-add-header "Cc:\n"))
              (save-excursion (message-add-header "Bcc:\n"))))))
   ;; ask for context if no context matches;)))

(use-package elfeed
  :ensure t
  :defer t
  :commands (elfeed)
  :bind (:map elfeed-show-mode-map
              ("a" . elfeed/add-to-playlist)
              ("A" . (lambda () (interactive)
                       (elfeed/add-to-playlist)
                       (mpdel/switch-context 'podcasts)
                       (libmpdel-play)))
              ("P" . (lambda () (interactive)
                       (mpdel/switch-context 'podcasts)
                       (libmpdel-play))))
  :bind (:map elfeed-search-mode-map
              ("a" . elfeed/add-to-playlist)
              ("A" . (lambda () (interactive)
                       (elfeed/add-to-playlist)
                       (mpdel/switch-context 'podcasts)
                       (libmpdel-play)))
              ("P" . (lambda () (interactive)
                       (mpdel/switch-context 'podcasts)
                       (libmpdel-play))))
  :config
  (setq-default elfeed-search-filter " ")
  (setq elfeed-feeds
        '( ("https://phaazon.net/blog/feed")
           ("https://irreal.org/blog/?feed=rss2")
           ("https://port19.xyz/rss.xml")
           ("https://lukesmith.xyz/index.xml")
           ("https://notrelated.xyz/rss")
           ("https://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml")
           ;("https://sizeof.cat/index.xml")
           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCkKmeTinUEU27syZPKrzWQQ")
           ("https://www.youtube.com/feeds/videos.xml?playlist_id=PLq1vmb-z7PpQt2PDNUr7XOzBjWAOWf0Rt")
           ("https://danielde.dev/rss.xml")
           ("https://pkolaczk.github.io/feed.xml")
           ("https://joeyh.name/blog/index.rss")
           ("https://kagifeedback.org/atom/t/release-notes")
           ("https://api.substack.com/feed/podcast/462466.rss")
           ("https://www.dailywire.com/feeds/rss.xml")
           ("https://feeds.simplecast.com/6c2VScgo")
           ("https://feeds.simplecast.com/pp_b9xO6")))
  (defun elfeed/add-to-playlist ()
    (interactive
      (let* ((entry (if (eq major-mode 'elfeed-show-mode)
                      elfeed-show-entry
                      (elfeed-search-selected :ignore-region)))
             (link (elfeed-entry-link entry))
             (enclosure (elt (car (elfeed-entry-enclosures entry)) 0)) ; fragile?)))
             (command (if (mpdel/is-current-context 'podcasts) (format "add \"%s\"" enclosure)
                                                               (format "playlistadd podcasts \"%s\"" enclosure))))
        (when enclosure
          (libmpdel-ensure-connection)
          (libmpdel-send-command command (lambda (s) (pp s))))))))
(use-package elfeed-summary
  :straight t
  :defer t
  :commands (elfeed-summary)
  :bind (:map elfeed-summary-mode-map
              ("p" . magit-section-backward))
  :config
  (setq-default elfeed-summary-default-filter " ")
  (setq-default elfeed-summary-look-back most-positive-fixnum)
  (setq elfeed-summary--search-show-read t)
  (setq elfeed-summary-settings
        '((query . :all))))

(provide 'apps)
;;; apps.el ends here

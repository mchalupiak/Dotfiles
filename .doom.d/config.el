;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Cascadia Code" :size 16)
      doom-variable-pitch-font (font-spec :family "Cascadia Code" :size 16))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-classic)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq elfeed-feeds
      '(("https://phaazon.net/blog/feed")
        ("https://danielde.dev/rss.xml")
        ("https://sizeof.cat/index.xml")
        ("https://lukesmith.xyz/rss.xml")
        ("https://api.substack.com/feed/podcast/462466.rss")
        ("https://www.dailywire.com/feeds/rss.xml")
        ("https://feeds.simplecast.com/6c2VScgo")
        ("https://feeds.simplecast.com/pp_b9xO6")
        ("https://notrelated.xyz/rss")))
(setq elfeed-summary-settings
      '((group
         (:title . "Feeds")
         (:elements
          (query . :all)))))

(after! elfeed
  (setq elfeed-search-filter ""))
(after! elfeed-summary
  (setq elfeed-summary-default-filter ""))

(add-hook 'elfeed-summary-mode-hook
  (lambda ()
    (define-key elfeed-summary-mode-map
                (kbd "RET")
                'elfeed-summary--action-show-read)
    (define-key elfeed-summary-mode-map
                (kbd "<normal-state>RET")
                'elfeed-summary--action-show-read)
    (define-key elfeed-summary-mode-map
                (kbd "<normal-state>h")
                'elfeed-summary-quit-window)
    (define-key elfeed-summary-mode-map
                (kbd "<normal-state>l")
                'elfeed-summary--action-show-read)))

(add-hook 'elfeed-search-mode-hook
  (lambda ()
    (define-key elfeed-search-mode-map
                (kbd "<normal-state>h")
                'elfeed-kill-buffer)
    (define-key elfeed-search-mode-map
                (kbd "<normal-state>l")
                'elfeed-search-show-entry)))

(add-hook 'elfeed-show-mode-hook
  (lambda ()
    (define-key elfeed-show-mode-map
                (kbd "<normal-state>h")
                'elfeed-kill-buffer)
    (define-key elfeed-show-mode-map
                (kbd "<normal-state>j")
                'View-scroll-line-forward)
    (define-key elfeed-show-mode-map
                (kbd "<normal-state>k")
                'View-scroll-line-backward)))

(add-hook 'elfeed-show-mode-hook 'view-mode)

(defun elfeed-podcast-tagger (entry)
  (when (elfeed-entry-enclosures entry)
        (elfeed-tag entry 'podcast)))

;;(add-hook 'elfeed-new-entry-hook #'ime-elfeed-podcast-tagger)
(setq emms-source-file-default-directory "/mnt/c/Users/mchalupi/Music")
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

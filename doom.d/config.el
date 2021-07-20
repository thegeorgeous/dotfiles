;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "George Thomas"
      user-mail-address "iamgeorgethomas@gmail.com")

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
(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;; Toggle fullscreen on start
(toggle-frame-fullscreen)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq delete-by-moving-to-trash 'nil)

(setq lsp-file-watch-ignored `("[/\\\\]\\.git\\'"
                               "[/\\\\]\\.hg\\'"
                               "[/\\\\]\\.bzr\\'"
                               "[/\\\\]_darcs\\'"
                               "[/\\\\]\\.svn\\'"
                               "[/\\\\]_FOSSIL_\\'"
                               "[/\\\\]\\.idea\\'"
                               "[/\\\\]\\.ensime_cache\\'"
                               "[/\\\\]\\.eunit\\'"
                               "[/\\\\]node_modules"
                               "[/\\\\]\\.fslckout\\'"
                               "[/\\\\]\\.tox\\'"
                               "[/\\\\]dist\\'"
                               "[/\\\\]dist-newstyle\\'"
                               "[/\\\\]\\.stack-work\\'"
                               "[/\\\\]\\.bloop\\'"
                               "[/\\\\]\\.metals\\'"
                               "[/\\\\]target\\'"
                               "[/\\\\]\\.ccls-cache\\'"
                               "[/\\\\]\\.vscode\\'"
                               "[/\\\\]\\.deps\\'"
                               "[/\\\\]build-aux\\'"
                               "[/\\\\]autom4te.cache\\'"
                               "[/\\\\]\\.reference\\'"
                               "[/\\\\]bin/Debug\\'"
                               "[/\\\\]obj\\'"
                               "[/\\\\]\\.m2/repository\\"))
;; Show the fill column indicator when writing code
(add-hook! (text-mode prog-mode conf-mode) 'display-fill-column-indicator-mode)
(setq doom-modeline-env-ruby-executable "Users/georgethomas/.rbenv/shims/ruby")
(setq flycheck-ruby-executable "Users/georgethomas/.rbenv/shims/ruby")

(setq-default line-spacing 0.3)
(setq projectile-kill-buffers-filter 'kill-all)

(map! :leader
      (:prefix-map ("r" . "replace")
       :desc "query"  "q" #'query-replace
       :desc "regexp" "r" #'query-replace-regexp)
      (:prefix-map ("s" . "search")
       :desc "char" "a" #'avy-goto-char)
)

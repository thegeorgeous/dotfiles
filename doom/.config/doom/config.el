;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "George Thomas"
      user-mail-address "iamgeorgethomas@gmail.com")

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
(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'medium)
     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 8))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-aurora)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

(toggle-frame-maximized)
(setq-default line-spacing 0.3)
(display-time)
(setq-default display-time-24hr-format t)
(setq delete-by-moving-to-trash 'nil)
(setq-default magit-delete-by-moving-to-trash 'nil)
(add-hook! (text-mode prog-mode conf-mode) 'display-fill-column-indicator-mode)

(setq-default doom-modeline-env-ruby-executable "/Users/georgethomas/.asdf/shims/ruby")
(setq-default flycheck-ruby-executable "/Users/georgethomas/.asdf/shims/ruby")
(setq-default flycheck-ruby-rubocop-executable "/Users/georgethomas/.asdf/shims/rubocop")

(setq flycheck-eglot-exclusive nil)
(setq ns-right-alternate-modifier nil)   ;; Act as AltGR, for "|" to work with DE keyboards

(add-hook 'treemacs-mode-hook '(lambda ()
                          (setq buffer-face-mode-face '(:family "Fira Sans" :height 7))
                          (buffer-face-mode)))
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; (with-eval-after-load 'eglot
;;  (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) "ruby-lsp")))

(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(ruby-mode . "ruby"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "ruby-lsp")
                    :major-modes '(ruby-mode ruby-ts-mode)
                    :server-id 'ruby-lsp)))
(setq doom-modeline-buffer-file-name-style 'truncate-with-project)

(after! ruby-mode
  (set-company-backend! 'ruby-mode))

(add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode t)

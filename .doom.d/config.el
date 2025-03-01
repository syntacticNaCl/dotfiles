;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "syntacticNaCl"
      user-mail-address "garrett@syntacticnacl.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Mononoki Nerd Font Mono" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq
   org-directory "~/Sync/org/"
   org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)"))
   org-todo-keyword-faces
   '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
     ("WAIT" :foreground "#9f7efe" :weight normal :underline t)
     ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
     ("DONE" :foreground "#50a14f" :weight normal :underline t)
     ("CANCELLED" :foreground "#ff6480" :weight normal :underline t))
   org-log-done 'time
   org-agenda-files (list "~/Sync/org/agenda.org" "~/Sync/org/done.org")))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to lose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

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

(after! evil-escape
  (setq
   evil-escape-key-sequence "jk"
   evil-escape-delay 0.2
   evil-escape-unordered-key-sequence "true"))

;; Adds avy binding
(map! :leader
      :desc "Jump to char" "f /" #'avy-goto-char
      :desc "Jump to char" "j j" #'avy-goto-char)

;; (after! company
;;   (setq company-idle-delay 0.5
;;         company-minimum-prefix-length 2)
;;   (setq company-show-quick-access t)
;;   (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

(display-time-mode 1)                             ; Enable time in the mode-line

(unless (string-match-p "^Power N/A" (battery))   ; On laptops...
  (display-battery-mode 1))                       ; it's nice to know how much power you have

;; https://www.gnu.org/software/emacs/manual/html_node/ccmode/Subword-Movement.html
(global-subword-mode 1)

;; Projectile
(setq
 projectile-project-search-path '("~/code/github.com"))

;; Disable semgrep-ls
(setq lsp-disabled-clients '(semgrep-ls))

;; hack to fix lsp-mode errors; https://github.com/emacs-lsp/lsp-mode/issues/3577
;; this just loads lsp-mode on startup instead of lazy loading
(require 'lsp-mode)
(add-hook 'terraform-mode #'lsp)
(add-hook 'go-mode #'lsp)
(add-hook 'python-mode #'lsp)

;; ignore cache
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]cache\\'"))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

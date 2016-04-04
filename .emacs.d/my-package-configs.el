; ('require better-defaults)

;; helm {{
(require 'helm)
(require 'helm-config)
(helm-mode 1)
;; }} end helm

;; evil {{
(require 'evil)
(global-evil-leader-mode)
(evil-mode 1)
;; }} end evil

(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'find-file
  "E" 'eval-buffer
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "w" 'save-buffer
  "P" 'package-install
  "DD" 'delete-file
  "d" 'delete-window
  ; "ci" 'evilnc-comment-or-uncomment-lines
  ; "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  ; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  ; "cc" 'evilnc-copy-and-comment-lines
  ; "cp" 'evilnc-comment-or-uncomment-paragraphs
  ; "cr" 'comment-or-uncomment-region
  ; "cv" 'evilnc-toggle-invert-comment-line-by-line
  ; "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-smartparens)
(add-hook 'smartparens-enabled-hook 'web-mode)
(add-hook 'smartparens-enabled-hook 'php-mode)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; evil nerd-commenter
; (evilnc-default-hotkeys)

;; slime-nav {{
(progn
  (require 'elisp-slime-nav)
  (defun my-lisp-hook ()
	(elisp-slime-nav-mode)
	(turn-on-eldoc-mode)
	)
  (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
  )
;; }} end slime-nav

;; yasnippets {{
(require 'yasnippet)
(yas-global-mode 1)
;; }}

;; flymake {{
(require 'flymake) 
(global-set-key [f3] 'flymake-display-err-menu-for-current-line)
(global-set-key [f4] 'flymake-goto-next-error)
;; }}

;; webmode {{
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(require 'php-mode)
(eval-after-load 'php-mode
  '(require 'php-ext))
;; }}

;; autocompletion {{
 (ac-config-default)
;; }}

;; emmet-mode {{
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil
;;}}

;; ac-html {{
(add-to-list 'web-mode-ac-sources-alist
             '("html" . (ac-source-html-tag
                         ac-source-html-attr
                         ac-source-html-attrv)))
;;}}

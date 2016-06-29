;; helm {{
(require 'helm)
(require 'helm-config)
(helm-mode 1)

(require 'helm-projectile)
(helm-projectile-on)
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
  "K" 'kill-buffer-and-window
  "s" 'save-buffer
  "P" 'package-install
  "DD" 'delete-file
  "d" 'delete-window
  "|" 'split-window-right
  "W" 'split-window-right
  "+" 'balance-windows
  "-" 'split-window-below
  "x" 'delete-window
  "t" 'neotree-toggle
  "m" 'helm-M-x
  "ci" 'evilnc-comment-or-uncomment-lines
  "f" 'helm-projectile-find-file
  "pp" 'helm-projectile
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
(add-hook 'web-enabled-hook 'evil-smartparens-mode)
(add-hook 'php-enabled-hook 'evil-smartparens-mode)

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

;; }}

;; angular-mode {{
(require 'angular-mode)
(require 'angular-snippets)
(require 'ac-html-angular)

;; }}

;; json-mode {{
(require 'json-mode)
;; }}

;; autocompletion {{
 (ac-config-default)
 (add-to-list 'ac-modes 'angular-mode)
 (add-to-list 'ac-modes 'angular-html-mode)
;; }}

;; emmet-mode {{
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook  'emmet-mode) ;; enable Emmet's web abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil

(require 'ac-emmet)
(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)
;;}}

;; ac-html {{
(require 'ac-html)
(defun setup-ac-for-html ()
  ;; Require ac-haml since we are setup haml auto completion
  (require 'ac-html)
  ;; Require default data provider if you want to use
  (require 'ac-html-default-data-provider)
  ;; Enable data providers,
  ;; currently only default data provider available
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;; Let ac-haml do some setup
  (ac-html-setup)
  ;; Set your ac-source
  (setq ac-sources '(ac-source-html-tag
                     ac-source-html-attr
                     ac-source-html-attrv))
  ;; Enable auto complete mode
  (auto-complete-mode))

(add-hook 'html-mode-hook 'setup-ac-for-html)
;;}}

;; smex {{
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; }}

;; expand-region {{
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;; }} 
;; volitle-highlights {{
(require 'volatile-highlights)
(volatile-highlights-mode t)
;; }} 

;; markdown-mode {{
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; }}


;; php {{
(require 'php-auto-yasnippets)
(setq php-auto-yasnippet-php-program "~/.emacs.d/snippets/php/Create-PHP-YASnippet.php")
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

;; ac-php
(add-hook 'php-mode-hook
        '(lambda ()
            (auto-complete-mode t)
            (require 'ac-php)
            (setq ac-sources  '(ac-source-php ) )
            (yas-global-mode 1)
            (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
            (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
            ))

(require 'php-eldoc)

(require 'php-refactor-mode)
(add-hook 'php-mode-hook 'php-refactor-mode)

(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(require 'php-mode)
(eval-after-load 'php-mode
  '(require 'php-ext))
;; }}


;; git {{
(require 'git-gutter)
(global-git-gutter-mode t)
;; }}


;; neotree {{
(require 'neotree)
(global-set-key [C-c C-t] 'neotree-toggle)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
; smart open neotree
(setq neo-smart-open t)

;using with projectile
; C-c p p
(setq projectile-switch-project-action 'neotree-projectile-action)

;; }}

;; json {{
 (require 'json-mode)
;;}}

;; company-mode {{
(add-hook 'after-init-hook 'global-company-mode)
(require 'company)                                   ; load company mode
(require 'company-web-html)                          ; load company mode html backend
;; }}

;; js2-mode {{
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;}}

;; better modeline {{
(require 'powerline)
(powerline-default-theme)
;; }}


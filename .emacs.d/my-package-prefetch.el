(defvar prelude-packages
  '(
	 ; deft 
	 ; elm 
	 ; gist 
	 ; python
	 angular-mode
	 angular-snippets
	 ac-html-angular
	 ac-html
	 ac-emmet
	 ac-php
	 angular-mode
	 angular-snippets
	 better-defaults
	 company
	 company-c-headers
	 company-shell
	 company-web
	 color-theme-sanityinc-tomorrow
	 elisp-slime-nav 
	 emmet-mode
	 evil
	 evil-leader 
	 evil-surround
	 evil-smartparens
	 evil-easymotion
	 evil-matchit
	 evil-nerd-commenter
	 expand-region
	 find-file-in-project 
	 flymake
	 flymake-php
	 flymake-jslint 
	 git-gutter
	 highlight-indentation
	 helm
	 helm-projectile
	 idle-highlight-mode 
	 ido-ubiquitous
	 json-mode
	 key-chord
	 magit 
	 markdown-mode 
	 neotree
	 paredit
	 php-mode
	 php-auto-yasnippets
	 php-completion
	 php-refactor-mode
	 php-eldoc
	 phpunit
	 powerline
	 powerline-evil
	 projectile 
	 rainbow-delimiters 
	 sass-mode 
	 seti-theme
	 scss-mode 
	 smart-mode-line
	 smart-mode-line-powerline-theme
	 smex
	 undo-tree 
	 visual-regexp-steroids 
	 volatile-highlights 
	 web-mode
	 yasnippet 
	 zenburn-theme
	 )
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'my-package-prefetch)
;;; my-package-prefetch.el ends here


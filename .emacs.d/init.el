;; requires package.el
(require 'package)
;; requires common lisp
(require 'cl)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ))

(package-initialize)

(setq startup (expand-file-name "my-startup.el" user-emacs-directory))
(setq editor-config (expand-file-name "my-editor.el" user-emacs-directory))
(setq package-prefetch (expand-file-name "my-package-prefetch.el" user-emacs-directory))
(setq package-configs (expand-file-name "my-package-configs.el" user-emacs-directory))
(setq keybindings (expand-file-name "my-keybindings.el" user-emacs-directory))
(setq helpers (expand-file-name "my-helpers.el" user-emacs-directory))

(load package-prefetch)
(load startup)
(load editor-config)
(load package-configs)
(load keybindings)
(load helpers)

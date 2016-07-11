;; Editor settings

;; In every buffer, the line which contains the cursor will be fully highlighted
(global-hl-line-mode 1)

;; Prevent backup files
(setq make-backup-files nil) 

;; Black splash screen
(setq inhibit-splash-screen t)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Load theme
;; (load-theme 'seti t)
(load-theme 'zenburn t)
(set-cursor-color "green")

;; Add line nums
(global-linum-mode t)

;; Override from yes-or-no to y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Highlight Indentation
(require 'highlight-indentation)

;; TabsAreEvil
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

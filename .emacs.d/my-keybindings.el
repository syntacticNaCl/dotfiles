(define-key evil-normal-state-map (kbd "<tab>") (kbd ">>"))
(define-key evil-normal-state-map (kbd "C-j") (kbd "5j"))
(define-key evil-normal-state-map (kbd "C-k") (kbd "5k"))
(global-set-key (kbd "M-x") 'helm-M-x)

;;Exit insert mode by pressing j and then j quickly
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

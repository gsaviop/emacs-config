(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(badger))
 '(custom-safe-themes
   '("d3c0bb5bc4d1fbabd01f123774e4a6afe98502702ac7181ed6e7e33aa5098878" "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(package-selected-packages
   '(nov calibredb smartparens company company-go flymake go-mode lsp-mode ido-completing-read+ badger-theme drag-stuff gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Ensure drag-stuff is loaded before setting bindings
(require 'drag-stuff)

;; Bind M-up and M-down to drag-stuff functions
(global-set-key (kbd "M-<up>") 'drag-stuff-up)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)

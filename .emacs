(require 'package)
;; Add MELPA to your package archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)

(add-to-list 'default-frame-alist `(font . ,"Ubuntu Mono"))

(setq-default tab-width 4)

;;package modes

;;calibre
(require 'calibredb)
(setq calibredb-root-dir "~/Calibre Library")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("~/Calibre Library")))

;;nov
(setq nov-unzip-program (executable-find "unzip")
      nov-unzip-args '("-x" "-d" directory filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;;drag-stuff
(drag-stuff-mode 1)

;;ido
(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;;flycheck
(require 'flymake)
(flymake-mode)

;;smartparens
(use-package smartparens
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

;;company
(unless (package-installed-p 'company)
  (package-install 'company))

(require 'company)

;; Ensure go-mode is installed
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

;; Enable company-mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Enable lsp-mode for Go
(require 'lsp-mode)
(require 'lsp-go)

;; Add Go-specific settings
(add-hook 'go-mode-hook #'lsp-deferred)   ;; Start lsp-mode in Go buffers
(add-hook 'go-mode-hook #'company-mode)   ;; Enable company-mode in Go buffers

;; Use company-mode with LSP
(with-eval-after-load 'company
  (setq company-backends '(company-capf)))  ;; Use LSP backend for company

;; Optional: customize company-mode behavior
(setq company-idle-delay 0.2)   ;; Show suggestions quickly (0.2s delay)
(setq company-minimum-prefix-length 1)   ;; Start autocompletion after 1 character

;; Ensure go-mode-map is available before setting keybindings
(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "C-SPC") 'company-complete))



;;shortcut to default directory
(defun open-default-directory ()
  "Open the default directory in dired."
  (interactive)
  (dired default-directory))

(global-set-key (kbd "C-c d") 'open-default-directory)  ;; You can change the keybinding as desired



;;custom file
(setq custom-file "~/.emacs.custom.el")




(load-file custom-file)

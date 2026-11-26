;;; init.el --- -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'warning-suppress-types
			 '(files missing-lexbind-cookie))

(setq inhibit-startup-message t)
(setq default-directory "~/")
(setq user-emacs-directory "~/.config/emacs/")
(setq custom-file "~/.config/emacs/customs.el")

(setq-default indent-tabs-mode -1)
(setq-default tab-width 4)
(setq-default truncate-lines -1)
(setq-default word-wrap -1)
(setq-default column-number-mode 1)
(setq-default eldoc-mode -1)

(setq shell-file-name "pwsh.exe")
(setq shell-command-switch "-Command")

(setopt use-short-answers t)

(make-directory "~/.local/share/emacs/auto-save/" t)
(make-directory "~/.local/share/emacs/backups/" t)
(setq backup-directory-alist '(("." . "~/.local/share/emacs/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.local/share/emacs/auto-save/" t)))

;;; c-mode
(setq-default c-basic-offset 4)

(add-hook 'c-mode-hook
		  (lambda ()
            (interactive)
            (c-toggle-comment-style -1)))

(global-display-line-numbers-mode)
(add-hook 'display-line-numbers-mode-hook
          (lambda ()
            (setq display-line-numbers 'relative)))

(set-window-fringes nil 0 0)

(setq dired-listing-switches "-alh")

;; treesitter
;; (setq treesit-language-source-alist
;;       '((c "https://github.com/tree-sitter/tree-sitter-c")))

(setq treesit-language-source-alist
      '((odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")))

(dolist (lang treesit-language-source-alist)
  (unless (treesit-language-available-p (car lang))
    (treesit-install-language-grammar (car lang))))

(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
;; (add-to-list 'major-mode-remap-alist '(odin-mode . odin-ts-mode))

 ;; modes
(add-to-list 'load-path "~/.config/emacs/local")
(require 'jai-mode)
(require 'odin-mode)
(require 'simpc-mode)

;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
;; (add-to-list 'auto-mode-alist '("\\.[b]\\'" . simpc-mode))

;;; elpaca
(load-file "~/.config/emacs/elpaca.el")

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

(add-hook 'elpaca-after-init-hook (lambda () (load custom-file 'noerror)))

;;; packages
(use-package naysayer-theme
  :ensure t
  :config
  (load-theme 'naysayer t)

  (defface my-number-face
    '((t (:foreground "#7ad0c6")))
    "Face for numeric literals.")

  (add-hook 'prog-mode-hook
            (lambda ()
              (font-lock-add-keywords
               nil
               '(("\\b0[xX][0-9a-fA-F]+\\b" . 'my-number-face)
                 ("\\b[0-9]+\\.?[0-9]*\\(?:[eE][+-]?[0-9]+\\)?[fFuUlL]*\\b" . 'my-number-face)))))

  (custom-set-faces
   '(font-lock-number-face ((t (:inherit my-number-face))))
   '(font-lock-constant-face ((t (:inherit my-number-face))))))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-trigger ".")
  (corfu-quit-no-match 'separator)

  :init
  (global-corfu-mode)

  ;; :config
  ;;  (setq global-corfu-minibuffer
  ;;	(lambda ()
  ;;         (not (or (bound-and-true-p mct--active)
  ;;                  (bound-and-true-p vertico--input)
  ;;                  (eq (current-local-map) read-passwd-map))))))
  )

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t))

(use-package emacs
  :custom
  ;; vertico
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))

  ;; corfu
  (tab-always-indent 'complete))


;;; personal functions
(defun my/preview-fonts ()
  "Preview fonts."
  (interactive)
  (let ((buf (get-buffer-create "*Font Preview*"))
		(fonts (sort (delete-dups (font-family-list)) #'string<)))
	(with-current-buffer buf
	  (let ((inhibit-read-only t))
		(erase-buffer)
		(dolist (font fonts)
		  (let ((start (point)))
			(insert (format "%s\n" font))
			(insert "The quick brown fox jumps over the lazy dog.\n")
			(insert "0123456789 !@#$%^&*() {} []\n\n")
			(put-text-property
			 start (- (point) 1)
			 'face `(:family ,font :height 140))))
		(goto-char (point-min))))
	(pop-to-buffer buf)
	(message "Found %d font families" (length fonts))))

(defun my/reload-personal-config ()
  "Reload personal config."
  (interactive)
  (load-file user-init-file))

(defun my/open-personal-config ()
  "Open personal config file."
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

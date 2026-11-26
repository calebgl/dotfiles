;;; early-init.el --- -*- lexical-binding: t; -*-

;; (defconst my/font "Iosevka NF")

(push '(background-color . "#062329") default-frame-alist)
(push '(foreground-color . "#d1b897") default-frame-alist)
(push '(font . "Consolas-11") default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(dolist (face '(default variable-pitch fixed-pitch))
  (set-face-attribute face nil
		      :family "Consolas"
		      :height 110))

(setq frame-inhibit-implied-resize t)
(setq gc-cons-threshold most-positive-fixnum)
(setq package-enable-at-startup nil)

(advice-add #'package--ensure-init-file :override #'ignore)

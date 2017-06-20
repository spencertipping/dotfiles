;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     auctex
     better-defaults
     c-c++
     clojure
     emacs-lisp
     ;git
     html
     javascript
     ;latex
     markdown
     octave
     perl
     ;semantic
     shell-scripts
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.

  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '()
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(wombat
                         solarized-dark
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
             :size 13
             :weight normal
             :width normal
             :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-com)
   )

  (define-key evil-normal-state-map (kbd "C-+") 'text-scale-increase)
  (define-key evil-normal-state-map (kbd "C--") 'text-scale-decrease)

  (defvimkey "C-(" 'sp-backward-slurp-sexp)
  (defvimkey "C-)" 'sp-forward-slurp-sexp)
  (defvimkey "C-{" 'sp-backward-barf-sexp)
  (defvimkey "C-}" 'sp-forward-barf-sexp)

  (define-key evil-visual-state-map (kbd "<")
    (lambda ()
      (interactive)
      (evil-shift-left (region-beginning) (region-end))
      (evil-normal-state)
      (evil-visual-restore)))

  (define-key evil-visual-state-map (kbd ">")
    (lambda ()
      (interactive)
      (evil-shift-right (region-beginning) (region-end))
      (evil-normal-state)
      (evil-visual-restore))))

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "none" :foreground
                         "#f6f6f6" :inverse-video nil :box nil :strike-through
                         nil :overline nil
                         :underline nil :slant normal :weight normal :height
                         96 :width normal :foundry
                         "unknown" :family "DejaVu Sans Mono"))))
 '(border ((t (:background "black"))))
 '(ein:cell-input-area ((((class color) (background dark)) nil)))
 '(ein:cell-input-prompt ((t (:inherit header-line :background "black"
                                       :foreground "gray30"))))
 '(ein:cell-output-prompt ((t (:inherit header-line :background "black"
                                        :foreground "gray30"))))
 '(mode-line ((t (:background "none" :foreground "#f6f3e8")))))

(defun defvimkey (name binding)
  (define-key evil-normal-state-map (kbd name) binding)
  (define-key evil-insert-state-map (kbd name) binding))

(defun setup-buffer ()
  (interactive)
  (auto-fill-mode 1)
  (smartparens-mode 1))

(defun kill-start-of-line ()
  "Kill from point to start of line"
  (interactive)
  (kill-line 0))

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration.")

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

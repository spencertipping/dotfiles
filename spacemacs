;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     asm
     (auto-completion :disabled-for markdown)
     c-c++
     docker
     emacs-lisp
     go
     haskell
     helm
     html
     ipython-notebook
     javascript
     lua
     markdown
     nginx
     nixos
     ocaml
     purescript
     python
     react
     ruby
     rust
     shaders
     shell-scripts
     sql
     themes-megapack
     theming
     typescript
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(jbeans-theme
                                      jazz-theme
                                      minimal-theme
                                      monochrome-theme
                                      mustang-theme
                                      tangotango-theme
                                      zenburn-theme)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   ;; NOTE(spencer): recentf conflicts between running emacs instances.
   dotspacemacs-excluded-packages '(recentf
                                    savehist
                                    firebelly-theme
                                    niflheim-theme
                                    pastels-on-dark-theme
                                    tronesque-theme
                                    zonokai-theme)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists nil
   ;; True if the home buffer should respond to re events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(jbeans
                         minimal
                         jazz
                         monochrome
                         wombat
                         mustang
                         tangotango
                         zenburn
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 34
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (add-to-list 'default-frame-alist '(alpha . (90 . 90)))
  (add-to-list 'default-frame-alist '(width  . 90))

  ;; From https://stackoverflow.com/questions/6462167/emacsclient-does-not-respond-to-mouse-clicks
  (defun my-terminal-config (&optional frame)
    "Establish settings for the current terminal."
    (if (not frame) ;; The initial call.
        (xterm-mouse-mode 1)
      ;; Otherwise called via after-make-frame-functions.
      (if xterm-mouse-mode
          ;; Re-initialise the mode in case of a new terminal.
          (xterm-mouse-mode 1))))
  ;; Evaluate both now (for non-daemon emacs) and upon frame creation
  ;; (for new terminals via emacsclient).
  (my-terminal-config)
  (add-hook 'after-make-frame-functions 'my-terminal-config)

  ;; Avoid cluttering work directory with autosave files (this crashes
  ;; yarn/react)
  (setq backup-directory-alist
        `(("." . ,(concat user-emacs-directory "backups"))))

  (setq show-trailing-whitespace t)

  (setq js-indent-level 2)
  (setq standard-indent 2)
  (setq sh-indentation 2)
  (setq sh-basic-offset 2)
  (setq smie-indent-basic 2)
  (setq lua-indent-level 2)
  (setq rust-indent-offset 2)

  (setq-default linum-relative-format "%s ")

  (add-to-list 'load-path "/usr/share/emacs/site-lisp/maxima/")
  (autoload 'maxima-mode "maxima" "Maxima mode" t)
  (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
  (autoload 'maxima "maxima" "Maxima interaction" t)
  (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
  (setq imaxima-use-maxima-mode-flag t)
  (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))

  ;; Apply the same cleanup to a bunch of themes.
  (let* ((keep-faces '(region))
         (faces (append (remove-if (lambda (x) (member x keep-faces))
                                   (face-list))
                        '(default
                          line-number
                          linum
                          linum-relative-current-face
                          )))

         (default-mods (mapcar (lambda (f) (cons f '(:background "nil")))
                               faces))

         (themes '(default
                   jazz
                   jbeans
                   minimal
                   monochrome
                   mustang
                   spacemacs-dark
                   tangotango
                   wombat
                   zenburn))

         (theme-mods (mapcar (lambda (x) (cons x default-mods)) themes)))

    (setq-default theming-modifications theme-mods)))


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq-default tab-width 8)

  ;; The only one of these I ever use is suggested LANGUAGE pragmas.
  (setq-default haskell-process-suggest-add-package nil)
  (setq-default haskell-process-suggest-haskell-docs-imports nil)
  (setq-default haskell-process-suggest-hoogle-imports nil)
  (setq-default haskell-process-suggest-no-warn-orphans nil)
  (setq-default haskell-process-suggest-overloaded-strings nil)
  (setq-default haskell-process-suggest-remove-import-lines nil)
  (setq-default haskell-process-suggest-restart nil)

  (setq-default truncate-lines t)
  (setq-default mode-line-format nil)
  (spacemacs/toggle-highlight-current-line-globally-off)

  (remove-hook 'markdown-mode-hook #'smartparens-mode)

  ;; I think the normal value is "fd" or something similarly common. I don't
  ;; ever use this, so let's map it to something I never type.
  (setq-default evil-escape-key-sequence "QQ")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ein goto-chg popup powerline hydra lv anaphora transient bind-key avy anzu iedit smartparens highlight evil undo-tree flx projectile helm helm-core async f dash lua-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme evil-smartparens insert-shebang fish-mode company-shell x86-lookup utop tuareg caml toml-mode tide typescript-mode terraform-mode hcl-mode systemd sql-indent racer pos-tip ocp-indent nginx-mode nasm-mode merlin go-guru go-eldoc glsl-mode polymode deferred websocket company-go go-mode cargo rust-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby nix-mode helm-nixos-options company-nixos-options nixos-options dockerfile-mode docker tablist magit-popup docker-tramp xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode dhall-mode gnu-elpa-keyring-update psci purescript-mode psc-ide yaml-mode persistent-scratch yapfify pyvenv pytest pyenv-mode py-isort pip-requirements mmm-mode markdown-toc markdown-mode live-py-mode intero flycheck hy-mode dash-functional hlint-refactor hindent helm-pydoc helm-hoogle helm-company helm-c-yasnippet haskell-snippets git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md fuzzy disaster diff-hl cython-mode company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company-c-headers company-anaconda company cmm-mode cmake-mode clang-format auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values (quote ((buffer-file-coding-system . utf-8-unix)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "nil" :foreground "light gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(bold ((t (:background "nil"))))
 '(bold-italic ((t (:background "nil"))))
 '(border ((t (:background "nil"))))
 '(buffer-menu-buffer ((t (:background "nil"))))
 '(button ((t (:background "nil"))))
 '(completions-annotations ((t (:background "nil"))))
 '(completions-common-part ((t (:background "nil"))))
 '(completions-first-difference ((t (:background "nil"))))
 '(cursor ((t (:background "nil"))))
 '(eldoc-highlight-function-argument ((t (:background "nil"))))
 '(error ((t (:background "nil"))))
 '(escape-glyph ((t (:background "nil"))))
 '(file-name-shadow ((t (:background "nil"))))
 '(fixed-pitch ((t (:family "Ubuntu Mono"))))
 '(fixed-pitch-serif ((t (:background "nil"))))
 '(font-lock-builtin-face ((t (:background "nil"))))
 '(font-lock-comment-delimiter-face ((t (:background "nil"))))
 '(font-lock-comment-face ((t (:background "nil"))))
 '(font-lock-constant-face ((t (:background "nil"))))
 '(font-lock-doc-face ((t (:background "nil"))))
 '(font-lock-function-name-face ((t (:background "nil"))))
 '(font-lock-keyword-face ((t (:background "nil"))))
 '(font-lock-negation-char-face ((t (:background "nil"))))
 '(font-lock-preprocessor-face ((t (:background "nil"))))
 '(font-lock-regexp-grouping-backslash ((t (:background "nil"))))
 '(font-lock-regexp-grouping-construct ((t (:background "nil"))))
 '(font-lock-string-face ((t (:background "nil"))))
 '(font-lock-type-face ((t (:background "nil"))))
 '(font-lock-variable-name-face ((t (:background "nil"))))
 '(font-lock-warning-face ((t (:background "nil"))))
 '(fringe ((t (:background "nil"))))
 '(glyphless-char ((t (:background "nil"))))
 '(header-line ((t (:background "nil"))))
 '(header-line-highlight ((t (:background "nil"))))
 '(help-argument-name ((t (:background "nil"))))
 '(highlight ((t (:background "nil"))))
 '(homoglyph ((t (:background "nil"))))
 '(ido-first-match ((t (:background "nil"))))
 '(ido-incomplete-regexp ((t (:background "nil"))))
 '(ido-indicator ((t (:background "nil"))))
 '(ido-only-match ((t (:background "nil"))))
 '(ido-subdir ((t (:background "nil"))))
 '(ido-vertical-first-match-face ((t (:background "nil"))))
 '(ido-vertical-match-face ((t (:background "nil"))))
 '(ido-vertical-only-match-face ((t (:background "nil"))))
 '(ido-virtual ((t (:background "nil"))))
 '(internal-border ((t (:background "nil"))))
 '(isearch ((t (:background "nil"))))
 '(isearch-fail ((t (:background "nil"))))
 '(italic ((t (:background "nil"))))
 '(lazy-highlight ((t (:background "nil"))))
 '(line-number ((t (:background "nil"))))
 '(line-number-current-line ((t (:background "nil"))))
 '(link ((t (:background "nil"))))
 '(link-visited ((t (:background "nil"))))
 '(linum ((t (:background "nil"))))
 '(linum-relative-current-face ((t (:background "nil"))))
 '(match ((t (:background "nil"))))
 '(menu ((t (:background "nil"))))
 '(minibuffer-prompt ((t (:background "nil"))))
 '(mode-line ((t (:background "nil"))))
 '(mode-line-buffer-id ((t (:background "nil"))))
 '(mode-line-emphasis ((t (:background "nil"))))
 '(mode-line-highlight ((t (:background "nil"))))
 '(mode-line-inactive ((t (:background "nil"))))
 '(mouse ((t (:background "nil"))))
 '(mouse-drag-and-drop-region ((t (:background "nil"))))
 '(next-error ((t (:background "nil"))))
 '(nobreak-hyphen ((t (:background "nil"))))
 '(nobreak-space ((t (:background "nil"))))
 '(org-kbd ((t (:background "nil"))))
 '(package-description ((t (:background "nil"))))
 '(package-help-section-name ((t (:background "nil"))))
 '(package-name ((t (:background "nil"))))
 '(package-status-avail-obso ((t (:background "nil"))))
 '(package-status-available ((t (:background "nil"))))
 '(package-status-built-in ((t (:background "nil"))))
 '(package-status-dependency ((t (:background "nil"))))
 '(package-status-disabled ((t (:background "nil"))))
 '(package-status-external ((t (:background "nil"))))
 '(package-status-held ((t (:background "nil"))))
 '(package-status-incompat ((t (:background "nil"))))
 '(package-status-installed ((t (:background "nil"))))
 '(package-status-new ((t (:background "nil"))))
 '(package-status-unsigned ((t (:background "nil"))))
 '(page-break-lines ((t (:background "nil"))))
 '(query-replace ((t (:background "nil"))))
 '(read-multiple-choice-face ((t (:background "nil"))))
 '(scroll-bar ((t (:background "nil"))))
 '(secondary-selection ((t (:background "nil"))))
 '(shadow ((t (:background "nil"))))
 '(show-paren-match ((t (:background "nil"))))
 '(show-paren-match-expression ((t (:background "nil"))))
 '(show-paren-mismatch ((t (:background "nil"))))
 '(spacemacs-micro-state-binding-face ((t (:background "nil"))))
 '(spacemacs-micro-state-header-face ((t (:background "nil"))))
 '(spacemacs-mode-line-new-version-lighter-error-face ((t (:background "nil"))))
 '(spacemacs-mode-line-new-version-lighter-success-face ((t (:background "nil"))))
 '(spacemacs-mode-line-new-version-lighter-warning-face ((t (:background "nil"))))
 '(spacemacs-transient-state-title-face ((t (:background "nil"))))
 '(success ((t (:background "nil"))))
 '(tool-bar ((t (:background "nil"))))
 '(tooltip ((t (:background "nil"))))
 '(trailing-whitespace ((t (:background "nil"))))
 '(tty-menu-disabled-face ((t (:background "nil"))))
 '(tty-menu-enabled-face ((t (:background "nil"))))
 '(tty-menu-selected-face ((t (:background "nil"))))
 '(underline ((t (:background "nil"))))
 '(variable-pitch ((t (:background "nil"))))
 '(vc-conflict-state ((t (:background "nil"))))
 '(vc-edited-state ((t (:background "nil"))))
 '(vc-locally-added-state ((t (:background "nil"))))
 '(vc-locked-state ((t (:background "nil"))))
 '(vc-missing-state ((t (:background "nil"))))
 '(vc-needs-update-state ((t (:background "nil"))))
 '(vc-removed-state ((t (:background "nil"))))
 '(vc-state-base ((t (:background "nil"))))
 '(vc-up-to-date-state ((t (:background "nil"))))
 '(vertical-border ((t (:background "nil"))))
 '(warning ((t (:background "nil"))))
 '(window-divider ((t (:background "nil"))))
 '(window-divider-first-pixel ((t (:background "nil"))))
 '(window-divider-last-pixel ((t (:background "nil")))))

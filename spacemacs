;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     asm
     (auto-completion :disabled-for markdown)
     c-c++
     chinese
     deft
     docker
     emacs-lisp
     forth
     go
     gpu
     haskell
     helm
     html
     ietf
     javascript
     json
     kubernetes
     lsp
     major-modes
     markdown
     multiple-cursors
     perl5
     prolog
     python
     shell-scripts
     systemd
     theming
     web-beautify
     xclipboard
     yaml

     themes-megapack
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
                                      zenburn-theme
                                      google-translate

                                      ibus

                                      markdown-preview-mode

                                      flycheck
                                      buffer-move)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   ;; NOTE(spencer): recentf conflicts between running emacs instances.
   dotspacemacs-excluded-packages '(recentf
                                    savehist
                                    yas)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))


(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists nil

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-material-dark
                         eziam-dark
                         minimal-light
                         eziam-light
                         material-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 18.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 10000  ; bumped because this mode is horrendously slow

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 70

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))


(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Disable auto-format-on-paste
  (dolist (func '(yank yank-pop evil-paste-before evil-paste-after))
    (advice-remove func #'spacemacs//yank-indent-region))

  (add-to-list 'default-frame-alist '(width . 81))
  (add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

  (setq mouse-autoselect-window t)
  (scroll-bar-mode -1)

  (setq browse-url-browser-function 'eww-browse-url)

  (setq undo-tree-auto-save-history nil)

  ;; Time to bring in the big guns
  (defun toggle-scroll-bar-mode () nil)
  (defun scroll-bar-mode (x) nil)

  (add-hook 'window-setup-hook          'spacemacs/enable-transparency)
  (add-hook 'after-make-frame-functions 'spacemacs/enable-transparency)

  (add-hook 'markdown-mode-hook 'visual-line-mode)

  ;; Lockfiles have normal extensions, which breaks react.js's auto-reloader.
  ;; I've disabled them here to avoid this problem.
  (setq-default create-lockfiles nil)

  ;; Behave like vim, where shifting preserves each line's position relative to
  ;; the others (even if it isn't an even multiple of the shift width).
  (setq-default evil-shift-round nil)

  (setq-default show-trailing-whitespace t)

  (setq-default standard-indent 2)

  (setq-default js-indent-level 2)
  (setq-default sh-indentation 2)
  (setq-default sh-basic-offset 2)
  (setq-default smie-indent-basic 2)
  (setq-default lua-indent-level 2)
  (setq-default rust-indent-offset 2)
  (setq-default python-indent-offset 2)
  (setq-default perl-indent-level 2)

  (setq-default c-default-style "linux")
  (setq-default c-basic-offset 2)

  (setq-default cperl-extra-newline-before-brace t)
  (setq-default cperl-continued-brace-offset -4)
  (setq-default cperl-continued-statement-offset 4)
  (setq-default cperl-indent-level 2)
  (setq-default cperl-brace-offset 0)
  (setq-default css-indent-offset 2)

  (setq-default linum-relative-format "%s ")

  (c-set-offset 'innamespace 0)

  (add-to-list 'load-path "/usr/share/emacs/site-lisp/maxima/")
  (autoload 'maxima-mode "maxima" "Maxima mode" t)
  (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
  (autoload 'maxima "maxima" "Maxima interaction" t)
  (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
  (setq-default imaxima-use-maxima-mode-flag t)
  (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode)))


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq-default tab-width 8)

  (setq-default read-quoted-char-radix 16)

  (setq-default cperl-indent-level 2)
  (setq-default lsp-enable-on-type-formatting nil)
  (setq-default lsp-enable-indentation nil)

  ;; The only one of these I ever use is suggested LANGUAGE pragmas.
  (setq-default haskell-process-suggest-add-package nil)
  (setq-default haskell-process-suggest-haskell-docs-imports nil)
  (setq-default haskell-process-suggest-hoogle-imports nil)
  (setq-default haskell-process-suggest-no-warn-orphans nil)
  (setq-default haskell-process-suggest-overloaded-strings nil)
  (setq-default haskell-process-suggest-remove-import-lines nil)
  (setq-default haskell-process-suggest-restart nil)

  (setq-default truncate-lines t)
  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; Add un-mapped APL symbols under the "`" prefix
  (setq evil-digraphs-table-user
        '(((?` ?s) . ?⌈)
          ((?` ?d) . ?⌊)
          ((?` ?b) . ?⊥)
          ((?` ?n) . ?⊤)

          ((?` ?p)  . ?⋆)
          ((?` ?=)  . ?÷)
          ((?` ?*)  . ?⍟)
          ((?` ?+)  . ?⌹)
          ((?` ?o)  . ?○)
          ((?` ?|)  . ?⊣)
          ((?` ?\\) . ?⊢)

          ((?` ?9)  . ?∨)
          ((?` ?0)  . ?∧)
          ((?` ?\)) . ?≱)
          ((?` ?\() . ?⍲)

          ((?` ?%)  . ?⌽)
          ((?` ?&)  . ?⊖)
          ((?` ?^)  . ?⍉)
          ((?` ?L)  . ?⌷)
          ((?` ?$)  . ?⍋)
          ((?` ?#)  . ?⍒)
          ((?` ?\;) . ?⍎)
          ((?` ?')  . ?⍕)

          ((?` ?1) . ?¨)
          ((?` ?T) . ?⍨)
          ((?` ?P) . ?⍣)
          ((?` ?j) . ?∘)
          ((?` ?J) . ?⍤)
          ((?` ?O) . ?⍥)

          ((?` ?I) . ?⎕)
          ((?` ??) . ?⍠)
          ((?` ?K) . ?⌸)
          ((?` ?~) . ?⌺)
          ((?` ?!) . ?⌶)
          ((?` ?`) . ?⋄)
          ((?` ?,) . ?⍝)

          ((?` ?<) . ?⍪)
          ((?- ?,) . ?⍪)

          ((?- ?/)  . ?⌿)
          ((?- ?\\) . ?⍀)

          ((?C ?C) . ?ℂ)
          ((?N ?N) . ?ℕ)
          ((?P ?P) . ?ℙ)
          ((?Z ?Z) . ?ℤ)
          ((?R ?R) . ?ℝ)
          ((?Q ?Q) . ?ℚ)

          ;; Two-letter pinyin under neutral tone (definitions from chatGPT)
          ((?b ?a) . ?八) ; eight
          ((?p ?a) . ?怕) ; to be afraid (of)
          ((?m ?a) . ?妈) ; mother
          ((?f ?a) . ?发) ; to send; to issue; to develop
          ((?d ?a) . ?大) ; big; large
          ((?t ?a) . ?他) ; he; him
          ((?n ?a) . ?哪) ; which; where
          ((?l ?a) . ?拉) ; to pull; to play (a musical instrument)
          ((?g ?a) . ?噶) ; a sound used in Tibetan and other languages
          ((?k ?a) . ?卡) ; card; block; snag; bottleneck
          ((?h ?a) . ?哈) ; ha (an onomatopoeic word indicating laughter)
          ((?z ?a) . ?杂) ; mixed; miscellaneous
          ((?c ?a) . ?擦) ; to rub; to wipe; to erase
          ((?s ?a) . ?撒) ; to sprinkle; to scatter; to spread
          ((?m ?e) . ?么) ; a particle used in questions to indicate a lack of understanding or to seek clarification
          ((?d ?e) . ?的) ; a possessive particle indicating "of" or "belonging to"
          ((?t ?e) . ?特) ; special; unique
          ((?n ?e) . ?呢) ; a modal particle used to indicate a question
          ((?l ?e) . ?了) ; a particle used to indicate a completed or changed action
          ((?g ?e) . ?个) ; a measure word used to indicate a general noun or a person
          ((?k ?e) . ?可) ; can; may; possible
          ((?h ?e) . ?和) ; and; together with
          ((?r ?e) . ?热) ; hot
          ((?z ?e) . ?则) ; then; in that case
          ((?c ?e) . ?侧) ; side; lateral
          ((?s ?e) . ?色) ; color
          ((?y ?i) . ?一) ; one; a
          ((?b ?i) . ?比) ; to compare; than
          ((?p ?i) . ?皮) ; skin; leather
          ((?m ?i) . ?米) ; rice; meter
          ((?d ?i) . ?低) ; low
          ((?t ?i) . ?提) ; to carry; to lift; to raise
          ((?n ?i) . ?你) ; you
          ((?l ?i) . ?里) ; inside; within
          ((?j ?i) . ?机) ; machine; opportunity
          ((?q ?i) . ?起) ; to rise; to start; to initiate
          ((?x ?i) . ?西) ; west
          ((?r ?i) . ?日) ; day; sun
          ((?z ?i) . ?子) ; child; seed
          ((?c ?i) . ?次) ; number of times; order
          ((?s ?i) . ?四) ; four
          ((?b ?o) . ?播) ; to broadcast; to sow
          ((?p ?o) . ?破) ; to break; broken
          ((?m ?o) . ?莫) ; do not; must not
          ((?f ?o) . ?佛) ; Buddha
          ((?l ?o) . ?咯) ; a sound indicating surprise or coughing
          ((?b ?u) . ?不) ; not; no
          ((?p ?u) . ?普) ; general; widespread
          ((?m ?u) . ?木) ; wood; tree
          ((?f ?u) . ?付) ; to pay; to hand over
          ((?d ?u) . ?读) ; to read; to study
          ((?t ?u) . ?图) ; diagram; chart; map
          ((?n ?u) . ?女) ; woman
          ((?l ?u) . ?路) ; road; path
          ((?g ?u) . ?骨) ; bone
          ((?k ?u) . ?哭) ; to cry
          ((?h ?u) . ?虎) ; tiger
          ((?r ?u) . ?入) ; to enter
          ((?z ?u) . ?组) ; group; to form a group
          ((?c ?u) . ?促) ; to urge; to promote
          ((?s ?u) . ?速) ; speed; rapid
          ((?j ?u) . ?局) ; office; bureau; situation
          ((?q ?u) . ?去) ; to go; to leave
          ((?x ?u) . ?需) ; to need; to require
          ))

  (defun fira ()
    (interactive)
    (set-frame-font "Fira Code"))

  (defun gentium ()
    (interactive)
    (set-frame-font "Gentium")
    (set-face-font 'fixed-pitch "Fira Code")
    (set-face-font 'markdown-code-face "Fira Code")
    (set-face-font 'markdown-inline-code-face "Fira Code"))

  (defun ubuntu ()
    (interactive)
    (set-frame-font "Ubuntu Mono")
    (set-face-font 'markdown-code-face "Ubuntu Mono")
    (set-face-font 'markdown-inline-code-face "Ubuntu Mono"))

  (defun fix-keybindings ()
    ;; For some reason we lose this keybinding when activating some themes
    (interactive)
    (bind-key "C-k" 'evil-insert-digraph))

  (spacemacs/declare-prefix "o" "own-menu")
  (spacemacs/set-leader-keys "o3" 'spacemacs/window-split-triple-columns)
  (spacemacs/set-leader-keys "oh" 'buf-move-left)
  (spacemacs/set-leader-keys "oj" 'buf-move-down)
  (spacemacs/set-leader-keys "ok" 'buf-move-up)
  (spacemacs/set-leader-keys "ol" 'buf-move-right)

  (spacemacs/set-leader-keys "of" 'fira)
  (spacemacs/set-leader-keys "og" 'gentium)
  (spacemacs/set-leader-keys "ou" 'ubuntu)

  (spacemacs/set-leader-keys "oo" 'fix-keybindings)

  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode "sr" #'haskell-process-restart)
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode "sf" #'flycheck-mode)

  (spacemacs/set-leader-keys "tL" #'visual-line-mode)

  (evil-define-key 'normal 'global (kbd "C-+") #'text-scale-increase)
  (evil-define-key 'normal 'global (kbd "C--") #'text-scale-decrease)

  ;; I think the normal value is "fd" or something similarly common. I don't
  ;; ever use this, so let's map it to something I never type.
  (setq-default evil-escape-key-sequence "QQ"))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

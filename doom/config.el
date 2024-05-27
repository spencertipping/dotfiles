;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Spencer Tipping"
      user-mail-address "spencer.tipping@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq-default doom-font (font-spec :family "Ubuntu Mono" :size 24))
(setq-default doom-serif-font (font-spec :family "Gentium Basic" :size 24))

(add-to-list 'default-frame-alist '(alpha . (92 . 70)))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)
(setq mouse-autoselect-window t focus-follows-mouse t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq-default display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq-default org-directory "~/r/internal/org/")


(setq-default evil-escape-key-sequence "XQ")


(setq-default doom-localleader-key ",")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq-default c-basic-offset 2)
(setq-default c-offsets-alist '((innamespace . 0)))
(setq-default css-indent-offset 2)
(setq-default lisp-body-indent 2)

(after! cc (cc-set-offset 'innamespace 0))


;; List of hooks for non-code modes
(after! (company markdown org yasnippet)
  (setq-default company-yasnippet nil)
  (dolist (hook '(text-mode-hook
                  org-mode-hook
                  markdown-mode-hook))
    (add-hook hook (lambda () (company-mode -1)))))


(global-whitespace-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(after! markdown
  (map! :map markdown-mode-map
        :localleader
        :desc "Align table" "|" #'markdown-table-align))


;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>"   . 'copilot-accept-completion)
              ("TAB"     . 'copilot-accept-completion)
              ("C-TAB"   . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(after! (evil copilot)
  ;; Define the custom function that either accepts the completion or does the default behavior
  (defun my/copilot-tab-or-default ()
    (interactive)
    (if (and (bound-and-true-p copilot-mode)
             ;; Add any other conditions to check for active copilot suggestions if necessary
             )
      (copilot-accept-completion)
      (evil-insert 1))) ; Default action to insert a tab. Adjust as needed.

  (evil-define-key 'insert 'global (kbd "<tab>") 'my/copilot-tab-or-default))


;; Add un-mapped APL symbols under the "`" prefix
(setq evil-digraphs-table-user
      '(((?` ?s) . ?⌈) ((?` ?d) . ?⌊) ((?` ?b) . ?⊥) ((?` ?n) . ?⊤)

        ((?` ?p) . ?⋆) ((?` ?=) . ?÷) ((?` ?*)  . ?⍟) ((?` ?+) . ?⌹)
        ((?` ?o) . ?○) ((?` ?|) . ?⊣) ((?` ?\\) . ?⊢)

        ((?` ?9) . ?∨) ((?` ?0) . ?∧) ((?` ?\)) . ?≱) ((?` ?\() . ?⍲)

        ((?` ?%) . ?⌽) ((?` ?&) . ?⊖) ((?` ?^)  . ?⍉) ((?` ?L) . ?⌷)
        ((?` ?$) . ?⍋) ((?` ?#) . ?⍒) ((?` ?\;) . ?⍎) ((?` ?') . ?⍕)

        ((?` ?1) . ?¨) ((?` ?T) . ?⍨) ((?` ?P) . ?⍣) ((?` ?j) . ?∘)
        ((?` ?J) . ?⍤) ((?` ?O) . ?⍥)

        ((?` ?I) . ?⎕) ((?` ??) . ?⍠) ((?` ?K) . ?⌸) ((?` ?~) . ?⌺)
        ((?` ?!) . ?⌶) ((?` ?`) . ?⋄) ((?` ?,) . ?⍝)

        ((?` ?<) . ?⍪) ((?- ?,) . ?⍪)

        ((?- ?/)  . ?⌿) ((?- ?\\) . ?⍀)

        ((?C ?C) . ?ℂ) ((?N ?N) . ?ℕ) ((?P ?P) . ?ℙ)
        ((?Z ?Z) . ?ℤ) ((?R ?R) . ?ℝ) ((?Q ?Q) . ?ℚ)

        ;; Two-letter pinyin under neutral tone (definitions from chatGPT)
        ((?b ?a) . ?八) ; eight
        ((?b ?i) . ?比) ; to compare; than
        ((?b ?o) . ?播) ; to broadcast; to sow
        ((?b ?u) . ?不) ; not; no
        ((?c ?a) . ?擦) ; to rub; to wipe; to erase
        ((?c ?e) . ?侧) ; side; lateral
        ((?c ?i) . ?次) ; number of times; order
        ((?c ?u) . ?促) ; to urge; to promote
        ((?d ?a) . ?大) ; big; large
        ((?d ?e) . ?的) ; a possessive particle indicating "of" or "belonging to"
        ((?d ?i) . ?低) ; low
        ((?d ?u) . ?读) ; to read; to study
        ((?f ?a) . ?发) ; to send; to issue; to develop
        ((?f ?o) . ?佛) ; Buddha
        ((?f ?u) . ?付) ; to pay; to hand over
        ((?g ?a) . ?噶) ; a sound used in Tibetan and other languages
        ((?g ?e) . ?个) ; a measure word used to indicate a general noun or a person
        ((?g ?u) . ?骨) ; bone
        ((?h ?a) . ?哈) ; ha (an onomatopoeic word indicating laughter)
        ((?h ?e) . ?和) ; and; together with
        ((?h ?u) . ?虎) ; tiger
        ((?j ?i) . ?机) ; machine; opportunity
        ((?j ?u) . ?局) ; office; bureau; situation
        ((?k ?a) . ?卡) ; card; block; snag; bottleneck
        ((?k ?e) . ?可) ; can; may; possible
        ((?k ?u) . ?哭) ; to cry
        ((?l ?a) . ?拉) ; to pull; to play (a musical instrument)
        ((?l ?e) . ?了) ; a particle used to indicate a completed or changed action
        ((?l ?i) . ?里) ; inside; within
        ((?l ?o) . ?咯) ; a sound indicating surprise or coughing
        ((?l ?u) . ?路) ; road; path
        ((?m ?a) . ?妈) ; mother
        ((?m ?e) . ?么) ; a particle used in questions to indicate a lack of understanding or to seek clarification
        ((?m ?i) . ?米) ; rice; meter
        ((?m ?o) . ?莫) ; do not; must not
        ((?m ?u) . ?木) ; wood; tree
        ((?n ?a) . ?哪) ; which; where
        ((?n ?e) . ?呢) ; a modal particle used to indicate a question
        ((?n ?i) . ?你) ; you
        ((?n ?u) . ?女) ; woman
        ((?p ?a) . ?怕) ; to be afraid (of)
        ((?p ?i) . ?皮) ; skin; leather
        ((?p ?o) . ?破) ; to break; broken
        ((?p ?u) . ?普) ; general; widespread
        ((?q ?i) . ?起) ; to rise; to start; to initiate
        ((?q ?u) . ?去) ; to go; to leave
        ((?r ?e) . ?热) ; hot
        ((?r ?i) . ?日) ; day; sun
        ((?r ?u) . ?入) ; to enter
        ((?s ?a) . ?撒) ; to sprinkle; to scatter; to spread
        ((?s ?e) . ?色) ; color
        ((?s ?i) . ?四) ; four
        ((?s ?u) . ?速) ; speed; rapid
        ((?t ?a) . ?他) ; he; him
        ((?t ?e) . ?特) ; special; unique
        ((?t ?i) . ?提) ; to carry; to lift; to raise
        ((?t ?u) . ?图) ; diagram; chart; map
        ((?x ?i) . ?西) ; west
        ((?x ?u) . ?需) ; to need; to require
        ((?y ?i) . ?一) ; one; a
        ((?z ?a) . ?杂) ; mixed; miscellaneous
        ((?z ?e) . ?则) ; then; in that case
        ((?z ?i) . ?子) ; child; seed
        ((?z ?u) . ?组) ; group; to form a group
        ))

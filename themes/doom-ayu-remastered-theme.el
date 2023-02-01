;;; doom-ayu-remastered-theme.el --- inspired by Ayu -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: May 23, 2016 (28620647f838)
;; Author:
;; Maintainer:
;; Source:
;;
;;; Commentary:
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-ayu-remastered-theme nil
  "Options for the `doom-ayu-remastered' theme."
  :group 'doom-themes)

(defcustom doom-ayu-remastered-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-ayu-remastered-theme
  :type 'boolean)

(defcustom doom-ayu-remastered-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-ayu-remastered-theme
  :type 'boolean)

(defcustom doom-ayu-remastered-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-ayu-remastered-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-ayu-remastered
  "A dark theme inspired by Atom One Dark."

  ;; name        default   256           16
  (;; common
   (common-accent   '("#e6b450" "orange"  "orange" ))
   (common-bg       '("#111317" "black"   "black"  ))
   (common-line     '("#202226" "grey"    "grey"  ))
   (common-fg       '("#bfbdb6" "grey"    "grey"   ))
   (common-ui       '("#565b66" "grey"    "grey"   ))
   (test            '("#73b8ff" "grey"    "grey"   ))
   ;; syntax
   (syntax-tag      '("#39dae6" "cyan"    "blue"   ))
   (syntax-func     '("#ffb454" "yellow"  "yellow" ))
   (syntax-entity   '("#59b2ff" "blue"    "blue"   ))
   (syntax-string   '("#7fe962" "green"   "green"  ))
   (syntax-regexp   '("#75e6cb" "teal"    "green"  ))
   (syntax-markup   '("#f07158" "red"     "red"    ))
   (syntax-keyword  '("#ff8f20" "orange"  "orange" ))
   (syntax-special  '("#e6c673" "yellow"  "yellow" ))
   (syntax-comment  '("#475266" "grey"    "grey"   ))
   (syntax-constant '("#d2a6ff" "magenta" "purple" ))
   (syntax-operator '("#f29668" "orange"  "orange" ))
   (syntax-error    '("#d95757" "red"     "red"    ))
   ;; editor
   (editor-selection-active '("#1B3A5B" "grey" "grey"))
   ;; ui
   (alt-accent            (doom-lighten common-accent 0.4))
   (ui-line               (doom-darken common-bg 0.25))
   (ui-panel-shadow       (doom-darken common-bg 0.35))
   (ui-panel-border       (doom-darken common-bg 0.45))
   (ui-gutter-normal      (doom-darken common-ui 0.45))
   (ui-gutter-active      common-ui)
   (ui-selection-bg       (doom-blend common-bg test 0.8))
   (ui-selection-inactive (doom-lighten test 0.93))
   (ui-selection-border   (doom-lighten test 0.93))
   (ui-guide-normal       (doom-darken common-ui 0.35))
   (ui-guide-active       (doom-darken common-ui 0.75))
   (ui-org-block          (doom-darken common-bg 0.10))
   (elscreen-bg           (doom-darken common-ui 0.55))
   (elscreen-fg           ui-line)
   ;; vcs
   (vcs-added    '("#aad94c" "green" "green" ))
   (vcs-modified '("#39bae6" "blue"  "blue"  ))
   (vcs-removed  '("#f26d78" "red"   "red"   ))

   (bg         common-bg)
   (bg-alt     ui-line)
   (base0      ui-gutter-normal)
   (base1      ui-gutter-active)
   (base2      ui-selection-bg)
   (base3      ui-org-block)
   (base4      ui-selection-border)
   (base5      ui-guide-normal)
   (base6      ui-guide-normal)
   (base7      ui-panel-shadow)
   (base8      ui-panel-border)
   (fg         common-fg)
   (fg-alt     common-ui)

   (grey       ui-line)
   (red        syntax-markup)
   (orange     syntax-keyword)
   (green      syntax-string)
   (teal       syntax-regexp)
   (yellow     syntax-func)
   (blue       syntax-entity)
   (dark-blue  (doom-darken syntax-entity 0.2))
   (magenta    syntax-constant)
   (violet     (doom-lighten syntax-constant 0.2))
   (cyan       syntax-tag)
   (dark-cyan  test)

   ;; face categories -- required for all themes
   (highlight      common-accent)
   (vertical-bar   ui-panel-border)
   (selection      teal)
   (builtin        blue)
   (comments       (if doom-ayu-remastered-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-ayu-remastered-brighter-comments dark-cyan base5) 0.25))
   (constants      syntax-constant)
   (functions      syntax-func)
   (keywords       syntax-keyword)
   (methods        syntax-func)
   (operators      syntax-operator)
   (type           syntax-special)
   (strings        syntax-string)
   (variables      common-fg)
   (numbers        syntax-func)
   (region         ui-selection-bg)
   (error          syntax-error)
   (warning        yellow)
   (success        green)
   (vc-modified    vcs-modified)
   (vc-added       vcs-added)
   (vc-deleted     vcs-removed)


   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-ayu-remastered-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-ayu-remastered-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-ayu-remastered-padded-modeline
      (if (integerp doom-ayu-remastered-padded-modeline) doom-ayu-remastered-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-ayu-remastered-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-ayu-remastered-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-ayu-remastered-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ())

;;; doom-ayu-remastered-theme.el ends here

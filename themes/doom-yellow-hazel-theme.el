;;; doom-yellow-hazel-theme.el --- inspired by Atom One Dark -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: May 23, 2016 (28620647f838)
;; Author: Henrik Lissner <https://github.com/hlissner>
;; Maintainer: Henrik Lissner <https://github.com/hlissner>
;; Source: https://github.com/atom/one-dark-ui
;;
;;; Commentary:
;;
;; This themepack's flagship theme.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-yellow-hazel-theme nil
  "Options for the `doom-yellow-hazel' theme."
  :group 'doom-themes)

(defcustom doom-yellow-hazel-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-yellow-hazel-theme
  :type 'boolean)

(defcustom doom-yellow-hazel-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-yellow-hazel-theme
  :type 'boolean)

(defcustom doom-yellow-hazel-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-yellow-hazel-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-yellow-hazel
  "A dark theme inspired by Atom One Dark."

  ;; name        default   256           16
  ((bg         '("#121212" "black"       "black"  ))
   (fg         '("#BBBBBB" "#bfbfbf"     "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#1F1F1F" "black"       "black"        ))
   (fg-alt     '("#ACACAC" "#2d2d2d"     "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#121212" "black"       "black"        ))
   (base1      '("#1F1F1F" "#1e1e1e"     "brightblack"  ))
   (base2      '("#313131" "#2e2e2e"     "brightblack"  ))
   (base3      '("#434343" "#262626"     "brightblack"  ))
   (base4      '("#555555" "#3f3f3f"     "brightblack"  ))
   (base5      '("#8E8E8E" "#525252"     "brightblack"  ))
   (base6      '("#9D9D9D" "#6b6b6b"     "brightblack"  ))
   (base7      '("#ACACAC" "#979797"     "brightblack"  ))
   (base8      '("#BBBBBB" "#dfdfdf"     "white"        ))

   (grey       base4)
   (red        '("#FF7283" "#ff6655" "red"          ))
   (orange     '("#FFBB77" "#dd8844" "brightred"    ))
   (green      '("#879278" "#99bb66" "green"        ))
   (teal       '("#55BB99" "#44b9b1" "brightgreen"  ))
   (yellow     '("#EECC11" "#ECBE7B" "yellow"       ))
   (blue       '("#788792" "#51afef" "brightblue"   ))
   (dark-blue  '("#788792" "#2257A0" "blue"         ))
   (magenta    '("#C7C4D2" "#c678dd" "brightmagenta"))
   (violet     '("#B895F3" "#a9a1e1" "magenta"      ))
   (cyan       '("#5599BB" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5599BB" "#5699AF" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      yellow)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        red)
   (comments       (doom-darken orange 0.5))
   (doc-comments   yellow)
   (constants      teal)
   (functions      blue)
   (keywords       yellow)
   (methods        blue)
   (operators      yellow)
   (type           green)
   (strings        cyan)
   (variables      magenta)
   (numbers        teal)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        teal)
   (vc-modified    yellow)
   (vc-added       teal)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-yellow-hazel-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-yellow-hazel-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-yellow-hazel-padded-modeline
      (if (integerp doom-yellow-hazel-padded-modeline) doom-yellow-hazel-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-yellow-hazel-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-yellow-hazel-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-yellow-hazel-brighter-modeline modeline-bg highlight))
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

;;; doom-yellow-hazel-theme.el ends here

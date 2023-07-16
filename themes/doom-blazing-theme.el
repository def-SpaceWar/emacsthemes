;;; doom-blazing-theme.el --- port of blazing.nvim -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added:
;; Author:
;; Maintainer:
;; Source:
;;
;;; Commentary:
;;
;; Insert stuff
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-blazing-theme nil
  "Options for the `doom-blazing' theme."
  :group 'doom-themes)

(defcustom doom-blazing-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-blazing-theme
  :type 'boolean)

(defcustom doom-blazing-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-blazing-theme
  :type 'boolean)

(defcustom doom-blazing-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-blazing-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-blazing
  "A dark theme inspired by Gruber Darker"

  ;; name        default   256           16
  ((bg         '("#252920" "black"       "black"  ))
   (fg         '("#EFFFFF" "#bfbfbf"     "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#292D25" "black"       "black"        ))
   (fg-alt     '("#EAEFE0" "#2d2d2d"     "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#151910" "black"       "black"        ))
   (base1      '("#151910" "#1e1e1e"     "brightblack"  ))
   (base2      '("#252920" "#2e2e2e"     "brightblack"  ))
   (base3      '("#292D25" "#262626"     "brightblack"  ))
   (base4      '("#323C2E" "#3f3f3f"     "brightblack"  ))
   (base5      '("#41443D" "#525252"     "brightblack"  ))
   (base6      '("#A0A49C" "#6b6b6b"     "brightblack"  ))
   (base7      '("#B2B8A1" "#979797"     "brightblack"  ))
   (base8      '("#EAEFE0" "#dfdfdf"     "white"        ))

   (grey       base4)
   (red        '("#FF4230" "#ff6655" "red"          ))
   (orange     '("#FF9900" "#dd8844" "brightred"    ))
   (green      '("#BBFF00" "#99bb66" "green"        ))
   (teal       '("#33EECC" "#44b9b1" "brightgreen"  ))
   (yellow     '("#EEFF44" "#ECBE7B" "yellow"       ))
   (blue       '("#33CCEE" "#51afef" "brightblue"   ))
   (dark-blue  '("#33CCEE" "#2257A0" "blue"         ))
   (magenta    '("#EF3270" "#c678dd" "brightmagenta"))
   (violet     '("#DD88FF" "#a9a1e1" "magenta"      ))
   (cyan       '("#33DDDD" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#33DDDD" "#5699AF" "cyan"         ))
   (grey       '("#6D7248" "#999999" "grey"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      magenta)
   (builtin        red)
   (comments       grey)
   (doc-comments   blue)
   (constants      violet)
   (functions      green)
   (keywords       magenta)
   (methods        green)
   (operators      magenta)
   (type           teal)
   (strings        yellow)
   (variables      fg)
   (numbers        violet)
   (region         base1)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          fg-alt)
   (modeline-bg              (if doom-blazing-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-blazing-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-blazing-padded-modeline
      (if (integerp doom-blazing-padded-modeline) doom-blazing-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base6)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-blazing-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-blazing-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground teal)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-blazing-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground teal :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground teal)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background base2)
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

;;; doom-blazing-theme.el ends here

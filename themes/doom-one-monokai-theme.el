;;; doom-one-monokai-theme.el --- a mapping of monokai on doom-vibrant -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added:
;; Author:
;; Maintainer:
;; Source:
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-one-monokai-theme nil
  "Options for the `doom-one-monokai' theme."
  :group 'doom-themes)

(defcustom doom-one-monokai-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-one-monokai-theme
  :type 'boolean)

(defcustom doom-one-monokai-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-one-monokai-theme
  :type 'boolean)

(defcustom doom-one-monokai-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-one-monokai-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-one-monokai
  "A dark theme based off of doom-one with monokai's color pattern."

  ;; name        default   256           16
  ((bg         '("#282c34" "black"       "black"  ))
   (fg         '("#bbc2cf" "#bfbfbf"     "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#21242b" "black"       "black"        ))
   (fg-alt     '("#5B6268" "#2d2d2d"     "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#1B2229" "black"       "black"        ))
   (base1      '("#1c1f24" "#1e1e1e"     "brightblack"  ))
   (base2      '("#202328" "#2e2e2e"     "brightblack"  ))
   (base3      '("#23272e" "#262626"     "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f"     "brightblack"  ))
   (base5      '("#5B6268" "#525252"     "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b"     "brightblack"  ))
   (base7      '("#9ca0a4" "#979797"     "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf"     "white"        ))

   (grey       base4)
   (red        '("#ff6c6b" "#ff6655" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#98be65" "#99bb66" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#ECBE7B" "#ECBE7B" "yellow"       ))
   (blue       '("#51afef" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "brightmagenta"))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      teal)
   (vertical-bar   base0)
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-one-monokai-brighter-comments dark-cyan base5))
   (doc-comments   (if doom-one-monokai-brighter-comments (doom-lighten dark-cyan 0.15) (doom-lighten base4 0.3)))
   (constants      violet)
   (functions      green)
   (keywords       red)
   (methods        green)
   (operators      red)
   (type           blue)
   (strings        yellow)
   (variables      orange)
   (numbers        violet)
   (region         "#3d4451")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg             fg)
   (modeline-fg-inactive    (doom-blend blue grey (if doom-one-monokai-brighter-modeline 0.9 0.2)))
   (modeline-bg             (if doom-one-monokai-brighter-modeline
                                `("#383f58" ,@(cdr base1))
                              `(,(doom-darken (car bg) 0.15) ,@(cdr base1))))
   (modeline-bg-alt         (if doom-one-monokai-brighter-modeline
                                modeline-bg
                              `(,(car bg-alt) ,@(cdr base0))))
   (modeline-bg-inactive     `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0)))
   (modeline-bg-alt-inactive (doom-darken bg 0.25))

   (-modeline-pad
    (when doom-one-monokai-padded-modeline
      (if (integerp doom-one-monokai-padded-modeline) doom-one-monokai-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-one-monokai-brighter-comments (doom-darken bg-alt 0.095)))
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground blue :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-one-monokai-brighter-modeline base8 highlight))
   (org-block :background (doom-darken base3 0.1))

   ;;;; all-the-icons
   ((all-the-icons-dblue &override) :foreground dark-cyan)
   ;;;; centaur-tabs
   (centaur-tabs-unselected :background bg-alt :foreground base6)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar
    :background (if doom-one-monokai-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-path
    :foreground (if doom-one-monokai-brighter-modeline base8 blue) :bold bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; markdown-mode
   (markdown-header-face :inherit 'bold :foreground red)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-alt-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt-inactive)))
   ;;;; whitespace <built-in>
   (whitespace-empty :background base2))

  ;;;; Base theme variable overrides
  ;; ()
  )

;;; doom-one-monokai-theme.el ends here

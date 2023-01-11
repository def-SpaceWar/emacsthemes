;;; doom-spacewar-death-theme.el --- A Space War -*- lexical-binding: t; no-byte-compile: t; -*-
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

(defgroup doom-spacewar-death-theme nil
  "Options for the `doom-spacewar-death' theme."
  :group 'doom-themes)

(defcustom doom-spacewar-death-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-spacewar-death-theme
  :type 'boolean)

(defcustom doom-spacewar-death-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-spacewar-death-theme
  :type 'boolean)

(defcustom doom-spacewar-death-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-spacewar-death-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-spacewar-death
  "A dark theme based off of doom-one with more spacewar colors."

  ;; name        gui       256           16
  ((bg         '("#222222" "black"       "black" ))
   (fg         '("#DDDDDD" "#bfbfbf"     "brightwhite" ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#333333" "black"       "black"       ))
   (fg-alt     '("#BBBBBB" "#5d5d5d"     "white"       ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#111111" "#101010"     "black"       ))
   (base1      '("#222222" "#1e1e1e"     "brightblack" ))
   (base2      '("#333333" "#21212d"     "brightblack" ))
   (base3      '("#444444" "#262626"     "brightblack" ))
   (base4      '("#666666" "#5e5e5e"     "brightblack" ))
   (base5      '("#777777" "#666666"     "brightblack" ))
   (base6      '("#999999" "#7b7b7b"     "brightblack" ))
   (base7      '("#BBBBBB" "#979797"     "brightblack" ))
   (base8      '("#DDDDDD" "#dfdfdf"     "white"       ))

   (grey       '("#555555" "#5e5e5e" "grey"            ))
   (red        '("#FF0000" "#ff5577" "red"             ))
   (redtwo     '("#DD0044" "#ff6655" "red"             ))
   (redthree   '("#BB0033" "#dd8844" "brightred"       ))
   (blue       '("#0000FF" "#99bb66" "green"           ))
   (bluetwo    '("#4400DD" "#44b9b1" "brightgreen"     ))
   (bluethree  '("#3300BB" "#ECBE7B" "yellow"          ))
   (purple     '("#7700FF" "#51afef" "brightblue"      ))
   (purpletwo  '("#AA00CC" "#2257A0" "blue"            ))
   (yellow     '("#FFFF00" "#c678dd" "brightmagenta"   ))
   (green      '("#00FF00" "#a9a1e1" "magenta"         ))
   (orange     '("#FF9900" "#46D9FF" "brightcyan"      ))
   (cyan       '("#00FFFF" "#5699AF" "cyan"            ))
   (white      '("#ffffff" "#5699AF" "cyan"            ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      purple)
   (vertical-bar   base0)
   (selection      blue)
   (builtin        purple)
   ;(comments       (if doom-spacewar-death-brighter-comments (doom-lighten dark-cyan 0.2) teal))
   ;(doc-comments   (if doom-spacewar-death-brighter-comments (doom-lighten yellow 0.2) green))
   (comments       grey)
   (doc-comments   purpletwo)
   (constants      blue)
   (functions      purple)
   (keywords       redthree)
   (methods        purple)
   (operators      purpletwo)
   (type           red)
   (strings        bluetwo)
   (variables      white)
   (numbers        bluethree)
   (region         base2)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg             fg)
   (modeline-fg-inactive    (doom-blend purple grey (if doom-spacewar-death-brighter-modeline 0.9 0.2)))
   (modeline-bg             (if doom-spacewar-death-brighter-modeline
                                `("#383f58" ,@(cdr base1))
                              `(,(doom-darken (car bg) 0.15) ,@(cdr base1))))
   (modeline-bg-alt         (if doom-spacewar-death-brighter-modeline
                                modeline-bg
                              `(,(car bg-alt) ,@(cdr base0))))
   (modeline-bg-inactive     `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0)))
   (modeline-bg-alt-inactive (doom-darken bg 0.25))

   (-modeline-pad
    (when doom-spacewar-death-padded-modeline
      (if (integerp doom-spacewar-death-padded-modeline) doom-spacewar-death-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-spacewar-death-brighter-comments (doom-darken bg-alt 0.095)))
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground purple :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-spacewar-death-brighter-modeline base8 highlight))
   (org-block :background (doom-darken base3 0.1))

   ;;;; all-the-icons
   ;((all-the-icons-dblue &override) :foreground dark-cyan)
   ;;;; centaur-tabs
   (centaur-tabs-unselected :background bg-alt :foreground base6)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar
    :background (if doom-spacewar-death-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-path
    :foreground (if doom-spacewar-death-brighter-modeline base8 blue) :bold bold)
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
   (whitespace-empty :background base2)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground redtwo)
   ((outline-3 &override) :foreground redthree)
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground bluetwo)
   ((outline-6 &override) :foreground bluethree)
   ((outline-7 &override) :foreground purple)
   ((outline-8 &override) :foreground purpletwo)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground red)
   (rainbow-delimiters-depth-2-face :foreground redtwo)
   (rainbow-delimiters-depth-3-face :foreground redthree)
   (rainbow-delimiters-depth-4-face :foreground blue)
   (rainbow-delimiters-depth-5-face :foreground bluetwo)
   (rainbow-delimiters-depth-6-face :foreground bluethree)
   (rainbow-delimiters-depth-7-face :foreground purple)
   (rainbow-delimiters-depth-8-face :foreground purpletwo)
   )

  ;;;; Base theme variable overrides
  ;; ()
  )

;;; doom-spacewar-death-theme.el ends here

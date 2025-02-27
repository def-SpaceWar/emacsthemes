;;; doom-spacewar-theme.el --- A Space War -*- lexical-binding: t; no-byte-compile: t; -*-
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

(defgroup doom-spacewar-theme nil
  "Options for the `doom-spacewar' theme."
  :group 'doom-themes)

(defcustom doom-spacewar-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-spacewar-theme
  :type 'boolean)

(defcustom doom-spacewar-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-spacewar-theme
  :type 'boolean)

(defcustom doom-spacewar-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-spacewar-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-spacewar
  "A dark theme based off of doom-one with more spacewar colors."

  ;; name        gui       256           16
  ((bg         '("#141215" "black"       "black" ))
   (fg         '("#CFC8C2" "#bfbfbf"     "brightwhite" ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#252327" "black"       "black"       ))
   (fg-alt     '("#BEB7B2" "#5d5d5d"     "white"       ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#131215" "#101010"     "black"       ))
   (base1      '("#141216" "#1e1e1e"     "brightblack" ))
   (base2      '("#252328" "#21212d"     "brightblack" ))
   (base3      '("#36333B" "#262626"     "brightblack" ))
   (base4      '("#8B8483" "#5e5e5e"     "brightblack" ))
   (base5      '("#9C9593" "#666666"     "brightblack" ))
   (base6      '("#ADA6A3" "#7b7b7b"     "brightblack" ))
   (base7      '("#BEB7B3" "#979797"     "brightblack" ))
   (base8      '("#CFC8C3" "#dfdfdf"     "white"       ))

   (grey       '("#57545C" "#5e5e5e" "grey"            ))
   (red        '("#FF3560" "#ff5577" "red"             ))
   (redtwo     '("#FF5C54" "#ff6655" "red"             ))
   (orange     '("#FF8251" "#dd8844" "brightred"       ))
   (green      '("#9FDF54" "#99bb66" "green"           ))
   (teal       '("#53D0C1" "#44b9b1" "brightgreen"     ))
   (yellow     '("#EECC54" "#ECBE7B" "yellow"          ))
   (blue       '("#55AAFF" "#51afef" "brightblue"      ))
   (dark-blue  '("#3388DD" "#2257A0" "blue"            ))
   (magenta    '("#EC89F1" "#c678dd" "brightmagenta"   ))
   (violet     '("#AF8FFF" "#a9a1e1" "magenta"         ))
   (cyan       '("#54BBDD" "#46D9FF" "brightcyan"      ))
   (dark-cyan  '("#2F99BB" "#5699AF" "cyan"            ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      cyan)
   (vertical-bar   base0)
   (selection      violet)
   (builtin        red)
   (comments       (if doom-spacewar-brighter-comments (doom-lighten dark-cyan 0.1) dark-blue))
   (doc-comments   (if doom-spacewar-brighter-comments (doom-lighten yellow 0.1) green))
   (constants      blue)
   (functions      cyan)
   (keywords       red)
   (methods        cyan)
   (operators      magenta)
   (type           violet)
   (strings        orange)
   (variables      teal)
   (numbers        dark-cyan)
   (region         base2)
   (error          redtwo)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     redtwo)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg             fg)
   (modeline-fg-inactive    (doom-blend violet grey (if doom-spacewar-brighter-modeline 0.9 0.2)))
   (modeline-bg             (if doom-spacewar-brighter-modeline
                                `("#383f58" ,@(cdr base1))
                              `(,(doom-darken (car bg) 0.15) ,@(cdr base1))))
   (modeline-bg-alt         (if doom-spacewar-brighter-modeline
                                modeline-bg
                              `(,(car bg-alt) ,@(cdr base0))))
   (modeline-bg-inactive     `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0)))
   (modeline-bg-alt-inactive (doom-darken bg 0.25))

   (-modeline-pad
    (when doom-spacewar-padded-modeline
      (if (integerp doom-spacewar-padded-modeline) doom-spacewar-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-spacewar-brighter-comments (doom-darken bg-alt 0.095)))
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground violet :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-spacewar-brighter-modeline base8 highlight))
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
    :background (if doom-spacewar-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-path
    :foreground (if doom-spacewar-brighter-modeline base8 blue) :bold bold)
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
   ((outline-1 &override) :foreground orange)
   ((outline-2 &override) :foreground blue)
   ((outline-3 &override) :foreground red)
   ((outline-4 &override) :foreground cyan)
   ((outline-5 &override) :foreground violet)
   ((outline-6 &override) :foreground green)
   ((outline-7 &override) :foreground magenta)
   ((outline-8 &override) :foreground yellow)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground orange)
   (rainbow-delimiters-depth-2-face :foreground blue)
   (rainbow-delimiters-depth-3-face :foreground red)
   (rainbow-delimiters-depth-4-face :foreground cyan)
   (rainbow-delimiters-depth-5-face :foreground violet)
   (rainbow-delimiters-depth-6-face :foreground green)
   (rainbow-delimiters-depth-7-face :foreground magenta)
   (rainbow-delimiters-depth-8-face :foreground yellow)
   )

  ;;;; Base theme variable overrides
  ;; ()
  )

;;; doom-spacewar-theme.el ends here

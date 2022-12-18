;;; doom-newlife-lowcontrast-theme.el --- ported from Aryan Ahire's newlife colorscheme pack
;;
;; Added: September 15, 2016 (32f8b5ae5feb)
;; Author: Henrik Lissner <https://github.com/hlissner>
;; Maintainer:
;; Source: https://github.com/def-SpaceWar/newlife.nvim
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-newlife-lowcontrast-theme nil
  "Options for the `doom-newlife-lowcontrast' theme."
  :group 'doom-themes)

(defcustom doom-newlife-lowcontrast-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-newlife-lowcontrast-theme
  :type 'boolean)

(defcustom doom-newlife-lowcontrast-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-newlife-lowcontrast-theme
  :type 'boolean)

(defcustom doom-newlife-lowcontrast-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-newlife-lowcontrast-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-newlife-lowcontrast
  "A dark, vibrant theme inspired by Textmate's Monokai."

  ;; name        gui       256       16
  ((bg         '("#21262B" "black"   "black"        ))
   (fg         '("#B0B0BF" "#dfdfdf" "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#43484D" "black"   "black"        ))
   (fg-alt     '("#B0BFBF" "#4d4d4d" "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#03080D" "black"   "black"        ))
   (base1      '("#12171C" "#101010" "brightblack"  ))
   (base2      '("#21262B" "#191919" "brightblack"  ))
   (base3      '("#32373C" "#252525" "brightblack"  ))
   (base4      '("#43484D" "#454545" "brightblack"  ))
   (base5      '("#6A6C7F" "#6b6b6b" "brightblack"  ))
   (base6      '("#90909F" "#7b7b7b" "brightblack"  ))
   (base7      '("#A0AFAF" "#c1c1c1" "brightblack"  ))
   (base8      '("#B0BFBF" "#ffffff" "brightwhite"  ))

   (grey       '("#43484D" "#515154" "brightblack"  ))
   (red        '("#FF588F" "#e74c3c" "red"          ))
   (orange     '("#FFAC62" "#fd971f" "brightred"    ))
   (green      '("#88DD77" "#b6e63e" "green"        ))
   (teal       '("#44CC99" "#101010" "green"        ))
   (yellow     '("#AA7744" "#e2c770" "yellow"       ))
   (blue       '("#22BBEE" "#2686D6" "brightblue"   ))
   (dark-blue  '("#5EA4EE" "#727280" "blue"         ))
   (magenta    '("#FF77CC" "#fb2874" "magenta"      ))
   (violet     '("#AA77CC" "#9c91e4" "brightmagenta"))
   (cyan       '("#55CCCC" "#66d9ef" "brightcyan"   ))
   (dark-cyan  '("#3377BB" "#8FA1B3" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      magenta)
   (vertical-bar   (doom-lighten bg 0.1))
   (selection      base5)
   (builtin        magenta)
   (comments       (if doom-newlife-lowcontrast-brighter-comments
		       violet
		     yellow))
   (doc-comments   (if doom-newlife-lowcontrast-brighter-comments
                       (doom-lighten violet 0.1)
                     dark-cyan))
   (constants      blue)
   (functions      green)
   (keywords       red)
   (methods        green)
   (operators      red)
   (type           teal)
   (strings        dark-blue)
   (variables      magenta)
   (numbers        blue)
   (region         base4)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg          fg)
   (modeline-fg-alt      base4)
   (modeline-bg          (if doom-newlife-lowcontrast-brighter-modeline base2 base1))
   (modeline-bg-inactive (if doom-newlife-lowcontrast-brighter-modeline base3 base2))
   (org-quote `(,(doom-lighten (car bg) 0.05) base1))

   (-modeline-pad
    (when doom-newlife-lowcontrast-padded-modeline
      (if (integerp doom-newlife-lowcontrast-padded-modeline) doom-newlife-lowcontrast-padded-modeline 4))))


  ;;;; Base theme face overrides
  ((cursor :background red)
   (lazy-highlight :background magenta :foreground base0 :distant-foreground base0 :bold bold)
   ((line-number &override) :foreground dark-cyan :distant-foreground nil)
   ((line-number-current-line &override) :foreground (doom-lighten dark-cyan 0.1) :distant-foreground nil)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color modeline-bg-inactive)))
   (isearch :foreground base0 :background green)

   ;;;; centaur-tabs
   (centaur-tabs-active-bar-face :background green)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground green)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground green)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground keywords)
   ;;;; doom-modeline
   (doom-modeline-bar :background red)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'bold :foreground blue)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   (doom-modeline-buffer-modified :inherit 'bold :foreground orange)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A :background (doom-blend teal bg 0.3) :weight 'bold)
   ;;;; evil
   (evil-search-highlight-persist-highlight-face :background magenta)
   ;;;; evil-snipe
   (evil-snipe-first-match-face :foreground base0 :background green)
   (evil-snipe-matches-face     :foreground green :underline t)
   ;;;; flycheck
   (flycheck-error   :underline `(:style wave :color ,red)    :background base3)
   (flycheck-warning :underline `(:style wave :color ,orange) :background base3)
   (flycheck-info    :underline `(:style wave :color ,blue)  :background base3)
   ;;;; helm
   (helm-swoop-target-line-face :foreground red :inverse-video t)
   ;;;; ivy
   (ivy-current-match :background base3)
   (ivy-minibuffer-match-face-1 :background base1 :foreground base4)
   ;;;; markdown-mode
   (markdown-blockquote-face :inherit 'italic :foreground teal)
   (markdown-list-face :foreground red)
   (markdown-pre-face  :foreground blue)
   (markdown-link-face :inherit 'bold :foreground dark-blue)
   ((markdown-code-face &override) :background (doom-lighten base2 0.045))
   ;;;; neotree
   (neo-dir-link-face   :foreground cyan)
   (neo-expand-btn-face :foreground magenta)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground teal)
   ;;;; org <built-in>
   (org-ellipsis :foreground teal)
   (org-tag :foreground dark-blue :bold nil)
   ((org-quote &override) :foreground base7)
   (org-todo :foreground dark-blue :bold 'inherit)
   (org-list-dt :foreground dark-blue)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground red)
   (rainbow-delimiters-depth-2-face :foreground orange)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground teal)
   (rainbow-delimiters-depth-5-face :foreground cyan)
   (rainbow-delimiters-depth-6-face :foreground blue)
   (rainbow-delimiters-depth-7-face :foreground dark-blue))

  ;;;; Base theme variable overrides
  ;; ()
  )

;;; doom-newlife-lowcontrast-theme.el ends here

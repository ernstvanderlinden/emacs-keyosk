;;; keyosk.el --- bind keys neatly -*- lexical-binding: t -*-

;; Copyright (C) 2019

;; Author: Ernst M. van der Linden <ernst.vanderlinden@ernestoz.com>
;; URL: https://github.com/ernstvanderlinden/keyosk
;; Version: 1.0.0
;; Package-Requires: ((evil))
;; Keywords: convenience

;; This file is part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;;  bind keys neatly
;;
;; To enable keyosk on Emacs startup, add following to your init.el:
;;
;;   (require 'keyosk)
;;
;; Once added to your init.el and/or evaluated code above, you can
;; bind keys like this:
;;
;; (keyosk-define-key
;;  (evil-motion-state-map
;;   evil-insert-state-map)
;;  ("M-d" nil)
;;  ("M-n" 'my-swiper-at-point))

;; (keyosk-evil-define-key
;;  '(normal visual) 
;;  (org-mode-map)
;;  ("zo" 'outline-show-subtree)
;;  ("zr" 'outline-show-all))

(require 'evil)

(defmacro keyosk-define-key (maps &rest bindings)
  `(dolist (map (list ,@maps))
     ,@(mapcar
        (lambda (x)
          `(define-key map (kbd ,(car x)) ,(cadr x) ))
        bindings)))

(defmacro keyosk-evil-define-key (states maps &rest bindings)
  `(dolist (map (list ,@maps))
     ,@(mapcar
        (lambda (x)
          `(evil-define-key* ,states map (kbd ,(car x)) ,(cadr x) ))
        bindings)))

(provide 'keyosk)
;;; keyosk.el ends here

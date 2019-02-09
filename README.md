Emacs - keyosk
==============
Emacs package to bind keys neatly.

Install
-------
#### Clone
As this package is not on [Melpa](https://melpa.org) (yet), clone this repo and call ```package-install-file``` or simply add a ```load-path``` which points to **keyosk** local repo. If you prefer, you could use [quelpa](https://github.com/quelpa/quelpa) as well.

#### Startup
To enable **keyosk** on Emacs startup, add the following to your init.el:

```elisp
(require 'keyosk)
```

#### Dependency
This package depends on [evil](https://melpa.org/#/evil), so please make sure that has been installed as well.

Usage
-----
#### Example 1 - keyosk-define-key
```elisp
(keyosk-define-key
 (evil-motion-state-map
  evil-insert-state-map)
 ("M-d" nil)
 ("M-n" 'my-swiper-at-point))))
```
#### Example 2 - keyosk-evil-define-key
```elisp
(keyosk-evil-define-key
 '(normal visual) 
 (org-mode-map)
 ("zo" 'outline-show-subtree)
 ("zr" 'outline-show-all))
```

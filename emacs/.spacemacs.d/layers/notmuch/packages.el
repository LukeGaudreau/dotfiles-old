;;; packages.el --- notmuch layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Luke Gaudreau <luke@infosoph.org>
;; URL: https://github.com/LukeGaudreau/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst notmuch-packages
  '(notmuch))

(defun notmuch/init-notmuch ()
  (use-package notmuch
    :defer t
    :commands notmuch
    :init
    (progn
      (spacemacs/set-leader-keys "a M" 'notmuch)
      (spacemacs/set-leader-keys "a m" 'notmuch-jump-search)
      (load-library "org-notmuch")
      (push "\\*notmuch-.+\\*" spacemacs-useful-buffers-regexp))
    :config
    (progn
      (setq notmuch-search-oldest-first nil)
      (evil-add-hjkl-bindings notmuch-hello-mode-map 'emacs)
      (evil-set-initial-state 'notmuch-hello-mode 'emacs)
      (evilified-state-evilify notmuch-show-mode notmuch-show-mode-map
        (kbd "J") 'notmuch-show-next-message
        (kbd "j") 'notmuch-show-next-open-message
        (kbd "K") 'notmuch-show-previous-message
        (kbd "k") 'notmuch-show-previous-open-message
        (kbd "s") 'notmuch-jump-search)
      (evilified-state-evilify notmuch-show-mode notmuch-show-stash-map)
      (evilified-state-evilify notmuch-show-mode notmuch-show-part-map)
      (evilified-state-evilify notmuch-tree-mode notmuch-tree-mode-map)
      (evilified-state-evilify notmuch-search-mode notmuch-search-mode-map)
        )))


;;; packages.el ends here

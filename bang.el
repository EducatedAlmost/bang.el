;;; bang.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 AlmostEducated
;;
;; Author: AlmostEducated <https://github.com/EducatedAlmost>
;; Maintainer: AlmostEducated <EducatedAlmost@gmail.com>
;; Created: October 18, 2021
;; Modified: October 18, 2021
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/EducatedAlmost/bang
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(require 'org-roam)

(defun bang (prefix term)
  "Using !Bang, search for TERM in website with corresponding PREFIX."
  (interactive
   "sEnter the Bang prefix:
sEnter the term you wish to search:")
  (browse-url
   (concat
    "https://duckduckgo.com/?q=!"
    prefix " " term)))

(defun bang-roam (prefix)
  "Use the node's title to search using the Bang PREFIX."
  (interactive "sEnter the bang prefix: ")
  (bang prefix
   (org-roam-node-title
    (org-roam-node-at-point))))

(defun bang-roam-wiki ()
  "Use the node's title to find the corresponding Wikipedia entry."
  (interactive)
  (bang-roam "w"))

(provide 'bang)

;;; bang.el ends here

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

(defun bang-make-link (prefix term)
  "Make the link that is used to search with Bangs, '!PREFIX TERM'."
  (concat "https://duckduckgo.com/?q=!" prefix "+" term))

(defun bang (prefix term)
  "Using Bang, search for TERM in website with corresponding PREFIX."
  (interactive
   (list (read-string "Enter the Bang prefix: ")
         (read-string "Enter the term you wish to search: "
                      (when (use-region-p)
                        (buffer-substring (region-beginning) (region-end))))))
  (browse-url (bang-make-link prefix term)))

(defun bang-info ()
  "Visit the homepage for Bangs."
  (interactive)
  (bang "bang" ""))

(defun bang-find-prefix (website)
  "Find the Bang prefix for WEBSITE."
  (interactive "sWebsite: ")
  (bang "bang" website))

(defvar bang-roam-support nil)

(when bang-roam-support
  (require 'org-roam)

  (defun bang-roam (prefix)
    "Use the node's title to search using the Bang PREFIX."
    (interactive "sEnter the bang prefix: ")
    (condition-case nil
        (bang prefix (org-roam-node-title (org-roam-node-at-point)))
      (error (message "Error: not inside an org-roam node."))))

  (defun bang-roam-wiki ()
    "Use the node's title to find the corresponding Wikipedia entry."
    (interactive)
    (bang-roam "w"))

  (provide 'bang-roam))

(provide 'bang)

;;; bang.el ends here

;; load common lisp feature
(require 'cl-lib)

;; add melpa to list of packages
(require 'package)
(package-initialize)

;;add settings directory and packages directory to the load path
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d/packages")

;;load the correct customizations based on emacs version
(cond
   ((>= emacs-major-version 24) (setq custom-file "~/.emacs.d/settings/custom-24.el"))
   (t (setq custom-file "~/.emacs.d/settings/custom-generic.el")))

(load custom-file)

;;find-files-in-project - For linking source and header C++ files.

;;requires ggtags
(defconst enable-ggtags t "Enable/Disable use of ggtags. ggtags is based on GNU Global which uses exhuberant ctags as a backend")

;; requires yasnippet
(defconst enable-yasnippet t "Enable/Disbale snippet expansion")

;; requires auto-complete-c-headers
(defconst enable-autocomplete t)
(defconst enable-autocomplete-c-headers t) ;; make sure you specify the path to c++ source libraries correctly

;; requires elpy. (also pip install elpy and pip install jedi && pip install rope)
(defconst enable-elpy t)

;; available by default
(defconst enable-semantic t)

;;requires magit
(defconst enable-magit t "A front-end to GIT version control system")

;; requires sr-speedbar
(defconst enable-sr-speedbar t "Enable tree-browser")

;;requires iedit
(defconst enable-iedit t "Enable iedit mode")

;;requires flymake-google-cpplint, flymake-cursor; pip install cpplint
(defconst enable-flymake-google-cpplint nil "Enable iedit mode") ;;make sure python environmnet is correctly setup and cpplint is installed (via pip) & functions.el updated to refer to cpplint

;;requires google-c-style
(defconst enable-google-c-style nil "Confirm to google c style")

;;dependencies for web development
;;js2-mode - A major mode for javascript editing
;;js2-highlight-vars
(defconst enable-js2-mode nil "Enable js2-mode for editing pure javascript files")
;;ac-js2 - autocomplete mode for js2-mode
;;json-mode - Major mode for json files
;;json-reformat
;;json-snatcher
;;simple-https
;;skewer-mode


(load "functions.el")
(load "packages.el")
(load "hooks.el")
(load "sr-speedbar.el")




;; Function to switch between C/C++ header source files.
(defun toggle-source-header ()
  (interactive)
  (when (string-match "^\\(.*\\)\\.\\([^.]*\\)$" buffer-file-name)
    (let ((name (match-string 1 buffer-file-name))
          (suffix (match-string 2 buffer-file-name)))
      (cond ((string-match suffix "cpp\\|cc\\|c\\|CPP\\|CC\\|C\\|hcpp\\|icpp")
             (cond ((file-exists-p (concat name ".hpp"))
                    (find-file (concat name ".hpp")))
                   ((file-exists-p (concat name ".hh"))
                    (find-file (concat name ".hh")))
                   ((file-exists-p (concat name ".h"))
                    (find-file (concat name ".h")))
                   ((file-exists-p (concat name ".HPP"))
                    (find-file (concat name ".HPP")))
                   ((file-exists-p (concat name ".HH"))
                    (find-file (concat name ".HH")))
                   ((file-exists-p (concat name ".H"))
                    (find-file (concat name ".H")))))
            ((string-match suffix "h\\|hh\\|hpp\\|HPP\\|HH\\|H")
             (cond ((file-exists-p (concat name ".cpp"))
                    (find-file (concat name ".cpp")))
                   ((file-exists-p (concat name ".hcpp"))
                    (find-file (concat name ".hcpp")))
                   ((file-exists-p (concat name ".cc"))
                    (find-file (concat name ".cc")))
                   ((file-exists-p (concat name ".c"))
                    (find-file (concat name ".c")))
                   ((file-exists-p (concat name ".CPP"))
                    (find-file (concat name ".CPP")))
                   ((file-exists-p (concat name ".CC"))
                    (find-file (concat name ".CC")))
                   ((file-exists-p (concat name ".icpp"))
                    (find-file (concat name ".icpp")))
                   ((file-exists-p (concat name ".C"))
                    (find-file (concat name ".C")))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function to enable auto complete of C/C++ standard headers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my:ac-c-headers-init()
  (when enable-autocomplete-c-headers
    (require 'auto-complete-c-headers)
    (add-to-list 'ac-sources 'ac-source-c-headers)
    ;;(add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-redhat-linux/4.8.3/../../../../include/c++/4.8.3")
    (add-to-list 'achead:include-directories '"/home/rajatgirotra/tools/miniconda2/envs/dev/gcc/include/c++")
    (add-to-list 'achead:include-directories '"/home/rajatgirotra/tools/miniconda2/envs/dev/gcc/include/c++/x86_64-unknown-linux-gnu")
    (add-to-list 'achead:include-directories '"/home/rajatgirotra/tools/miniconda2/envs/dev/gcc/include/c++/backward")
    (add-to-list 'achead:include-directories '"/home/rajatgirotra/tools/miniconda2/envs/dev/include/boost")
    (add-to-list 'achead:include-directories '"/home/rajatgirotra/tools/miniconda2/envs/dev/include/python2.7")
    ;;(add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-redhat-linux/4.8.3/include")
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function to add semantic as a backend to auto-complete.
;; This will enable intellisense.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my:add-semantic-to-autocomplete()
  (when enable-semantic
    (add-to-list 'ac-sources 'ac-source-semantic)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function to enable flymake-google-cpplint
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my:flymake-google-cpplint()
  (when enable-flymake-google-cpplint
    (require 'flymake-google-cpplint)
    (custom-set-variables
     '(flymake-google-cpplint-command "/home/rajatgirotra/tools/miniconda2/envs/dev/bin/cpplint"))
     ;;'(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
    (flymake-google-cpplint-load)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function to enable google-c-style
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my:google-c-style()
  (when enable-google-c-style
    (require 'google-c-style)))


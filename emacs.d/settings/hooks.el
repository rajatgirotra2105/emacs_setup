
;; Enable ggtags when in C/C++ mode 
;; enable function to switch between c/c++ header and source file.
(add-hook 'c-mode-common-hook
   (lambda () (when (derived-mode-p 'c-mode 'c++-mode)
                ;;(global-set-key (kbd "<backtab>") 'toggle-source-header)
                (global-set-key (kbd "<backtab>") 'ff-get-other-file)
                (if enable-ggtags
                   (ggtags-mode t)))))

;; Enable auto complete of C/C++ headers in C/C++mode.
(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; Add semantic as a backend when in C mode.
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; hook for flymake google cpp lint
(add-hook 'c++-mode-hook 'my:flymake-google-cpplint)
(add-hook 'c-mode-hook 'my:flymake-google-cpplint)

;; hook for google-c-style
(add-hook 'c++-mode-hook 'my:flymake-google-cpplint)
(add-hook 'c-mode-hook 'my:flymake-google-cpplint)

;; google-c-style
(add-hook 'c-mode-common-hook
   (lambda () (when (derived-mode-p 'c-mode 'c++-mode)
                'my:google-c-style
                (if enable-google-c-style
                    'google-set-c-style)
                (if enable-google-c-style
                    'google-make-newline-indent))))

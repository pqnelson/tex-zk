(require 'calc-bin)

(defvar zk-dir "~/src/tex-zk")
(defvar zk-tex-dir (format "%s/tex" zk-dir))

(defun get-zk-tex-dir-path ()
  (expand-file-name zk-tex-dir))

;; TODO: prepopulate this somehow?
(defvar zk-namespaces-coll '())

(defun zk-mode-complete-namespaces ()
  zk-namespaces-coll)

(defvar zk-namespace-default "xxx")

(defvar zk-recent-file nil)

(defun pad-zeroes (f n)
  (format "%s%s" (make-string (- n (length f)) ?0) f))

(defun zk-new-node ()
  (interactive)
  (assq-delete-all 'latex auto-insert-alist)
  (let ((choice (completing-read
                 (format "ZK namespace [%s]: "
                         zk-namespace-default)
                 (zk-mode-complete-namespaces)
                 nil nil nil nil
                 zk-namespace-default)))
    (setq zk-namespace-default choice)
    (let* ((num (string-to-number (shell-command-to-string
                                   (format "ls -l ~/src/tex-zk/tex/%s-*.tex | wc -l"
                                    choice))))
           (ns (format "%s-%s"
                       choice
                       (let ((calc-number-radix 36))
                         (pad-zeroes (math-format-radix num) 4)))))
      (setq zk-recent-file (format "%s/%s.tex"
                                   (get-zk-tex-dir-path)
                                   ns))
      (assq-delete-all 'latex auto-insert-alist)
      (find-file (format "%s/%s.tex"
                         (get-zk-tex-dir-path)
                         ns))
      (insert "\\begin{node}\\label{" ns "}%\n\n\\end{node}\n")
      (goto-line 2))))

(defun zk-transclude ()
  (interactive)
  (let* ((default (car (split-string
                       (file-relative-name zk-recent-file zk-tex-dir)
                       ".tex")))
         (choice (completing-read
                 (format "Transclude [%s]: "
                         default)
                 nil nil nil nil nil
                 default)))
    (insert "\\transclude{" choice "}")))

(keymap-global-set "C-c C-n" #'zk-new-node)

(global-set-key "\C-ct" #'zk-transclude)



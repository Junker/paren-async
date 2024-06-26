(in-package :paren-async)

;; source: https://gist.github.com/ralt/57a3811ca7ed734295e87393b9964cbe

(ps::defprinter ps-js::await (x)
  (ps::psw (string-downcase "await "))
  (ps::ps-print x))

(ps::define-trivial-special-ops
    await ps-js::await)

(ps::define-statement-operator defun-async (name lambda-list &rest body)
  (multiple-value-bind (effective-args body-block docstring)
      (ps::compile-named-function-body name lambda-list body)
    (list 'ps-js::defun-async name effective-args docstring body-block)))

(ps::defprinter ps-js::defun-async (name args docstring body-block)
  (when docstring (ps::print-comment docstring))
  (ps::psw "async ")
  (ps::print-fun-def name args body-block))

(ps::define-expression-operator lambda-async (lambda-list &rest body)
  (multiple-value-bind (effective-args effective-body)
      (ps::parse-extended-function lambda-list body)
    `(ps-js::lambda-async ,effective-args
                          ,(let ((ps::*function-block-names* ()))
                             (ps::compile-function-body effective-args effective-body)))))

(ps::defprinter ps-js::lambda-async (args body-block)
  (ps::psw "async ")
  (ps::print-fun-def nil args body-block))

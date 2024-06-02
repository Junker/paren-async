(defpackage paren-async
  (:use #:cl)
  (:export #:encode
           #:decode
           #:*alphabet*
           #:*salt*
           #:*min-hash-length*))
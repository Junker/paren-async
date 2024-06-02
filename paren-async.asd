(defsystem paren-async
  :version "0.1.0"
  :depends-on ("parenscript")
  :description "async/await extension for Parenscript"
  :homepage "https://github.com/Junker/paren-async"
  :source-control (:git "https://github.com/Junker/paren-async.git")
  :components ((:file "package")
               (:file "paren-async")))

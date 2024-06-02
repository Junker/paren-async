# Paren-Async

async/await extension for Parenscript

## Installation

This system can be installed from [UltraLisp](https://ultralisp.org/) like this:

```lisp
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload "paren-async")
```

## Usage

```common-lisp
(async-defun foo ()
  ...)

(let ((bar (await (foo))))
  ...)

(async-lambda () (await (foo)))
```

## Credits

**original source:** https://gist.github.com/ralt/57a3811ca7ed734295e87393b9964cbe

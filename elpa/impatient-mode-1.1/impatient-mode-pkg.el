;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "impatient-mode" "1.1"
  "Serve buffers live over HTTP."
  '((cl-lib       "0.3")
    (simple-httpd "1.4.0")
    (htmlize      "1.40"))
  :url "https://github.com/netguy204/imp.el"
  :commit "96c068d5add95595dc5be42115d100cf99f908ba"
  :revdesc "1.1-0-g96c068d5add9"
  :authors '(("Brian Taylor" . "el.wubo@gmail.com"))
  :maintainers '(("Brian Taylor" . "el.wubo@gmail.com")))

(use-modules
  (gnu packages sdl)
  (gnu packages stb)
  (gnu packages lua)
  (guix packages)
  (guix licenses)
  (guix build-system copy)
  (guix git-download))

; Note: User configuration can be placed at ‘~/.config/lite/user’

(define-public lite
  (package
    (name "lite")
    (version "1.11")
    (home-page "https://github.com/rxi/lite")
    (synopsis " A lightweight text editor written in Lua")
    (description "lite is a lightweight text editor written mostly in Lua — it aims to provide something practical, pretty, small and fast, implemented as simply as possible; easy to modify and extend, or to use without doing either.")
    (license (non-copyleft "file:///LICENSE"))
    
    (inputs `(("lua" ,lua) ("sdl2" ,sdl2) ("stb-truetype" ,stb-truetype)))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/rxi/lite")
            (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256 (base32 "0wxqfb4ly8g7w5qph76xys95b55ackkags8jgd1nasmiyi8gcd5a"))
        (patches (list (string-append (dirname current-filename) "/patches/lite.patch")))))
    
    (build-system copy-build-system)
    
    (arguments
      '(#:phases
          (modify-phases %standard-phases
            (add-before 'install 'build
              (lambda* (#:key outputs #:allow-other-keys)
                (system* "./build.sh")
                #t)))
        #:install-plan '(("lite" "bin/") ("data" "share/lite/"))))))

lite

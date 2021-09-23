(define-module (zamfofex games liquidwar6))

(use-modules
  (guix packages)
  (guix download)
  (guix build-system gnu)
  ((guix licenses) #:prefix license:)
  (gnu packages guile)
  (gnu packages compression)
  (gnu packages xml)
  (gnu packages sqlite)
  (gnu packages ncurses)
  (gnu packages curl)
  (gnu packages readline)
  (gnu packages documentation)
  (gnu packages python)
  (gnu packages perl)
  (gnu packages graphviz)
  (gnu packages sdl)
  (gnu packages gl)
  (gnu packages video))

(define-public liquidwar6
  (package
    (name "liquidwar6")
    (version "0.6.3902")
    (synopsis "Liquid War 6 is a unique multiplayer wargame.")
    (description
      (string-append
        "Liquid War 6 is a unique multiplayer wargame. Your army is a blob of"
        "liquid and you have to try and eat your opponents. Rules are very"
        "simple yet original, they have been invented by Thomas Colcombet."))
    (home-page "https://www.gnu.org/software/liquidwar6/")
    (license license:gpl3+)
    
    (inputs
      `(("guile" ,guile-2.0)
        ("zlib" ,zlib)
        ("expat" ,expat)
        ("sqlite" ,sqlite)
        ("ncurses" ,ncurses)
        ("readline" ,readline)
        ("curl" ,curl)
        ("doxygen" ,doxygen)
        ("python2" ,python-2)
        ("libxslt" ,libxslt)
        ("perl" ,perl)
        ("libxslt" ,libxslt)
        ("graphviz" ,graphviz)
        ("sdl" ,sdl)
        ("sdl-image" ,sdl-image)
        ("sdl-ttf" ,sdl-ttf)
        ("sdl-mixer" ,sdl-mixer)
        ("glu" ,glu)
        ("libcaca" ,libcaca)))
    
    (source
      (origin
        (method url-fetch)
        (uri (string-append "mirror://gnu/liquidwar6/liquidwar6-" version ".tar.gz"))
        (sha256 (base32  "1976nnl83d8wspjhb5d5ivdvdxgb8lp34wp54jal60z4zad581fn"))))
    
    (build-system gnu-build-system)
    (arguments
      '(#:configure-flags
         (list
           "--enable-allinone"
           "CFLAGS=-Wno-error"
           (string-append "CPPFLAGS="
             " -iquote " (assoc-ref %build-inputs "sdl") "/include/SDL"
             " -I" (assoc-ref %build-inputs "sdl-image") "/include/SDL"
             " -I" (assoc-ref %build-inputs "sdl-mixer") "/include/SDL"
             " -I" (assoc-ref %build-inputs "sdl-ttf") "/include/SDL"))))))

liquidwar6

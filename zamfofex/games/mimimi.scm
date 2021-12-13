(define-module (zamfofex games mimimi))

(use-modules
  (guix packages)
  (guix download)
  (guix build-system copy)
  (guix utils)
  (gnu packages)
  (gnu packages sdl)
  (gnu packages llvm)
  ((guix licenses) #:prefix license:))

(define* (url version) (string-append "https://zamfofex.neocities.org/mimimi/mimimi-" version ".tar"))

(define-public mimimi-M2
  (package
    (name "mimimi")
    (version "M2")
    (synopsis "a Senran Kagura fangame")
    (description synopsis)
    (home-page "https://zamfofex.neocities.org/mimimi/")
    (license license:agpl3+)
    
    (inputs `(("sdl2" ,sdl2)))
    
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "0kiic9xphdzwgnzs1vb9wdb00mchd9lz1ddc04cifisj9xryd1n2"))))
    
    (outputs '("out" "lib" "static"))
    (build-system copy-build-system)
    (arguments
      `(#:phases
         (modify-phases %standard-phases
           (add-before 'install 'build-sdl
             (lambda* (#:key outputs #:allow-other-keys)
               (system* "make" "CFLAGS=-O3" (string-append "CC=" ,(cc-for-target)))
               #t))
           (add-after 'build-sdl 'build-lib
             (lambda* (#:key outputs #:allow-other-keys)
               (system* ,(cc-for-target) "-fPIC" "-shared" "-O3" "-o" "libmimimi.so" "game.c")))
           (delete 'install)
           (add-after 'build-lib 'install-sdl
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (bin (string-append out "/bin")))
                 (mkdir-p bin)
                 (install-file "mimimi" bin)
                 #t)))
           (add-after 'install-sdl 'install-lib
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "lib"))
                      (lib (string-append out "/lib")))
                 (mkdir-p lib)
                 (install-file "libmimimi.so" lib)
                 #t)))
           (add-after 'install-lib 'install-static
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "static"))
                      (lib (string-append out "/lib")))
                 (mkdir-p lib)
                 (install-file "game.o" (string-append lib "/libmimimi.o"))
                 #t)))
           (add-after 'install-static 'install-headers
             (lambda* (#:key outputs #:allow-other-keys)
               (map
                 (lambda (name)
                   (let* ((out (assoc-ref outputs name))
                          (include (string-append out "/include/mimimi")))
                     (mkdir-p include)
                     (install-file "game.h" include)
                     #t))
                 '("lib" "static")))))))))

(define-public mimimi-M3
  (package (inherit mimimi-M2)
    (version "M3")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "1a3283r8dx123441cxidw10biaqll7g681nb158pllhjdwpbnxgg"))))))

(define-public mimimi-M4
  (package (inherit mimimi-M3)
    (version "M4")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "1siahdy39gf9qnc1ijbim37qk418c5j00d8qrsi5355nrn64wz8k"))))
    (native-inputs `(("clang" ,clang) ("lld" ,lld)))
    (outputs (append (package-outputs mimimi-M3) '("web")))
    (arguments
      (substitute-keyword-arguments (package-arguments mimimi-M3)
        ((#:phases phases)
          `(modify-phases ,phases
             (add-after 'build-sdl 'build-web
               (lambda* (#:key outputs #:allow-other-keys)
                 (system* "make" "engine=wasm" "CFLAGS=-O3" "CC=clang" "CFLAGS=-ffreestanding")
                 #t))
             (add-after 'install-sdl 'install-web
               (lambda* (#:key outputs #:allow-other-keys)
                 (let* ((out (assoc-ref outputs "web"))
                        (www (string-append out "/share/www/mimimi")))
                   (mkdir-p www)
                   (install-file "index.html" www)
                   (install-file "main.js" www)
                   (install-file "mimimi.wasm" www)
                   #t)))))))))

(define-public mimimi-M5
  (package (inherit mimimi-M4)
    (version "M5")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "0hkgvsibgqcy2rn7lri7li13kxnzw2iqyhalm3qjd4hf5zm58a8q"))))))

(define-public mimimi-M6
  (package (inherit mimimi-M5)
    (version "M6")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "1wbr3rw8jvvb9b0h6hhzg7zkd8wk58pygb6899pp9kgpdis14c6c"))))))

(define-public mimimi-M7
  (package (inherit mimimi-M6)
    (version "M7")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "025zh64bvfscmbnkcgxmjmbvs36b5rxx7xjabfplz7lqpkgbi242"))))))

(define-public mimimi-M8
  (package (inherit mimimi-M7)
    (version "M8")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "015xf5n1la9a2ssm6qrc9z905sv30zn43mpmivg8xrs4254rb9kk"))))))

(define-public mimimi-M9
  (package (inherit mimimi-M8)
    (version "M9")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "0kh526qb5c6q1lpry541cjplj7wi5znxv0v7gjamqf2x753kz1a3"))))))

(define-public mimimi-M10
  (package (inherit mimimi-M9)
    (version "M10")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "0735397pngvqa12463mr1q72jv8wp3n2v0q69wwkra9limczf70h"))))))

(define-public mimimi-M11
  (package (inherit mimimi-M10)
    (version "M11")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "05rhyzf757adrs0g73wqwzg9hx2pypwbcb24zd3rzar2lklnj035"))))))

(define-public mimimi-M12
  (package (inherit mimimi-M11)
    (version "M12")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "0r85br6f0qrq0xzn422gdy586h2bdlk9lz4jwzvc5h36id61bxsn"))))))

(define-public mimimi-M13
  (package (inherit mimimi-M12)
    (version "M13")
    (source
      (origin
        (method url-fetch)
        (uri (url version))
        (sha256 (base32 "1i7pk9fm79zyj7bcg13nznph8v20h216ci4c5q9qv6yz16i0g498"))))
        (arguments
          (substitute-keyword-arguments (package-arguments mimimi-M12)
            ((#:phases phases)
              `(modify-phases ,phases
                 (replace 'install-lib
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let* ((out (assoc-ref outputs "lib"))
                            (lib (string-append out "/lib")))
                       (mkdir-p lib)
                       (install-file "libmimimi.so" lib)
                       #t)))
                 (replace 'install-headers
                   (lambda* (#:key outputs #:allow-other-keys)
                     (map
                       (lambda (name)
                         (let* ((out (assoc-ref outputs name))
                                (include (string-append out "/include")))
                           (mkdir-p include)
                           (install-file "mimimi.h" include)
                           #t))
                       '("lib" "static"))))))))))

(define-public mimimi mimimi-M13)

mimimi

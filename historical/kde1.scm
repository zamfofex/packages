; Note: There is support for XDG_DATA_DIRS, but it is rudimentary.
; Note: The XDG_DATA_DIRS enviroment variable cannot contain multiple entries.
; Note: You can easily set it when calling ‘startx’, for example:
; Note: ‘XDG_DATA_DIRS=~/.guix-profile/share startx’

(use-modules
  (guix licenses)
  (guix packages)
  (guix git-download)
  (guix gexp)
  (guix store)
  (guix build-system gnu)
  (guix build-system cmake)
  (gnu packages xorg)
  (gnu packages pkg-config)
  (gnu packages gl)
  (gnu packages flex)
  (gnu packages image)
  (gnu packages gettext)
  (gnu packages perl)
  (gnu packages pulseaudio)
  (gnu packages tls)
  (gnu packages cryptsetup))

(include "../byacc.scm")

(define-public qt1
  (package
    (name "qt1")
    (version "1.44")
    (home-page "https://invent.kde.org/historical/qt1")
    (synopsis "Historical release of QT 1.")
    (description synopsis)
    
    (license (list lgpl2.1 lgpl3))
    
    (native-inputs `(("byacc" ,byacc)
                     ("pkg-config" ,pkg-config)
                     ("flex" ,flex)))
    (inputs `(("libxext" ,libxext) ("glfw" ,glfw)))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://invent.kde.org/historical/qt1")
            (commit "46b0d20a2823088b8942020b896a3e77376eb29a")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1hk9wmbck8mww1pylg01jfw7lyzfam0f900pr09w4im927rp02q5"))))
    
    (build-system cmake-build-system)
    (arguments
      '(#:configure-flags
         (list
           (string-append "-DBYACC_EXECUTABLE=" (assoc-ref %build-inputs "byacc") "/bin/yacc"))
        #:tests? #f))))

(define-public kde1-kdelibs
  (package
    (name "kde1-kdelibs")
    (version "1.1.2")
    (home-page "https://invent.kde.org/historical/kde1-kdelibs")
    (synopsis "Historical release of kdelibs.")
    (description synopsis)
    
    (license (list gpl2 lgpl2.1))
    
    (inputs
      `(("qt1" ,qt1)
        ("libjpeg-turbo" ,libjpeg-turbo)
        ("libpng" ,libpng)
        ("libtiff" ,libtiff)
        ("xorg-server" ,xorg-server)
        ("gettext" ,gnu-gettext)))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://invent.kde.org/historical/kde1-kdelibs")
            (commit "f2c5767cabd1a959959747cacb6bc9326935ed9f")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0q8papw32x8lgznsn4m9pwbc22r2rlkds9q8fmcdiqmfcy0b4gx4"))
        (patches (list (string-append (dirname current-filename) "/patches/kde1-kdelibs.patch")))))
    
    (build-system cmake-build-system)
    (arguments
      '(#:configure-flags
         (list
           ; There are currently build errors compiling with the 'NDEBUG' macro.
           "-DCMAKE_C_FLAGS_XRelease=-O3" "-DCMAKE_CXX_FLAGS_XRelease=-O3")
        
        ; See above note.
        #:build-type "XRelease"
        
        #:tests? #f))))

(define-public kde1-kdebase
  (package
    (name "kde1-kdebase")
    (version "1.1.2")
    (home-page "https://invent.kde.org/historical/kde1-kdebase")
    (synopsis "Historical release of kdebase.")
    (description synopsis)
    
    (license gpl2)
    
    (inputs
      `(("kde1-kdelibs" ,kde1-kdelibs)
        ("libjpeg-turbo" ,libjpeg-turbo)
        ("libpng" ,libpng)
        ("libtiff" ,libtiff)
        ("libxpm" ,libxpm)
        ("perl" ,perl)
        ("pulseaudio" ,pulseaudio)
        ("qt1" ,qt1)
        ("xorg-server" ,xorg-server)
        ("gettext" ,gnu-gettext)
        ("openssl" ,openssl)
        ("pkg-config" ,pkg-config)
        ("cryptsetup" ,cryptsetup)
        ("libxt" ,libxt)))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://invent.kde.org/historical/kde1-kdebase")
            (commit "a0ba99f725e3ded89f62845f88a92ca233177bc1")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1h233js1qdbn489jnz04afkcwr55b5352j2xivk55jl89fxr9jz0"))
        (patches (list (string-append (dirname current-filename) "/patches/kde1-kdebase.patch")))))
    
    (build-system cmake-build-system)
    (arguments
      '(#:configure-flags
         (list
           (string-append "-DCMAKE_MODULE_PATH=" (assoc-ref %build-inputs "kde1-kdelibs") "/share/cmake/KDE1/Modules"))
        #:phases
          (modify-phases %standard-phases
            (add-after 'install 'fix-modes
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out"))
                       (bin (string-append out "/bin")))
                  (for-each
                    (lambda (file)
                      (chmod file #o777))
                    (find-files bin))))))
        #:tests? #f))))

kde1-kdebase

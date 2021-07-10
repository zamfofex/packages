(use-modules
  (guix packages)
  (guix licenses)
  (guix git-download)
  (guix build-system gnu)
  (gnu packages tls)
  (gnu packages digest)
  (gnu packages tbb)
  (gnu packages gcc)
  (gnu packages compression)
  (gnu packages cmake))

(define-public mold
  (package
    (name "mold")
    (version "0.9.1")
    (home-page "https://github.com/rui314/mold")
    (synopsis "A Modern Linker")
    (description "mold is a high performance drop-in replacement for existing Unix linkers.")
    
    (license agpl3)
    
    (inputs `(("openssl" ,openssl) ("xxhash" ,xxhash) ("tbb" ,tbb) ("zlib" ,zlib) ("gcc" ,gcc-11) ("cmake" ,cmake)))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/rui314/mold")
            (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256 (base32 "14dg32nbzmkc9z747qsaiy0x55kl00izzg1hsvcm31lpw3l1d2f8"))))
    
    (build-system gnu-build-system)
    (arguments
      '(#:make-flags
         (list (string-append "CXX=" (assoc-ref %build-inputs "gcc") "/bin/g++")
               (string-append "CC=" (assoc-ref %build-inputs "gcc") "/bin/gcc"))
        #:phases
          (modify-phases %standard-phases
            (delete 'configure)
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out")) (bin (string-append out "/bin")))
                  (install-file "mold" bin)))))
        #:tests? #f))))

mold

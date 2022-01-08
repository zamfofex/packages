(define-module (zamfofex compilers mold))

(use-modules
  (guix packages)
  (guix licenses)
  (guix git-download)
  (guix build-system gnu)
  (guix build-system cmake)
  (guix utils)
  (gnu packages tls)
  (gnu packages digest)
  (gnu packages tbb)
  (gnu packages gcc)
  (gnu packages compression)
  (gnu packages cmake))

(define-public mimalloc
  (package
    (name "mimalloc")
    (version "2.0.3")
    (home-page "https://github.com/microsoft/mimalloc")
    (synopsis "a compact general purpose allocator with excellent performance")
    (description synopsis)
    
    (license expat)
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/microsoft/mimalloc")
            (commit (string-append "v" version))))
        (sha256 (base32 "0avamijn2dcrkba291rmdiv6z0kjzkhc1vigcwmhk9h0cvsc0q44"))))
    (build-system cmake-build-system)))

(define-public mold
  (package
    (name "mold")
    (version "1.0.1")
    (home-page "https://github.com/rui314/mold")
    (synopsis "A Modern Linker")
    (description "mold is a high performance drop-in replacement for existing Unix linkers.")
    
    (license agpl3)
    
    (inputs (list openssl xxhash tbb zlib mimalloc))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/rui314/mold")
            (commit (string-append "v" version))))
        (sha256 (base32 "0ydgcx6vycg7jv4pksv4875cwqdysfm0cpscsdfy0inr5mjrbs8v"))))
    
    (build-system gnu-build-system)
    (arguments
      `(#:make-flags
         (list (string-append "CXX=" ,(cxx-for-target))
               (string-append "CC=" ,(cc-for-target))
               "SYSTEM_MIMALLOC=1" "SYSTEM_TBB=1" "SYSTEM_XXHASH=1")
        #:phases
          (modify-phases %standard-phases
            (delete 'configure)
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out")))
                  (invoke "make" "SYSTEM_MIMALLOC=1" "SYSTEM_TBB=1" "SYSTEM_XXHASH=1" (string-append "PREFIX=" out) "install")))))
        ; TODO: enable tests once $CC is respected
        ; see: https://github.com/rui314/mold/commit/4324cb29988edf6cd7029d403afd09cac9abf0f3
        #:tests? #f))))

mold

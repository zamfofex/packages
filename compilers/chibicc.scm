(use-modules
  (guix packages)
  (guix licenses)
  (guix packages)
  (guix git-download)
  (guix build-system gnu)
  (gnu packages base)
  (gnu packages gcc))

(define-public chibicc
  (package
    (name "chibicc")
    (version "0")
    (home-page "https://github.com/rui314/chibicc")
    (synopsis "A small C compiler")
    (description
      (string-append
        "chibicc is yet another small C compiler that implements most C11 features. "
        "Even though it still probably falls into the \"toy compilers\" category just like other small compilers do, "
        "chibicc can compile several real-world programs, including Git, SQLite, libpng and chibicc itself, "
        "without making modifications to the compiled programs. Generated executables of these programs pass their corresponding test suites. "
        "So, chibicc actually supports a wide variety of C11 features and is able to compile hundreds of thousands of lines of real-world C code correctly."))
    
    (license (non-copyleft "file:///LICENSE"))
    
    (inputs `(("glibc" ,glibc) ("gcc:lib" ,gcc "lib")))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/rui314/chibicc")
            (commit "90d1f7f199cc55b13c7fdb5839d1409806633fdb")))
        (file-name (git-file-name name version))
        (sha256 (base32 "1ayvik0j7202wd5cnic961p6ibasndwhmfzzrbkp8ga9zx18yr5h"))
        (patches (list (string-append (dirname current-filename) "/patches/chibicc.patch")))))
    
    (build-system gnu-build-system)
    (arguments
      '(#:make-flags
         (list (string-append "CC=" (assoc-ref %build-inputs "gcc") "/bin/gcc")
               (string-append "CFLAGS=-O3 "
                 "-DCHIBICC_ROOT=\\\"" (assoc-ref %outputs "out") "\\\" "
                 "-DGLIBC_ROOT=\\\"" (assoc-ref %build-inputs "glibc") "\\\" "
                 "-DGCC_ROOT=\\\"" (assoc-ref %build-inputs "gcc:lib") "\\\" "
                 "-DLD_ROOT=\\\"" (assoc-ref %build-inputs "binutils") "\\\" "))
        #:phases
          (modify-phases %standard-phases
            (delete 'configure)
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out")) (bin (string-append out "/bin")) (include (string-append out "/include")))
                  (install-file "chibicc" bin)
                  (copy-recursively "include" include)))))
            ; (add-before 'check 'fix-test
            ;   (lambda* (#:key outputs #:allow-other-keys)
            ;     (substitute* "test/driver.sh" (("\\bcc\\b") "$chibicc"))))
        ; Note: chibicc’s tests currently require linking against a library file from ‘/tmp’ in the build environment.
        ; Note: Guix doesn’t like that, and I’m unsure whether it is possible to allow it, so tests are disabled.
        #:tests? #f
        #:test-target "test"))))

chibicc
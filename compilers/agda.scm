(use-modules
  (guix packages)
  (guix download)
  (gnu packages agda)
  (gnu packages haskell-xyz))

(define-public ghc-regex-base-latest
  (package (inherit ghc-regex-base)
    (name "ghc-regex-base")
    (version "0.94.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://hackage.haskell.org/package/regex-base/regex-base-" version ".tar.gz"))
        (sha256 (base32 "1ngdmmrxs1rhvib052c6shfa40yad82jylylikz327r0zxpxkcbi"))))))

(define-public ghc-regex-tdfa-latest
  (package (inherit ghc-regex-tdfa)
    (version "1.3.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://hackage.haskell.org/package/regex-tdfa/regex-tdfa-" version ".tar.gz"))
        (sha256 (base32 "1msrq31k4jmn2lmrdzn87jqarqhw265ca69rfg5jpa5adrzm3gmi"))))
    (inputs
      (append (package-inputs ghc-regex-tdfa)
        `(("ghc-utf8-string" ,ghc-utf8-string)
          ("ghc-regex-base" ,ghc-regex-base-latest))))))

(define-public agda-latest
  (package (inherit agda)
    (version "2.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://hackage.haskell.org/package/Agda/Agda-" version ".tar.gz"))
        (sha256 (base32 "159hznnsxg7hlp80r1wqizyd7gwgnq0j13cm4d27cns0ganslb07"))))
    (inputs
      (append (package-inputs agda)
        `(("ghc-case-insensitive" ,ghc-case-insensitive)
          ("ghc-monad-control" ,ghc-monad-control)
          ("ghc-parallel" ,ghc-parallel)
          ("ghc-regex-tdfa" ,ghc-regex-tdfa-latest))))))

agda-latest

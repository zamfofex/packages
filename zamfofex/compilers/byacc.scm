(define-module (zamfofex compilers byacc))

; This is currently here mostly to support building KDE 1.

(use-modules
  (guix packages)
  (guix download)
  (guix build-system gnu)
  (guix licenses))

(define-public byacc
  (package
    (name "byacc")
    (version "20210619")
    (home-page "https://invisible-island.net/byacc/byacc.html")
    (synopsis "Berkeley Yacc (byacc) is generally conceded to be the best yacc variant available.")
    (description synopsis)
    (license public-domain)
    
    (source
      (origin
        (method url-fetch)
        (uri (string-append "ftp://ftp.invisible-island.net/byacc/byacc-" version ".tgz"))
        (sha256 (base32 "03lc95x2ddnvqqwhfjccdpanqrhw2r68r3pc10m76dgrvj061pdc"))))
    
    (build-system gnu-build-system)))

byacc

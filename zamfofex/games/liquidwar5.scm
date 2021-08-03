(define-module (zamfofex games liquidwar5))

; Note: I still haven’t managed to get sound working properly.
; Note: I was able to get sound effects to play with some struggle by using local configuration files for ALSA.
; Note: But I wasn’t able to get Allegro to play the the music (MIDI) using a synthesizer.
; Note: Maybe someone with actual MIDI hardware can have more luck.

; Note: The background is broken (supposedly due to the removal of ‘liquidwarcol’ as mentioned below)
; Note: You can start the game as ‘liquidwar -noback’ to avoid flickering and other issues.

(use-modules
  (guix packages)
  (guix git-download)
  (guix build-system gnu)
  (guix download)
  (gnu packages game-development)
  (gnu packages autotools)
  (gnu packages linux)
  (gnu packages pkg-config)
  (guix licenses))

; The current (May 2021) version of Allegro 4 available on the main Guix repository is defined to be 4.4.3.
; The latest version of Allegro 4 (4.4.3.1) includes a small bugfix that is very important to build Liquid War 5.
; Liquid War 5 does not currently seem to work well with Allegro 5.
(define-public allegro-x
  (package (inherit allegro-4)
    (version "4.4.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/liballeg/allegro5"
                            "/releases/download/" version
                            "/allegro-" version ".tar.gz"))
        (sha256 (base32 "1m6lz35nk07dli26kkwz3wa50jsrxs1kb6w1nj14a911l34xn6gc"))))
    
    ; These additional inputs are required to enable audio.
    (inputs (append (package-inputs allegro-4) `(("alsa-lib" ,alsa-lib))))
    (native-inputs `(("pkg-config" ,pkg-config)))))

(define-public liquidwar5
  (package
    (name "liquidwar5")
    (version "5.6.5")
    (home-page "https://ufoot.org/liquidwar/v5")
    (synopsis "Liquid War is an innovative multiplayer wargame.")
    (description
      (string-append
        "Liquid War is a unique multiplayer wargame. "
        "Its rules are truely original and have been invented by Thomas Colcombet. "
        "You control an army of liquid and have to try and eat your opponents."))
    
    (license gpl2)
    
    (native-inputs
      `(("autoconf" ,autoconf)
        ("automake" ,automake)))
    (inputs `(("allegro" ,allegro-x)))
    
    (source
      (origin
        ; I don’t really know if the current tag is meant to target a fixed commit, or if it is meant to change over time.
        ; It is currently the only tag in the repo.
        ; I also don’t know if version 5.6.5 is considered the “latest release”, or if it is still considered “in development”.
        ; On the Liquid War 5 website, the version is listed in the “Downloads” section, but only a source code archive is available there.
        ; Maybe I should ask the author, I’unno, to be honest.
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/ufoot/liquidwar5")
            (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256 (base32 "0609x584ngwn6rp8s2c9sy4sayhji4j620pp7nvb23p56f035sqc"))
        
        ; The ‘liquidwarcol’ utility seems to be currently broken, or at least it doesn’t work for me for some reason.
        ; It also seems to use randomness to sample a palette from the ‘.pcx’ images at build time, so maybe it’s good to avoid it either way.
        (modules '((ice-9 textual-ports)))
        (snippet
          '(begin
             (delete-file "utils/liquidwarcol.c")
             (let ((port (open-output-file "utils/liquidwarcol.c")))
               (put-string port "int main() { return 0; }")
               (close-port port))))))
    
    (build-system gnu-build-system)
    (arguments
      '(#:configure-flags (list "CC=gcc")
        #:make-flags (list "CC=gcc")
        ; Liquid War 5 does not currently include proper tests.
        ; (I was instructed to blame the author for being lazy.)
        ; The current tests only verify the validity of the documentation, which is not built anyway.
        ; It also requires ‘xmllint’, so I disabled the tests to avoid adding the unnecessary dependency.
        #:tests? #f))))

liquidwar5

; Now Guix can finally be considered a “serious GNU/Linux distribution”, at least according to ufoot. ;)
; https://ufoot.org/liquidwar

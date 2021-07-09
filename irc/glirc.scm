; Note: Most of this file was generated automatically using ‘guix import’, with few modifications to tie everything together.

(use-modules (guix packages)
             (guix download)
             (guix build-system haskell)
             (guix licenses)
             (gnu packages haskell-crypto)
             (gnu packages haskell-xyz)
             (gnu packages haskell-check)
             (gnu packages tls))

(define-public ghc-test-framework-smallcheck
  (package
    (name "ghc-test-framework-smallcheck")
    (version "0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/test-framework-smallcheck/test-framework-smallcheck-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1xpgpk1gp4w7w46b4rhj80fa0bcyz8asj2dcjb5x1c37b7rw90b0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-test-framework" ,ghc-test-framework)
        ("ghc-smallcheck" ,ghc-smallcheck)))
    (home-page
      "https://github.com/feuerbach/smallcheck")
    (synopsis
      "SmallCheck support for the test-framework package. Support for SmallCheck tests in test-framework")
    (description
      "Support for SmallCheck tests in test-framework")
    (license bsd-3)))

(define-public ghc-quickcheck-assertions
  (package
    (name "ghc-quickcheck-assertions")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/quickcheck-assertions/quickcheck-assertions-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1kyam4cy7qmnizjwjm8jamq43w7f0fs6ljfplwj0ib6wi2kjh0wv"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-ieee754" ,ghc-ieee754)
        ("ghc-pretty-show" ,ghc-pretty-show)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec)))
    (home-page
      "https://github.com/s9gf4ult/quickcheck-assertions")
    (synopsis "HUnit like assertions for QuickCheck")
    (description
      "Library with convenient assertions for QuickCheck properties like in HUnit")
    (license lgpl3)))

(define-public ghc-vty
  (package
    (name "ghc-vty")
    (version "5.33")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/vty/vty-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0qsx4lwlkp6mwyr7rm1r9dg5ic1lc1awqgyag0nj1qgj2gnv6nc9"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-microlens" ,ghc-microlens)
        ("ghc-microlens-mtl" ,ghc-microlens-mtl)
        ("ghc-microlens-th" ,ghc-microlens-th)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-parallel" ,ghc-parallel)
        ("ghc-utf8-string" ,ghc-utf8-string)
        ("ghc-vector" ,ghc-vector)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck-x)
        ("ghc-random" ,ghc-random)
        ("ghc-smallcheck" ,ghc-smallcheck)
        ("ghc-quickcheck-assertions"
         ,ghc-quickcheck-assertions)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-smallcheck"
         ,ghc-test-framework-smallcheck)
        ("ghc-hunit" ,ghc-hunit)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-string-qq" ,ghc-string-qq)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1in66nd2xkb6mxxzazny900pz1xj83iqsql42c0rwk72chnnb8cd")))
    (home-page "https://github.com/jtdaugherty/vty")
    (synopsis "A simple terminal UI library")
    (description
      "vty is terminal GUI library in the niche of ncurses. It is intended to be easy to use, have no confusing corner cases, and good support for common terminal types. . See the @vty-examples@ package as well as the program @test/interactive_terminal_test.hs@ included in the @vty@ package for examples on how to use the library. . Import the \"Graphics.Vty\" convenience module to get access to the core parts of the library. . &#169; 2006-2007 Stefan O'Rear; BSD3 license. . &#169; Corey O'Connor; BSD3 license. . &#169; Jonathan Daugherty; BSD3 license.")
    (license bsd-3)))

(define-public ghc-irc-core
  (package
    (name "ghc-irc-core")
    (version "2.10")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/irc-core/irc-core-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1x1vmpzmgwxkwcza20yzmymgb7bj04f17xiqvcqg29h53pimnvxj"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-primitive" ,ghc-primitive)
        ("ghc-vector" ,ghc-vector)))
    (native-inputs `(("ghc-hunit" ,ghc-hunit)))
    (home-page "https://github.com/glguy/irc-core")
    (synopsis "IRC core library for glirc")
    (description
      "IRC core library for glirc . The glirc client has been split off into <https://hackage.haskell.org/package/glirc>")
    (license isc)))

(define-public ghc-hsopenssl-x509-system
  (package
    (name "ghc-hsopenssl-x509-system")
    (version "0.1.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/HsOpenSSL-x509-system/HsOpenSSL-x509-system-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "15mp70bqg1lzp971bzp6wym3bwzvxb76hzbgckygbfa722xyymhr"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hsopenssl" ,ghc-hsopenssl)
        ("openssl" ,openssl)))
    (home-page
      "https://github.com/redneb/HsOpenSSL-x509-system")
    (synopsis
      "Use the system's native CA certificate store with HsOpenSSL")
    (description
      "A cross-platform library that tries to find a (reasonable) CA certificate bundle that can be used with @HsOpenSSL@ to verify the certificates of remote peers. . This package is for @HsOpenSSL@ what @x509-system@ is for the @tls@ package. Additionally, it borrows some ideas from @x509-system@.")
    (license bsd-3)))

(define-public ghc-hsopenssl
  (package
    (name "ghc-hsopenssl")
    (version "0.11.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/HsOpenSSL/HsOpenSSL-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "160fpl2lcardzf4gy5dimhad69gvkkvnpp5nqbf8fcxzm4vgg76y"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-network" ,ghc-network)
        ("openssl" ,openssl)))
    (home-page
      "https://github.com/vshabanov/HsOpenSSL")
    (synopsis "Partial OpenSSL binding for Haskell")
    (description
      "HsOpenSSL is an OpenSSL binding for Haskell. It can generate RSA and DSA keys, read and write PEM files, generate message digests, sign and verify messages, encrypt and decrypt messages. It has also some capabilities of creating SSL clients and servers. . This package is in production use by a number of Haskell based systems and stable. You may also be interested in the @tls@ package, <http://hackage.haskell.org/package/tls>, which is a pure Haskell implementation of SSL.")
    (license public-domain)))

(define-public ghc-hookup
  (package
    (name "ghc-hookup")
    (version "0.6")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hookup/hookup-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "09rhsq0j2m1j87qsbsd3l1q3dv2zs4wrhcz2jhn4a6dx273w5528"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-async" ,ghc-async)
        ("ghc-network" ,ghc-network)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-hsopenssl" ,ghc-hsopenssl)
        ("ghc-hsopenssl-x509-system"
         ,ghc-hsopenssl-x509-system)
        ("openssl" ,openssl)))
    (home-page "https://github.com/glguy/irc-core")
    (synopsis
      "Abstraction over creating network connections with SOCKS5 and TLS")
    (description
      "This package provides an abstraction for communicating with line-oriented network services while abstracting over the use of SOCKS5 and TLS (via OpenSSL)")
    (license isc)))

(define-public ghc-config-value
  (package
    (name "ghc-config-value")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/config-value/config-value-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "086jv01a737547w6x9w1951vq0p7mx6vqw9ifw5kcs5nvhj5rx2q"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-alex" ,ghc-alex)
        ("ghc-happy" ,ghc-happy)))
    (arguments
      `(#:cabal-revision
        ("1"
         "0wa3grq566fpkq5g9bcszwjv96drq6b3qg2w32rv8m00pd1j0n27")))
    (home-page
      "https://github.com/glguy/config-value")
    (synopsis
      "Simple, layout-based value language similar to YAML or JSON")
    (description
      "This package implements a language similar to YAML or JSON but with fewer special cases and fewer dependencies. It emphasizes layout structure for sections and lists, and requires quotes around strings.")
    (license expat)))

(define-public ghc-config-schema
  (package
    (name "ghc-config-schema")
    (version "1.2.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/config-schema/config-schema-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10mp76j2gxcb51865lb6cf3nkc2nc7fwarkghb6yz71q6sbrg3yx"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-config-value" ,ghc-config-value)
        ("ghc-free" ,ghc-free)
        ("ghc-kan-extensions" ,ghc-kan-extensions)
        ("ghc-semigroupoids" ,ghc-semigroupoids)))
    (arguments
      `(#:cabal-revision
        ("1"
         "0wswgb6m2whyxddm214fbrq69d9i2wrr6j2hhq1dn8p3gx91q3kv")))
    (home-page
      "https://github.com/glguy/config-schema")
    (synopsis
      "Schema definitions for the config-value package")
    (description
      "This package makes it possible to define schemas for use when loading configuration files using the config-value format. These schemas can be used to process a configuration file into a Haskell value or to automatically generate documentation for the file format.")
    (license isc)))

(define-public ghc-network
  (package
    (name "ghc-network")
    (version "3.1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/network/network-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0jlx8dls0h95znpcb66bd95k4mp3aaa733h89pq5ymyb8m29bapw"))))
    (build-system haskell-build-system)
    (inputs
      `(("hspec-discover" ,hspec-discover)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-doctest" ,ghc-doctest)))
    (arguments
      `(#:cabal-revision
        ("1"
         "12swsygnsnyvfjm3p9b6z8jh8vbw3q5akmggacsvr4fdm2p6v38q")))
    (home-page "https://github.com/haskell/network")
    (synopsis "Low-level networking interface")
    (description
      "This package provides a low-level networking interface. . === High-Level Packages Other packages provide higher level interfaces: . * connection * hookup * network-simple . === Extended Packages @network@ seeks to provide a cross-platform core for networking. As such some APIs live in extended libraries. Packages in the @network@ ecosystem are often prefixed with @network-@. . ==== @network-bsd@ In @network-3.0.0.0@ the @Network.BSD@ module was split off into its own package, @network-bsd-3.0.0.0@. . ==== @network-uri@ In @network-2.6@ the @Network.URI@ module was split off into its own package, @network-uri-2.6@. If you're using the @Network.URI@ module you can automatically get it from the right package by adding this to your @.cabal@ file: . > library >   build-depends: network-uri-flag")
    (license bsd-3)))

(define-public ghc-ansi-terminal
  (package
    (name "ghc-ansi-terminal")
    (version "0.11")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/ansi-terminal/ansi-terminal-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "14rp62c7y79n9dmmi7m0l9n3mcq6dh331b4yyyrivm5da6g1nqf6"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-colour" ,ghc-colour)))
    (home-page
      "https://github.com/feuerbach/ansi-terminal")
    (synopsis
      "Simple ANSI terminal support, with Windows compatibility")
    (description
      "ANSI terminal support for Haskell: allows cursor movement, screen clearing, color output, showing or hiding the cursor, and changing the title. Works on UNIX and Windows.")
    (license bsd-3)))

(define-public ghc-quickcheck-x
  (package
    (name "ghc-quickcheck")
    (version "2.14.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/QuickCheck/QuickCheck-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1wrnrm9sq4s0bly0q58y80g4153q45iglqa34xsi2q3bd62nqyyq"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-random" ,ghc-random)
        ("ghc-splitmix" ,ghc-splitmix)))
    (home-page
      "https://github.com/nick8325/quickcheck")
    (synopsis
      "Automatic testing of Haskell programs")
    (description
      "QuickCheck is a library for random testing of program properties. The programmer provides a specification of the program, in the form of properties which functions should satisfy, and QuickCheck then tests that the properties hold in a large number of randomly generated cases. Specifications are expressed in Haskell, using combinators provided by QuickCheck. QuickCheck provides combinators to define properties, observe the distribution of test data, and define test data generators. . Most of QuickCheck's functionality is exported by the main \"Test.QuickCheck\" module. The main exception is the monadic property testing library in \"Test.QuickCheck.Monadic\". . If you are new to QuickCheck, you can try looking at the following resources: . * The <http://www.cse.chalmers.se/~rjmh/QuickCheck/manual.html official QuickCheck manual>. It's a bit out-of-date in some details and doesn't cover newer QuickCheck features, but is still full of good advice. * <https://begriffs.com/posts/2017-01-14-design-use-quickcheck.html>, a detailed tutorial written by a user of QuickCheck. . The <https://hackage.haskell.org/package/quickcheck-instances quickcheck-instances> companion package provides instances for types in Haskell Platform packages at the cost of additional dependencies.")
    (license bsd-3)))

(define-public ghc-splitmix
  (package
    (name "ghc-splitmix")
    (version "0.1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/splitmix/splitmix-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0das5n44dhlcv5i233iakx37d17kidqvhrvp6w9nd7hc015ry026"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-hunit" ,ghc-hunit)
        ("ghc-math-functions" ,ghc-math-functions)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-async" ,ghc-async)
        ("ghc-base-compat-batteries"
         ,ghc-base-compat-batteries)
        ("ghc-random" ,ghc-random)
        ("ghc-tf-random" ,ghc-tf-random)
        ("ghc-vector" ,ghc-vector)
        ("ghc-hunit" ,ghc-hunit)))
    (home-page
      "http://hackage.haskell.org/package/splitmix")
    (synopsis "Fast Splittable PRNG")
    (description
      "Pure Haskell implementation of SplitMix described in . Guy L. Steele, Jr., Doug Lea, and Christine H. Flood. 2014. Fast splittable pseudorandom number generators. In Proceedings of the 2014 ACM International Conference on Object Oriented Programming Systems Languages & Applications (OOPSLA '14). ACM, New York, NY, USA, 453-472. DOI: <https://doi.org/10.1145/2660193.2660195> . The paper describes a new algorithm /SplitMix/ for /splittable/ pseudorandom number generator that is quite fast: 9 64 bit arithmetic/logical operations per 64 bits generated. . /SplitMix/ is tested with two standard statistical test suites (DieHarder and TestU01, this implementation only using the former) and it appears to be adequate for \"everyday\" use, such as Monte Carlo algorithms and randomized data structures where speed is important. . In particular, it __should not be used for cryptographic or security applications__, because generated sequences of pseudorandom values are too predictable (the mixing functions are easily inverted, and two successive outputs suffice to reconstruct the internal state).")
    (license bsd-3)))

(define-public ghc-base-compat
  (package
    (name "ghc-base-compat")
    (version "0.11.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/base-compat/base-compat-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1nyvkaij4m01jndw72xl8931czz1xp6jpnynpajabys2ahabb9jk"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/base-compat")
    (synopsis "A compatibility layer for base")
    (description
      "Provides functions available in later versions of @base@ to a wider range of compilers, without requiring you to use CPP pragmas in your code.  See the <https://github.com/haskell-compat/base-compat/blob/master/base-compat/README.markdown README> for what is covered. Also see the <https://github.com/haskell-compat/base-compat/blob/master/base-compat/CHANGES.markdown changelog> for recent changes. . Note that @base-compat@ does not add any orphan instances. There is a separate package, @<http://hackage.haskell.org/package/base-orphans base-orphans>@, for that. . In addition, @base-compat@ does not backport any data types or type classes. See @<https://github.com/haskell-compat/base-compat/blob/master/base-compat/README.markdown#data-types-and-type-classes this section of the README>@ for more info. . @base-compat@ is designed to have zero dependencies. For a version of @base-compat@ that depends on compatibility libraries for a wider support window, see the @<http://hackage.haskell.org/package/base-compat-batteries base-compat-batteries>@ package. Most of the modules in this library have the same names as in @base-compat-batteries@ to make it easier to switch between the two. There also exist versions of each module with the suffix @.Repl@, which are distinct from anything in @base-compat-batteries@, to allow for easier use in GHCi.")
    (license expat)))

(define-public ghc-regex-tdfa
  (package
    (name "ghc-regex-tdfa")
    (version "1.3.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/regex-tdfa/regex-tdfa-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1h1fliv2zjxwmddl9wnn7ckxxpgy1049hdfg6fcknyrr7mw7dhqm"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-regex-base" ,ghc-regex-base)))
    (native-inputs
      `(("ghc-utf8-string" ,ghc-utf8-string)))
    (arguments
      `(#:cabal-revision
        ("2"
         "1hvcqdywwlcpia7qss7ikr9bq0lvkk8z0mjgaylaqpzlgh00z3gb")))
    (home-page
      "https://wiki.haskell.org/Regular_expressions")
    (synopsis
      "Pure Haskell Tagged DFA Backend for \"Text.Regex\" (regex-base)")
    (description
      "This package provides a pure Haskell \\\"Tagged\\\" DFA regex engine for <//hackage.haskell.org/package/regex-base regex-base>. This implementation was inspired by the algorithm (and Master's thesis) behind the regular expression library known as <https://github.com/laurikari/tre/ TRE or libtre>. . Please consult the \"Text.Regex.TDFA\" module for API documentation including a tutorial with usage examples; see also <https://wiki.haskell.org/Regular_expressions> for general information about regular expression support in Haskell.")
    (license bsd-3)))

(define-public ghc-regex-base
  (package
    (name "ghc-regex-base")
    (version "0.94.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/regex-base/regex-base-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1ngdmmrxs1rhvib052c6shfa40yad82jylylikz327r0zxpxkcbi"))))
    (build-system haskell-build-system)
    (home-page
      "https://wiki.haskell.org/Regular_expressions")
    (synopsis
      "Common \"Text.Regex.*\" API for Regex matching")
    (description
      "This package does not provide the ability to do regular expression matching. Instead, it provides the type classes that constitute the abstract API that is implemented by @regex-*@ backends such as: . * <https://hackage.haskell.org/package/regex-posix regex-posix> . * <https://hackage.haskell.org/package/regex-parsec regex-parsec> . * <https://hackage.haskell.org/package/regex-dfa regex-dfa> . * <https://hackage.haskell.org/package/regex-tdfa regex-tdfa> . * <https://hackage.haskell.org/package/regex-pcre regex-pcre> . See also <https://wiki.haskell.org/Regular_expressions> for more information.")
    (license bsd-3)))

(define-public ghc-unordered-containers
  (package
    (name "ghc-unordered-containers")
    (version "0.2.13.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/unordered-containers/unordered-containers-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0mbvld5dym17jc13ycl862k73kg26y9khb8578w13cwfmdli7c46"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-hashable" ,ghc-hashable)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)
        ("ghc-hunit" ,ghc-hunit)
        ("ghc-random" ,ghc-random)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-chasingbottoms" ,ghc-chasingbottoms)))
    (home-page
      "https://github.com/haskell-unordered-containers/unordered-containers")
    (synopsis
      "Efficient hashing-based container types")
    (description
      "Efficient hashing-based container types.  The containers have been optimized for performance critical use, both in terms of large data quantities and high speed. . The declared cost of each operation is either worst-case or amortized, but remains valid even if structures are shared.")
    (license bsd-3)))

(define-public ghc-lens
  (package
    (name "ghc-lens")
    (version "4.19.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/lens/lens-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0fy2vr5r11cc6ana8m2swqgs3zals4kims55vd6119bi76p5iy2j"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-base-orphans" ,ghc-base-orphans)
        ("ghc-bifunctors" ,ghc-bifunctors)
        ("ghc-call-stack" ,ghc-call-stack)
        ("ghc-comonad" ,ghc-comonad)
        ("ghc-contravariant" ,ghc-contravariant)
        ("ghc-distributive" ,ghc-distributive)
        ("ghc-free" ,ghc-free)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-kan-extensions" ,ghc-kan-extensions)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-parallel" ,ghc-parallel)
        ("ghc-profunctors" ,ghc-profunctors)
        ("ghc-reflection" ,ghc-reflection)
        ("ghc-semigroupoids" ,ghc-semigroupoids)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-th-abstraction" ,ghc-th-abstraction)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)
        ("ghc-hunit" ,ghc-hunit)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-doctest" ,ghc-doctest)
        ("ghc-generic-deriving" ,ghc-generic-deriving)
        ("ghc-nats" ,ghc-nats)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-simple-reflect" ,ghc-simple-reflect)
        ("cabal-doctest" ,cabal-doctest)))
    (arguments
      `(#:cabal-revision
        ("5"
         "1r9rhblsw1g2y2lyf8vhps05hvx6jxs5r6y1rf868hxz0z242i7q")))
    (home-page "http://github.com/ekmett/lens/")
    (synopsis "Lenses, Folds and Traversals")
    (description
      "This package comes \\\"Batteries Included\\\" with many useful lenses for the types commonly used from the Haskell Platform, and with tools for automatically generating lenses and isomorphisms for user-supplied data types. . The combinators in @Control.Lens@ provide a highly generic toolbox for composing families of getters, folds, isomorphisms, traversals, setters and lenses and their indexed variants. . An overview, with a large number of examples can be found in the <https://github.com/ekmett/lens#lens-lenses-folds-and-traversals README>. . An introductory video on the style of code used in this library by Simon Peyton Jones is available from <http://skillsmatter.com/podcast/scala/lenses-compositional-data-access-and-manipulation Skills Matter>. . A video on how to use lenses and how they are constructed is available on <http://youtu.be/cefnmjtAolY?hd=1 youtube>. . Slides for that second talk can be obtained from <http://comonad.com/haskell/Lenses-Folds-and-Traversals-NYC.pdf comonad.com>. . More information on the care and feeding of lenses, including a brief tutorial and motivation for their types can be found on the <https://github.com/ekmett/lens/wiki lens wiki>. . A small game of @pong@ and other more complex examples that manage their state using lenses can be found in the <https://github.com/ekmett/lens/blob/master/examples/ example folder>. . /Lenses, Folds and Traversals/ . With some signatures simplified, the core of the hierarchy of lens-like constructions looks like: . . <<http://i.imgur.com/ALlbPRa.png>> . <images/Hierarchy.png (Local Copy)> . You can compose any two elements of the hierarchy above using @(.)@ from the @Prelude@, and you can use any element of the hierarchy as any type it linked to above it. . The result is their lowest upper bound in the hierarchy (or an error if that bound doesn't exist). . For instance: . * You can use any 'Traversal' as a 'Fold' or as a 'Setter'. . * The composition of a 'Traversal' and a 'Getter' yields a 'Fold'. . /Minimizing Dependencies/ . If you want to provide lenses and traversals for your own types in your own libraries, then you can do so without incurring a dependency on this (or any other) lens package at all. . /e.g./ for a data type: . > data Foo a = Foo Int Int a . You can define lenses such as . > -- bar :: Lens' (Foo a) Int > bar :: Functor f => (Int -> f Int) -> Foo a -> f (Foo a) > bar f (Foo a b c) = fmap (\\a' -> Foo a' b c) (f a) . > -- quux :: Lens (Foo a) (Foo b) a b > quux :: Functor f => (a -> f b) -> Foo a -> f (Foo b) > quux f (Foo a b c) = fmap (Foo a b) (f c) . without the need to use any type that isn't already defined in the @Prelude@. . And you can define a traversal of multiple fields with 'Control.Applicative.Applicative': . > -- traverseBarAndBaz :: Traversal' (Foo a) Int > traverseBarAndBaz :: Applicative f => (Int -> f Int) -> Foo a -> f (Foo a) > traverseBarAndBaz f (Foo a b c) = Foo <$> f a <*> f b <*> pure c . What is provided in this library is a number of stock lenses and traversals for common haskell types, a wide array of combinators for working them, and more exotic functionality, (/e.g./ getters, setters, indexed folds, isomorphisms).")
    (license bsd-2)))

(define-public ghc-glirc
  (package
    (name "ghc-glirc")
    (version "2.38")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/glirc/glirc-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1azykkb9rc4q97v9xiqfjv0iys0wswa3nsy10smdkpp7yvv4mca7"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hsopenssl" ,ghc-hsopenssl)
        ("ghc-async" ,ghc-async)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-config-schema" ,ghc-config-schema)
        ("ghc-config-value" ,ghc-config-value)
        ("ghc-free" ,ghc-free)
        ("ghc-gitrev" ,ghc-gitrev)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-hookup" ,ghc-hookup)
        ("ghc-irc-core" ,ghc-irc-core)
        ("ghc-kan-extensions" ,ghc-kan-extensions)
        ("ghc-lens" ,ghc-lens)
        ("ghc-random" ,ghc-random)
        ("ghc-network" ,ghc-network)
        ("ghc-psqueues" ,ghc-psqueues)
        ("ghc-regex-tdfa" ,ghc-regex-tdfa)
        ("ghc-split" ,ghc-split)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)
        ("ghc-vty" ,ghc-vty)
        ("openssl" ,openssl)))
    (native-inputs `(("ghc-hunit" ,ghc-hunit)))
    (arguments
      `(#:cabal-revision
        ("1"
         "04f35w57jq6gpi6d3d83c9bswwl724rbd0dbl835ilhl18kpfscj")))
    (home-page "https://github.com/glguy/irc-core")
    (synopsis "Console IRC client")
    (description
      "Console IRC client. glirc is a console IRC client with an emphasis on providing dynamic views into the model of your IRC connections.")
    (license isc)))

ghc-glirc

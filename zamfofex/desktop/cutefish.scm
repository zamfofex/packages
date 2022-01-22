(define-module (zamfofex desktop cutefish))

(use-modules
  (gnu packages)
  (gnu packages freedesktop)
  (gnu packages xorg)
  (gnu packages polkit)
  (gnu packages kde-frameworks)
  (gnu packages qt)
  (gnu packages pkg-config)
  (gnu packages kde-plasma)
  (gnu packages libcanberra)
  (gnu packages pulseaudio)
  (gnu packages linux)
  (gnu packages icu4c)
  (gnu packages fontutils)
  (guix packages)
  ((guix licenses) #:prefix license:)
  (guix utils)
  (guix build-system cmake)
  (guix build-system qt)
  (guix git-download)
  (guix download))

(define version "0.7")

(define extra-cmake-modules-latest
  (package (inherit extra-cmake-modules)
    (version "5.90.0")
    (source
      (origin
        (method url-fetch)
        (uri
          (string-append
            "mirror://kde/stable/frameworks/"
            (version-major+minor version) "/"
            "extra-cmake-modules-" version ".tar.xz"))
        (sha256 (base32 "1c5wza7srib3mdkf29ygmyj5b6jq322s6h7k5hlljqm5xhy7q07k"))))
    (arguments (substitute-keyword-arguments (package-arguments extra-cmake-modules) ((#:tests? tests?) #f)))))

(define bluez-qt-latest
  (package (inherit bluez-qt)
    (version "5.90.0")
    
    (inputs (list qtbase-5 extra-cmake-modules-latest))
    
    (source
      (origin
        (method url-fetch)
        (uri
          (string-append
            "mirror://kde/stable/frameworks/"
            (version-major+minor version) "/"
            "bluez-qt-" version ".tar.xz"))
        (sha256 (base32 "056i5ndrg5fqm1bx49a0plfhlladphha128wi766zdhcm6np11z3"))))))

(define-public cutefish-core
  (package
    (name "cutefish-core")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list extra-cmake-modules-latest pkg-config xf86-input-libinput libx11 libxcb xcb-util-keysyms libxcursor xcb-util xcb-util-image xcb-util-wm xorg-server xf86-input-synaptics libxtst libsm polkit polkit-qt kwindowsystem kglobalaccel kcoreaddons kidletime qtx11extras qtbase-5 qtdeclarative qtquickcontrols2 qttools))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/core")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "196x0w46w1lywh8zj6ri35r8mxaing3fp49vqxrravyw0jwj8xy0"))
        (modules '((guix build utils)))
        (snippet
          '(begin
             (substitute* "CMakeLists.txt" (("DESTINATION /etc") "DESTINATION ${CMAKE_INSTALL_PREFIX}/etc"))
             (substitute* "notificationd/CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}"))))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public fishui
  (package
    (name "fishui")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list qtx11extras kwindowsystem libxcb qtbase-5 qtdeclarative qtquickcontrols2 extra-cmake-modules-latest xcb-util-wm))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/fishui")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1cs3s90bgzxiffm9z1s6d4imvb9jmy1nbbcy1s66p9y0qhpyv4dy"))
        (modules '((guix build utils)))
        (snippet '(substitute* "CMakeLists.txt" (("if \\(INSTALL_QMLDIR\\)") "set(INSTALL_QMLDIR \"${CMAKE_INSTALL_LIBDIR}/qt5/qml\")\nif (INSTALL_QMLDIR)")))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public libcutefish
  (package
    (name "libcutefish")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list qtbase-5 qtquickcontrols2 networkmanager-qt modemmanager-qt qtdeclarative bluez-qt-latest libkscreen kio qtsensors libcanberra pkg-config pulseaudio bluez))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/libcutefish")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1i5mj4fhkmpbs3p4hmh3azrh1ppgpq8mx5vrf0xkkjykh0z9bs9h"))
        (modules '((guix build utils)))
        (snippet '(substitute* "CMakeLists.txt" (("if\\(INSTALL_QMLDIR\\)") "set(INSTALL_QMLDIR \"${CMAKE_INSTALL_LIBDIR}/qt5/qml\")\nif (INSTALL_QMLDIR)")))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-dock
  (package
    (name "cutefish-dock")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list qtbase-5 qtquickcontrols2 kwindowsystem qtx11extras fishui libcutefish qttools qtdeclarative))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/dock")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1gq2xx7f92ifl0a9m7kp9rrywhzj0f1zwk0g2wh2jd5iz9y1dshi"))
        (modules '((guix build utils)))
        (snippet
          '(begin
             (substitute* "CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}"))
             (substitute* "CMakeLists.txt" (("DESTINATION /etc") "DESTINATION ${CMAKE_INSTALL_PREFIX}/etc"))))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-filemanager
  (package
    (name "cutefish-filemanager")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list fishui extra-cmake-modules-latest kio solid kwindowsystem qtbase-5 qtdeclarative qtquickcontrols2 qttools qtgraphicaleffects qtsvg))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/filemanager")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1s9lq7w1r9lvyd1ds9v767ca559msr4p2rnd7sn4r0qaqa5dayzy"))
        (modules '((guix build utils)))
        (snippet
          '(begin
             (substitute* "CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}"))
             (substitute* "CMakeLists.txt" (("DESTINATION \"/usr") "DESTINATION \"${CMAKE_INSTALL_PREFIX}"))))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-icons
  (package
    (name "cutefish-icons")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list extra-cmake-modules-latest kio solid kwindowsystem qtbase-5 qtdeclarative qtquickcontrols2 qttools fishui qtgraphicaleffects))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/icons")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1py2vwq6fxrfy5sfh02a8hrcmkl7g005pnppbv5xqsy7i6y3lsiq"))))
    
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-settings
  (package
    (name "cutefish-settings")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list fishui libcutefish extra-cmake-modules-latest icu4c freetype fontconfig networkmanager-qt modemmanager-qt qtbase-5 qtdeclarative qtquickcontrols2 qttools qtx11extras pkg-config libxcursor libxi qtgraphicaleffects qtsvg kwindowsystem))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/settings")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "10vqhs0baismidsmh13pkm2l8xxasbd2if9fm5rsm62skc69qjjd"))
        (modules '((guix build utils)))
        (snippet '(substitute* "CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}")))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-terminal
  (package
    (name "cutefish-terminal")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list fishui extra-cmake-modules-latest qtbase-5 qtdeclarative qtquickcontrols2 qttools qtsvg qtgraphicaleffects))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/terminal")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1b88wqips4nwd1dcsnh7nc4fdg949s8xs5nxd11llfnlwr2gzicr"))
        (modules '((guix build utils)))
        (snippet
          '(begin
             (substitute* "CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}"))
             (substitute* "CMakeLists.txt" (("if\\(INSTALL_QMLDIR\\)") "set(INSTALL_QMLDIR \"${CMAKE_INSTALL_LIBDIR}/qt5/qml\")\nif (INSTALL_QMLDIR)"))))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-wallpapers
  (package
    (name "cutefish-wallpapers")
    (version "0.4")
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license (license:non-copyleft "file:///LICENSE"))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/wallpapers")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "1x7avy7h77h6dzcafjcfpm14n8l7k3nprdvspigbrajijswvp1xx"))
        (modules '((guix build utils)))
        (snippet '(substitute* "sources/CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}")))))
    
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))))

(define-public cutefish-launcher
  (package
    (name "cutefish-launcher")
    (version version)
    (home-page "https://cutefishos.com")
    (synopsis "")
    (description "")
    (license license:gpl3+)
    
    (inputs (list fishui libcutefish extra-cmake-modules-latest qtbase-5 qtdeclarative qtquickcontrols2 kwindowsystem qttools qtsvg qtgraphicaleffects))
    
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/cutefishos/launcher")
            (commit version)))
        (file-name (git-file-name name version))
        (sha256 (base32 "19c9ipf6yz5i5f95m3q53ff9wqv9078ialh02zbg3gxwrwy2iv4h"))
        (modules '((guix build utils)))
        (snippet '(substitute* "CMakeLists.txt" (("DESTINATION /usr") "DESTINATION ${CMAKE_INSTALL_PREFIX}")))))
    
    (build-system qt-build-system)
    (arguments '(#:tests? #f))))

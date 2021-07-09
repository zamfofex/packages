zamfofex’s Guix packages
===

Some miscellanous Guix packages for projects I find interesting and sometimes useful.

For now there are only a few, but as I create more, I might share them here.

Each Scheme file might contains multiple packages, but they focus on supporting a single package, which is what the file evaluates to.

Thus, installing packages is as simple as `guix package -f`, for example:

~~~
git clone https://github.com/packages
cd packages
guix package -f games/liquidwar5.scm
~~~

The files have comments with relevant and useful notes about their current status.

a little note about formatting and style
---

I generally try to avoid using whitespace in a way that assumes viewing through a monospaced font, because I acknowledge not everyone uses them (and indeed, I myself don’t sometimes).

This is the first time I’ve been messing around with Lisp, though, and I just so happened to be using an editor that only supports monospaced fonts. I tried to avoid diverging too much from exiting List formatting conventions, simply because I don’t know better.

I tried to keep significant whitespace formatting exclusive to identation at the start of a line, though, so hopefully it’s still readable enough to those using proportional fonts.

license — 0BSD
---

Copyright © 2021 by zamfofex

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

This directory contains a preconfigured copy of the official portable
version of KeePass 2.28. KeePass is an excellent password manager, but
the natural ways of using it can be problematic. Fortunately, this can
be solved by using the global auto-type feature in a special way. The
configuration is tailored to this solution, but the discussion of the
solution is most important. Even if you're not interested in actually
using this copy of KeePass, you might still enjoy reading further.

Motivation

KeePass has three output methods: drag and drop, the clipboard, and
auto-type. Each can be problematic.

Drag and drop is inherently clunky because it relies on the mouse. The
KeePass window might need to be moved to not obscure the target window,
and the mouse must be moved back and forth. It is also not uncommon for
one account to have several security questions that may be asked during
login. If the answers are stored as custom fields, the only way to drag
and drop them is to add columns for them in the KeePass window, causing
an explosion in the number of columns. Furthermore, if the target window
does not support drag and drop, then drag and drop will not work at all.

The clipboard partially solves these problems. The clunkiness is reduced
because keyboard shortcuts can often be used. The custom fields problem
goes away because they can be copied to the clipboard using the context
(right-click) menu of each database entry. Target windows not supporting
drag and drop are no longer a problem, but it is also not uncommon for
target windows, in particular web pages utilizing JavaScript, to prevent
clipboard pasting. Regardless, the clipboard introduces a new problem:
if you're accustomed to using the clipboard for normal purposes, it can
be disruptive and dangerous to also use it for KeePass. Before copying
KeePass data, you must be sure that nothing important is already in the
clipboard. After pasting, you must be sure to either manually clear the
clipboard or wait for it to be automatically cleared by KeePass to avoid
accidentally pasting it later. If you use any other programs that like
to monitor the clipboard, then you may be showing them sensitive data.

Auto-type fares better, avoiding all of the above problems. However, a
new problem is again introduced, which only becomes apparent over time:
auto-type entries rot. An auto-type entry is impressive when you first
create it, but if you don't use it very often, you start to forget its
details. User interfaces also inevitably change, breaking old auto-type
entries. With these problems affecting an entire database, maintenance
becomes a problem, and whether global auto-type is going to do the right
thing becomes a guessing game.

Fortunately, this problem can be fixed, and global auto-type can be
harnessed as a highly effective output method. The key observation is
that if the target window matches more than one window pattern, KeePass
will display a list of key sequences to choose from. If you make every
window pattern simply an asterisk, the list will always contain all key
sequences in the entire database. This means that window patterns can't
rot. Furthermore, if you only use atomic key sequences like {USERNAME},
{PASSWORD}, or {S:Where were you born?}, then key sequences can't rot.

The only problem now is that the list is very large, and selecting the
desired key sequence is cumbersome. However, this problem can be solved
by using keyboard shortcuts. On Windows, you can search through the list
by simply typing. For example, if the database has an entry whose title
is "foo", then typing "foo" will jump to the first key sequence of that
entry in the list, regardless of how big the list is. The arrow keys can
then be used to select the specific key sequence within that entry, and
the enter key can be used to accept the selection. The mouse need not be
used at all.

Instructions

To get started, add a KeePass.kdbx file and run KeePass/KeePass.exe.
KeePass will automatically open the database file and minimize itself
after you unlock it. The configuration is very conservative, disabling
unnecessary features and simplifying the interface. In particular, drag
and drop and the clipboard are disabled. The first thing you might want
to do is set KeePass to run at Windows startup, which is a setting that
directly affects Windows and is not stored in the configuration.

It is recommended to update your auto-type entries gradually. Add two
entries to ensure that the list always appears, but add further entries
only as needed. This eases the process by spreading the work.

Miscellaneous

The following is a summary of the directory contents.

  README.txt                  This file
  .gitattributes              Git repository stuff
  .gitignore                  Git repository stuff
  .gitmessage                 Git repository stuff
  CC0-1.0.txt                 The CC0 1.0 Universal
                                Public Domain Dedication
  KeePass-2.28-Source.zip     The official KeePass source code
  KeePass-2.28.zip            The official KeePass program files
  KeePass/                    The extracted KeePass program files
  KeePass/KeePass.config.xml  The KeePass configuration file

The official KeePass source code and program files include their own
copyright information. The extracted program files are unchanged but
additionally include the customized configuration file, whose changes
include an appended copyright notice.

Tracking KeePass.kdbx in a parallel repository

  git --git-dir=.gitkdbx --work-tree=. init
  echo '*' >>.gitkdbx/info/exclude
  git --git-dir=.gitkdbx --work-tree=. add -f KeePass.kdbx
  git --git-dir=.gitkdbx --work-tree=. <etc>

The authors of this file have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. You should have received a copy of the full
dedication along with this file, typically as a file
named <CC0-1.0.txt>. If not, it may be available at
<https://creativecommons.org/publicdomain/zero/1.0/>.

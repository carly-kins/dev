# Filesystems 

For more information check out https://www.ibm.com/docs/en/zos/2.4.0?topic=system-working-files and https://www.pluralsight.com/guides/beginner-linux-navigation-manual


**Dot Notation**
If you use the ``ls -a`` command to list the contents of a directory, you see that every directory contains the entries ``.``(dot) and ``..`` (dot dot):
- ``.`` (dot)
    - This refers to the working directory.
- ``..`` (dot dot)
    - This refers to the parent directory of your working directory, immediately above your working directory in the file system structure.

- _If one of these is used as the first element in a relative path name, it refers to your working directory._ If ``..`` is used alone, it refers to the parent of your working directory.
- _If you’re in ``foo/bar/``, ``.`` will represent ``bar/``, ``..`` will represent ``foo/``._

Other areas of syntax: 
- The forward slash ``/`` represents the "root" of the filesystem. (Every directory/file in the Linux filesystem is nested under the root / directory.)
- The tilde ``~`` represents the home directory of the currently logged in user.

**Print working directory ``pwd``**
The ``pwd`` command prints the current/working directory, telling where you are currently located in the filesystem. This command comes to your rescue when you get lost in the filesystem, and always prints out the absolute path.

- _Absolute path:_ An absolute path is the full path to a file or directory. It is relative to the root directory (/).
- _Relative path:_ relative to your present working directory. If you are in your home directory, for example, the ls command's relative path is: ``../../usr/bin/ls.``

If it’s not absolute, then it’s a relative path. The relative path is relative to your present working directory. If you are in your home directory, for example, the ls command's relative path is: ``../../usr/bin/ls.``

**Change directory (``cd``)**
The ``cd`` command lets you change to a different directory. 

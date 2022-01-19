BRACKET COMPLETE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

Frequently, text inside parentheses, be it a warning "(don't do this)" or
function arguments "(foo, bar, 42)" is repeated. This also applies to other
bracket delimiters, e.g. HTML tags "&lt;img src='banner.jpg' alt=''&gt;" or arrays
"[1, 2, 3]".
This plugin provides a completion mapping that, when you realize you're typing
the same contents of a bracket-delimited text again, completes the entire text
inside the brackets from other matches in the buffer. The completion base
always contains the entire text between the cursor and the previous opening
bracket, so it doesn't matter how far you've already been into retyping this.

### SEE ALSO

- Check out the CompleteHelper.vim plugin page ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) for a full
  list of insert mode completions powered by it.

USAGE
------------------------------------------------------------------------------

    In insert mode, invoke the completion via CTRL-X %.
    You can then search forward and backward via CTRL-N / CTRL-P, as usual.

    CTRL-X %                Find matches for the text before the cursor, up to the
                            previous bracket ( [ { < on the current line, and
                            offer matches of the entire text inside the brackets,
                            like the i( i[ i{ i< text objects.
                            This also works for tag-blocks with the it text
                            object; "<b>f|" will complete to "<b>foo bar</b>".

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-BracketComplete
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim BracketComplete*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the MotionComplete.vim plugin ([vimscript #4265](http://www.vim.org/scripts/script.php?script_id=4265)).

CONFIGURATION
------------------------------------------------------------------------------

The general MotionComplete-configuration applies here, too.

For a permanent configuration, put the following commands into your vimrc:

The recognized bracket types are defined via a Dictionary. Its keys are the
opening brackets, which are mapped to an object that must have an "opposite"
attribute that specifies the closing bracket. If there's a text object, it can
be specified via the "textobject" attribute (without the preceding "a" / "i");
otherwise, a search to the closing bracket is used to retrieve the text.
To add an imaginary bracketing from : to ;, use:

    runtime plugin/BracketComplete.vim  " Define the default brackets first.
    let g:BracketComplete_BracketConfig[':'] = {'opposite': ';'}

If you want to use different mapping, map your keys to the
&lt;Plug&gt;(BracketComplete...) mapping target _before_ sourcing the script
(e.g. in your vimrc):

    imap <C-x>% <Plug>(BracketComplete)

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-BracketComplete/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### 1.01    14-Jan-2013
- CHG: Change default mapping to the more intuitive i\_CTRL-X\_%.

##### 1.00    12-Oct-2012
- First published version.

##### 0.01    02-Oct-2012
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2012-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;

#
# ZSHELL Global options
#

# Global options
setopt nobeep                  # i hate beeps
setopt alwaystoend             # when complete from middle, move cursor
setopt autopushd               # automatically append dirs to the push/pop list
setopt cdablevars              # avoid the need for an explicit $
setopt correct_all             # correct all the words in the command line
setopt noflowcontrol           # if I could disable Ctrl-s completely I would!
setopt RM_STAR_WAIT            # confirmation after 'rm *' etc..

# Most of these options are used for quick navigation.
setopt autocd                  # change to dirs without cd
setopt pushd_to_home           # Push to home directory when no argument is given.
setopt auto_pushd              # Push the old directory onto the stack on cd.
setopt auto_name_dirs          # Auto add variable-stored paths to ~ list.
setopt pushd_ignore_dups       # Do not store duplicates in the stack.

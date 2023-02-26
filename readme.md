# The things I want to remember from this config

1. For Tmux, there are two scripts he has made. The problem with scripts is that, you have to give them access and so that is the reason why it did not work at first. 
2. In vim Tmux sessionizer would not work because tmux sessionizer is still not in path yet so you have to put it in the path for it to work without the full path in the remap.lua.
3. After migrating from bash to zsh with all the installs. You have to write ". ~/z.sh" so it would work with all the commands after that. 



## LuaSnip Problems

**Note this is only for lua style snippets that are highly customizable and you can go for easier ones like the vs code snippets that involve some parser related commands. **

You can directly make it work by adding a lua snip in the after plugin directory

1. in configs, the S and I are shortheads that have there literally meaning at the top
2. To add new line and tabs you need the fmt formatter and it takes a single literal or a [[]] double bracket argument, for the purpose of formatting your snippet, you should use the double brackets one. 
3. s  snippet takes ("command' , "snippet")

## Shortcut Keys
#### Tmux
1. <C-a>s - to get the list of all the sessions. j k to move up and down.
2. "tmux  new -s sessionName" - to create a new session with the given name.
3. "tmux detach" - to get out of the session without deleting it.
4. "tmux attach -t sessionName" - to reattach to the existing session.
5. "tmux ls" - List all the tmux sessions
6. "<C-a>w" - to open the list of all the windows. j k to move up and down.
7. "C-a>c" - create a new window
8. "<C-a>," - to rename the window.
9. "<C-a>n or p" - to move forward or backward in the windows list. 
10. "<C-a>d" - detach from current session.
11. "<C-a>x" - close pane.
12. "<C-a>:new" - to create a new session.
13. "C-a> [" - to enter into copy mode and use the vim keybindings to scroll through the terminal shift J and K also works wonders. Used for coping with v mode as well.
14. "C-a{ or }" - to shift the position of the tmux windows
15. "C-d or u " - same as vim
16. "C-F or B" - go full page and down.
17. "C-c" - to get out of copy mode.

#### vim
1. Alt j and k - to move in harpoon pages
2. Dap - delete entire paragraph
3. Diw - delete entire word
4. Ci( or ) or " or '
5. Ca( or ) or " or '
6. Works with y as well as visual mode 
7. Vi(
8. Cib/ciB - change text current set of parenthesis or braces


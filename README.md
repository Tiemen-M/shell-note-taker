# shell note taker
## In short
Note taker program for the commando-line. That relies on file attributes. 

## Description
It is a command-line command for taking notes. It stores notes in a directory and extract the tags 
from the lines that begins with "#->". Then add these tags as attributes to the note's file. 

## Build instructions
### Prerequisites
- A linux distro
- A filesystem that supports file attributes like ext4.
- bash, sed, attr
- A text-based editor like nano

### Install
1. Change the default setup variables in `shell_note_taker.sh`
2. Add the line `source <path_to_script>` to ~/.bashrc
3. Activate script by `source <path_to_script>`

### Use
Important commands that the script exports to the shell:
- `note <note_titel>`, Creates a note at `<note_dir>/<date>_<titel>.txt` and apply attributes.
- `note_tag <tag_name>`, Opens a note by a tag name.
- `list_tags`, give a list of all tags of all notes.

To create a new note:
1. Typ `note <note_titel>` where `<note_titel>` is a chosen name for the note.
2. You entered now your favorite text based editor.
3. Write your note
4. Add tags that on lines that begins with `#->`
4. Save and exit the editor
5. The command will automatically extract tags from lines that begins with `#->` and applies them.
!note: At the moment one tag per note is supported!

For opening a note there are two ways:
- Way 1: Go directly to the note_dir folder
- Way 2: Use `note_tag <tag_name>`

## Ideas for the future
- [ ] Support multiple tags for one note 
- [ ] resolve bug that note apply a tag too early after editor is paused.
- [ ] add note directive that download a webpage and washed to simplified form
- [ ] add pdf generator to note
- [ ] create a central command to use note note_tag apply_tag and list_tags functionalities
- [ ] add typo correction

## Author
This project is created by:
- Initial author: **[Tiemen Molenaar](https://github.com/Tiemen-M)** 

## License
This project is licensed under the terms of the GNU General Public License version 3.
See the [COPYING](./COPYING) file for the full text.

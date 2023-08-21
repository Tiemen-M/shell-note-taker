# created by tiemen Molenaar

# setup variables
note_dir=~/.note
editor=nano

# create data store dir if not exists
if test ! -d $note_dir;
then
	echo create $note_dir
	mkdir $note_dir
fi

# adds a attr tag to a file if specified in file with '#-><tag>'
# apply_tag <file name>
function apply_tag() {
	filename=$@
    # check if the file contains tags
	sed '/^#->\(.*\)/q10;' $filename > /dev/null
	if test $? -eq 10
	then
        # extract tag name from file
		tag=$(cat $filename | sed '/^#->\(.*\)/!d; s/^#->\(.*\)/\1/' | tr '[:blank:]' '_')
		# add tag as a attr value to the file
		attr -q -s note_tag -V $tag $filename
        # message user that tag is added
        echo add \'$tag\' tag to file
	else
		echo No tags found in file
	fi
}

# commando to add a note: note <note_titel>
function note {
	# format new filename in "<date>_<titel>.txt" and replace spaces
	# with undercores
	filename=$(date +"%y_%m_%d")_$(echo $@ | tr '[:blank:]' '_').txt
	# open file with favorite editor
	$editor $note_dir/$filename
	# apply tag
	apply_tag $note_dir/$filename
}

# commando to open note with a tag: note_tag <tag>
function note_tag {
	filename=""
	for i in $note_dir/*.txt
	do
		# get note_tag value of file
		tag=$(attr -q -g note_tag $i 2>/dev/null)
		# if file tag compares to given argument
		# end search and open editor
		if test "$tag" == "$(echo $@)"
		then
			filename=$i
			$editor $filename
            # apply tag
			apply_tag $filename
			return
		fi
	done
    # this code will only be reached when tag is not found
    echo There are no notes with the tag \'$@\'
}

# list all used tags: list_tags
function list_tags {
    for i in $note_dir/*.txt
    do
        tag=$(attr -qg note_tag $i 2> /dev/null)
        if [ $? -eq 0 ]
        then
            echo $tag
        fi
    done
}

# expose commando's to the user
export note
export note_tag
export apply_tag

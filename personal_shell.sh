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

# adds a attr tag to a file if specified in file with '#>tag_note:<tag>'
#function apply_tag() {
	# todo
#}

# commando to add a note: note <note_titel>
function note {
	# format new filename in "<date>_<titel>.txt" and replace spaces 
	# with undercores
	filename=$(date +"%y_%m_%d")_$(echo $@ | tr '[:blank:]' '_').txt
	# open file with favorite editor
	$editor $note_dir/$filename
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
		if test tag=$@
		then
			filename=$i
			$editor $filename
			break
		fi
	done
}

# expose commando's to the user
export note
export note_tag

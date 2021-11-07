##
# Project Title
#
# @file
# @version 0.1

package:
	rm -f hunter.tar.gz
	tar -C .. -cvf hunter.tar.gz ./hunter
	$(eval HUNTER_PWD := $(shell pwd | sed 's/\//\\\//g'))
	$(eval HUNTER_SHA := $(shell sha1sum hunter.tar.gz | cut -f1 -d" "))
	echo $(HUNTER_PWD) $(HUNTER_SHA)
	sed --follow-symlinks -i -e 's/URL .*$\/URL \"file:\/\/$(HUNTER_PWD)\/hunter.tar.gz\"/' _targetfile
	sed --follow-symlinks -i -e 's/SHA1 .*$\/SHA1 \"$(HUNTER_SHA)\"/' _targetfile
	head -n 40 _targetfile

# URL  file://~/src/github/hunter.tar.gz
# end

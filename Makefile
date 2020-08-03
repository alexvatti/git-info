all:

version.h:
	git  rev-parse HEAD | awk ' BEGIN {print "#ifndef VERSION_H"} {print "#define VERSION_H"} {print "const char * git_commit_info = \"" $$0"\";"} END {}' > version.h
	git describe --tags | awk 'BEGIN {} {print "const char * git_tag_info = \""$$0"\";"} END {} ' >> version.h
	git rev-parse --abbrev-ref HEAD | awk 'BEGIN {} {print "const char * git_branch_info = \""$$0"\";"} END {} ' >> version.h
	git remote get-url origin | awk 'BEGIN {} {print "const char * git_url_info = \""$$0"\";"} END {} ' >> version.h
	date | awk 'BEGIN {} {print "const char * build_time = \""$$0"\";"} END {} ' >> version.h
	awk 'BEGIN {print "#endif"} ' >> version.h

hello: main.c version.h
	gcc -o hello main.c
clean:
	rm hello version.h *.o 


#include<stdio.h>
#include "version.h"
void build_information()
{
    printf("git URL Info=%s\n",git_url_info);
    printf("git Branch Info=%s\n",git_branch_info);
    printf("git tag Info=%s\n",git_tag_info);
    printf("git commit id Info=%s\n",git_commit_info);
    printf("Build Info=%s\n",build_time);
}

int main()
{
    printf("Hello World..\n");
    build_information();
    return 0;
}


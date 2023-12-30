Command line for the win
========================

-   By Sylvain Kalache, co-founder at Holberton School
-   Weight: 1

![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/324/06AChAO.png)

Background Context
------------------

[CMD CHALLENGE](https://alx-intranet.hbtn.io/rltoken/a83_NOBEtXgFr1Yqej0HYA "CMD CHALLENGE") is a pretty cool game challenging you on Bash skills. Everything is done via the command line and the questions are becoming increasingly complicated. It's a good training to improve your command line skills!


### How I used the SFTP command-line tool to move local screenshots to the sandbox environment
* I opened terminal
* I navigated to the directory on my local machine where the screenshot is saved
* I used the SFTP command-line tool to establish a connection to the sandbox environment using

```bash
sftp <username>@<hostname>
```
* I navigated to the directory on the sandbox environment where I want to upload the screenshots -> `/root/alx-system_engineering-devops/command_line_for_the_win/`
* I used the SFTP `put` command to upload the screenshots from my local machine to the sandbox environment
* I confirmed that the screenshots have been successfully transferred by checking the sandbox directory using `ls`
* I pushed to files to GitHub

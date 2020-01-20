---
layout: post
title: "Ubuntu Shell Commands"
date: 2019-12-26
tags: Ubuntu shell unix
image: https://assets.ubuntu.com/v1/29985a98-ubuntu-logo32.png
thumb: https://assets.ubuntu.com/v1/29985a98-ubuntu-logo32.png
type: spec
---
The Ubuntu operating system is a popular operating system, however often accessing a gui is either not appropriate or simple not available.  These command line operations help the administration and use of an Ubuntu host.

<!-- markdownlint-disable MD018 MD033 -->

## File systems

Ubuntu can use a range of different file systems, however here are the most typical

* Extended File System [EXT](https://en.wikipedia.org/wiki/Extended_file_system)
  * EXT4 is the standard for Ubuntu
  * Windows cannot access these file systems without additional functionality  
* File Allocation Table [FAT](https://en.wikipedia.org/wiki/File_Allocation_Table)
  * Useful to transfer files between Windows and *nix systems like Ubuntu as both operating systems support the standard implementation

## Concepts and Glossary

Term | Meaning
----|-----
*Symbolic Link* |- can cross the file system,<br>- allows you to link between directories, <br>- has different inode number and file permissions than original file, <br>- permissions will not be updated, <br>- has only the path of the original file, not the contents.
*Hard link*|-can’t cross the file system boundaries (i.e. A hardlink can only work on the same filesystem),<br>- can’t link directories,<br>- has the same inode number and permissions of original file,<br>- permissions will be updated if we change the permissions of source file,<br>- has the actual contents of original file, so that you still can view the contents, even if the original file moved or removed

Shells such as bash, csh, ksh and dash are implementations of the POSIX standard.  [POSIX Standard](http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html)

The implementation used by default on a system is determined by either a symbolic link or hard link on the file */bin/sh* which points to a POSIX implementation.

Command Line | Description
--------|--------
**file -h /bin/sh** | *(Symbolic link)* A portable way to determine which shell is being used by a system
**find -L /bin -samefile /bin/sh** | *(Hard link)* A portable way to determine which shell is being used by a system

## Basic

Command Line | Description
--------|--------
**ls** | directory listing
**ls** -al | formatted listing with hidden files
**cd** *directory* | change directory to dir
**cd** or **cd** ~ | change to home
**pwd** | show current directory
**mkdir** *directory* | create a directory dir
**rm** *file* | delete file
**rm** -r *directory* | delete directory dir
**rm** -f *file* | force remove file
**rm** -rf *directory* | force remove directory dir *
**cp** file1 file2 | copy file1 to file2
**cp** -r dir1 dir2 | copy dir1 to dir2; create dir2 if it doesn't exist
**mv** file1 file2 | rename or move file1 to file2 <br>if file2 is an existing directory, moves file1 into directory file2
**ln** -s *file* link | create symbolic link link to file
**touch** *file* | create or update file
**cat** *file* | show the text characters within a file
**cat** > *file* | places standard input into file
**more** *file* | output the contents of file
**head** *file* | output the first 10 lines of file
**tail** *file* | output the last 10 lines of file
**tail** -f *file* | output the contents of f
**man** *topic* | man pages provide command line help documentation for most commands. e.g. *man ls* to learn more about the ls command
**nano** *file* | minimalist editor with cli gui
**vi** *file* | (*vim*) powerful minimalist editor with no gui

## Search

Command Line | Description
---- | -----
**grep** pattern files | search for pattern in files
**grep** -r pattern dir | search recursively for pattern in dir
*command* | **grep** *pattern* | search for pattern in the output of command
**locate** *file* | find all instances of file

## System Details

Command Line | Description
---- | -----
**date** | show the current date and time
**cal** | show this month's calendar
**uptime** | show current uptime
**w** | display who is online
**whoami** | who you are logged in as
**finger** *user* | display information about *user*
**uname** -a | show kernel information
**cat /proc/cpuinfo** | cpu information
**cat /proc/meminfo** | memory information
**df** | show disk usage
**du** | show directory space usage
**free** | show memory and swap usage
**whereis** *app* | show possible locations of app
**which** *app* | show which app will be run by default
**lsusb** | list usb devices
**dmesg** | show recent system log messages

## Compression

Command Line | Description
---- | -----
**tar** cf *file*.tar *files* | create a tar named file.tar containing files
**tar** xf *file*.tar | extract the files from file.tar
**tar** czf *file*.tar.gz *files* | create a tar with Gzip compression
**tar** xzf *file*.tar.gz | extract a tar using Gzip
**tar** cjf *file*.tar.bz2 | create a tar with Bzip2 compression
**tar** xjf *file*.tar.bz2 | extract a tar using Bzip2
**gzip** *file* | compresses file and renames it to file.gz
**gzip** -d *file*.gz | decompresses file.gz back to file

## Processes

May require elevation to modify processes not owned by the current user

Command Line | Description
---- | -----
**ps** | display your currently active processes
**ps** -ax | display all processes currently active on a system
**top** | display all running processes
**kill** pid | kill process id pid
**killall** proc | kill all processes named proc *
**bg** | lists stopped or background jobs; resume a stopped job in the background
**fg** | brings the most recent job to foreground
**fg** n | brings job n to the foreground

## Command Chaining Syntax

Command Line | Description
---- | -----
*op1* && *op2* | execute *op1* and then *op2* immediately after *op1* completes, if and only if *op1* returns zero (0)
*op1* \|\| *op2* | execute *op1*, and then *op2* immediately after *op1* completes, if and only if *op1* returned non-zero

## Privileges

Command Line | Description
--------|--------
**sudo** *command* | run a command as a root user
**sudo** su | switch to a shell which is elevated to root user
**sudo** -s | open a root user shell (same as above)
**sudo** -s -u *username* | open a user shell as *username*
**sudo** -k | forget sudo passwords (prevents sudo privileges persisting in the current shell. e.g. remote assistance)
**gksudo** *command* | opens a gnome sudo dialog
**kdesudo** *command* | opens a kde sudo dialog
**passwd** | change your password
**chmod** *permissions* *file* | change to rights on a specific file or directory.<br>See '*man chmod*' for permissions
**chown** *user*:*group* *file* | change ownership of a specific file or directory, to a provided user and/or group. See '*man chown*'

## Display

Command Line | Description
--------|--------
**sudo** /etc/init.d/gdm restart | restart X window manager and display login
**sudo** /etc/init.d/kdm restart | restart X window manager and display login
(*file*) /etc/X11/xorg.conf | X11 display configuration

## System Services

**sudo start** *service*
**sudo stop** *service*
**sudo status** *service*
/etc/init.d/*service* start | start *service*
/etc/init.d/*service* stop | stop *service*
/etc/init.d/*service* status | display *service*
/etc/init.d/*service* restart | restart *service*
**runlevel** | gets the current runlevel

## Network

Command Line | Description
--------|--------
**ifconfig** | show network details
**iwconfig** | show wireless information
**sudo iwlist** scan | scan and list wireless networks
**sudo /etc/init.d/networking** restart | restart network, used for manual configuration
(*file*) /etc/network/interfaces | manual configuration
**ifup** *interface* | bring *interface* up
**ifdown** *interface* | bring *interface* down
**ping** *host* | ping host and output results
**whois** *domain* | get whois information for domain
**dig** *domain* | get DNS information for domain
**dig** -x *host* | reverse lookup host
**wget** *file* | download file
**wget** -c *file* | continue a stopped download
**sudo /etc/init.d/dns-clean start** | flush dns cache
**sudo systemd-resolve** --flush-caches | flush dns caches
**sudo systemd-resolve** --statistics | validate dns cache size
**traceroute** *host* | traces the route to a host machine
**sudo netstat** -plnt | list active listening sockets with PID
**sudo netstat** -plnt \| grep ':80' | list active listening sockets with PID on port 80

## Firewall

Command Line | Description
--------|--------
**ufw** enable | enable firewall
**ufw** disable | disable firewall
**ufw** default allow | allow all connections by default
**ufw** default deny | deny all connections by default
**ufw** status | display current firewall status and rules
**uwf** allow *port* | allow *port*
**ufw** deny *port* | deny *port*
**ufw** deny from *ip* | deny specified ip address

## Secure Shell - SSH

Command Line | Description
--------|--------
**ssh** *user*@*host* | connect to host as user
**ssh** -p port *user*@*host* | connect to host on port *port* as user
**ssh** -R listening_port:localhost:22 remote_user@remote_host -i key.pem | Enable SSH Tunnelling on a machine, establishing communication through which a reverse connection can be made.
**ssh** listening_user@localhost -p listening_port | Connect to listening SSH Reverse Tunnel
**ssh-copy-id** *user*@*host* | add your key to host for user to enable a keyed or passwordless login
**sshfs** *user*@*host*:*/remote/path* /*local*/*path* | mount a remote path to a local path using ssh

## Package Management

Command Line | Description
--------|--------
**apt-get** update | retrieve list of available packages
**apt-get** upgrade | upgrade all packages
**apt-get** dist-upgrade | upgrade Ubuntu version
**apt-get** install *pkg* | install package *pkg*
**apt-get** purge *pkg* | uninstall package *pkg*
**apt-get** autoremove | remove all obsolete packages
**apt-get** -f install | fix broken packages
**dpkg** --configure -a | fix broken packages
(*file*) /etc/apt/sources.list | all apt packages configuration
**snap** find *package* | searches for a snap package named *package*
**sudo snap** install *package* | installs a snap package named *package*
**snap** list | display list of installed snaps
**sudo snap** refresh *package* | attempt to get latest version of snap package
**sudo snap** refresh | update all snap packages
**sudo snap** revert *package* | rollback to the previous version of a snap package

row
===

Rails on Windows instructions

Software       | Location
-------------- | ------------
Ruby & Devkit  | http://rubyinstaller.org/downloads/
Gzip           | http://gnuwin32.sourceforge.net/packages/gzip.htm
NodeJS         | https://nodejs.org/en/download
SQLite         | https://www.sqlite.org/download.html
Tar            | http://gnuwin32.sourceforge.net/packages/gtar.htm

Download...

1. Ruby 2.3.0
  - do <b>not</b> download 'Ruby 2.3.0 <b>(x64)</b>'
  - these instructions cover the 32 bit install of Ruby which will work on both 32 and 64 bit machines
2. DevKit-mingw<b>64-32</b>-4.7.2-20130224-1151-sfx.exe
  - pay special attention to the name -- important to grab the file with '<b>64-32</b>' in the name
3. Gzip
  - choose the zipped binary file
4. NodeJS
  - choose the 32 bit 'Windows Binary (.exe)'
5. SQLite
  - choose the 'autoconf' source: sqlite-autoconf-3090200.tar.gz
6. Tar
  - choose the binary 'Setup' which is an installer


## Initial setup

Open the command prompt, 'cmd'.  Create a directory off of the root of your drive, for most people this will be c:, type the following to create the row directory and then navigate to it with 'cd' or change directory.
```cmd
C:\Users\Jon>mkdir \row
C:\Users\Jon>cd \row
```
If you've typed the above correctly, the command prompt should look like:
```cmd
C:\row>
```
Next, we want to create a batch file which we'll use to somewhat consolidate and isolate our Rails environment.  At the prompt, type:
```cmd
C:\row>notepad row.bat
```
Notepad should have started and will prompt you to create the file, choose yes.  Next add the following to the file:
```cmd
REM Set PATH to directories as required
set PATH=c:\windows;c:\windows\system32

REM Start a command prompt with a title and defaulting to the \row directory
start "Rails on Windows" /D \row
```
Save the file and close notepad.  At the command prompt type the following and hit enter:
```cmd
C:\row>row.bat
```
If the batch file was created properly, a new cmd prompt window should have opened named 'Rails on Windows'.
```cmd
Microsoft Windows [Version 10.0.10240]
(c) 2015 Microsoft Corporation. All rights reserved.

C:\row>
```
Next, lets launch explorer (the dot says to open explorer in the current directory):
```cmd
C:\row>explorer .
```
Right-click on row.bat and select 'Send to' -> 'Desktop (create shortcut).  With that, you'll be able to conveniently launch the Rails on Windows command prompt from the Desktop.

## Install Ruby and Devkit

* Run the ruby installer and choose ```c:\row\local``` as the installation location.
* Run the devkit self-extracting exe file, and extract to ```c:\row\local```

Close all previous instances of the Rails on Windows command prompt and relaunch using the short-cut created on the Desktop.  Having now installed Ruby if we try to run ruby to get the version you'll see that we get an error:
```cmd
C:\row>ruby -v
'ruby' is not recognized as an internal or external command,
operable program or batch file.

C:\row>
```
The reason for this error is that we haven't updated the PATH variable to include the path to the directory containing the Ruby executable.  Open row.bat with Notepad:
```cmd
C:\row>notepad row.bat
```
Next add 'c:\row\local\bin' to the PATH variable:
```cmd
REM Set PATH to directories as required
set PATH=c:\windows;c:\windows\system32
set PATH=%PATH%;c:\row\local\bin

REM Start a command prompt with a title and defaulting to the \row directory
start "Rails on Windows" /D \row
```


Change directory to the 'local' directory:
```cmd
C:\row>cd local
```
Once in the 'local' directory, run the following:
```cmd
C:\row\local>ruby dk.rb init
```
You should see the following output:
```cmd
C:\row\local>ruby dk.rb init
[INFO] found RubyInstaller v2.3.0 at C:/row/local

Initialization complete! Please review and modify the auto-generated
'config.yml' file to ensure it contains the root directories to all
of the installed Rubies you want enhanced by the DevKit.

C:\row\local>
```
With the devkit initialization complete, next we'll install devkit:
```cmd
C:\row\local>ruby dk.rb install
```

## Upgrade command prompt to use Bash
Devkit provides some useful GNU tools for compiling source code on Windows.  One of the tools is Bash, a common shell program.  Along with enhanced features over Windows command-prompt, it will facilitate compiling source code (sqlite for example) required for our Rails install.  It's also helpful to become introduced to Bash as Bash is a very common shell available in Unix/Linux systems.  If you choose to become more serious about Rails development, you will move on to a Linux/Unix environment for development.

Double-click the row.bat shortcut on your desktop to launch the Rails on Windows command prompt.  Once open, type:
```cmd
C:\row>notepad row.bat
```
Next, we need to add a couple directories to the PATH variable.  We also want to set the HOME variable which will be useful for our bash shell.  Finally, see how we add 'bash' to the end of the 'start' command:
```cmd
REM Set PATH to directories as required
set PATH=c:\windows;c:\windows\system32
set PATH=%PATH%;c:\row\local\bin
set PATH=%PATH%;c:\row\local\mingw\bin

REM Set HOME, useful for bash
set HOME=c:\row

REM Start a command prompt with a title and defaulting to the \row directory
start "Rails on Windows" /D \row bash
```
Save row.bat and close notepad.  Try launching row.bat again and notice now the command-prompt should look something like:
```bash
bash-3.1$ 
```
The prompt now says ```bash-3.1$``` but we can configure it to be more useful.  Create a file called .bashrc:
```bash
bash-3.1$ notepad .bashrc
```
Add the following lines:
```bash
PS1="[\u@\h \W]\$ "
PS2="> "
```
Save the file, close the command prompt windows and lets double-click the row.bat shortcut again.  Now, what you should see is something similar to:
```bash
[Jon@Jon-PC ~]$
```
The .bashrc file is run everytime the bash shell starts up.  So, in this case, when bash starts the PS1 and PS2 environment variables are set to configure the prompt in the format we see.  You can configure the shell's prompt any way you like.  This configuration I've chosen is common which lists the user@host and lists the current directory.  (~ refers to the HOME directory, so for example if you want to change directory back to HOME you'd simply type: ```cd ~```. 

## Install tar and gzip
In the Unix/Linux world, source code is often distributed as a compressed tar of files.  Tar combines the files into one and gzip is often used to compress the file.

To install 'tar', double-click on the tar exe (tar-1.13-1-bin.exe) to launch the installer.  Choose c:\row\local for the installation location.

To install 'gzip', right-click on 'gzip-1.3.12-1-bin.zip' and select 'Extract all' to unzip the archive to c:\row\local.

Now, to test that the installations of gzip and tar have been successful, double-click row.bat shortcut and type the following:
```bash
[Jon@Jon-PC src]$ where gzip
c:\row\local\bin\gzip.exe
[Jon@Jon-PC src]$ where tar
c:\row\local\bin\tar.exe
[Jon@Jon-PC src]$
```
The 'where' command should indicated the path to each executable.

## Install SQLite
To install SQLite, first create a directory under local called src and change directory to it:
```bash
[Jon@Jon-PC ~]$ cd local
[Jon@Jon-PC local]$ mkdir src
[Jon@Jon-PC local]$ cd src
[Jon@Jon-PC src]$ 
```
Next, using explorer, copy sqlite-autoconf-3090200.tar.gz from your downloads folder/directory and paste it in c:\row\local\src.

With the sqlite src in the src directory, first uncompress the file:
```bash
[Jon@Jon-PC src]$ gzip -d sqlite-autoconf-3090200.tar.gz
[Jon@Jon-PC src]$ 
```

Now when you do an 'ls' you should see the following:
```bash
[Jon@Jon-PC src]$ ls -al
total 8764
drwxr-xr-x  2 Jon Administrators       0 Dec 10 16:58 .
drwxr-xr-x 16 Jon Administrators    4096 Dec  8 17:42 ..
-rw-r--r--  1 Jon Administrators 8970240 Dec  8 17:41 sqlite-autoconf-3090200.tar
```

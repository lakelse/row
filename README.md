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

1. Ruby 2.2.3
  - do <b>not</b> download 'Ruby 2.2.3 <b>(x64)</b>'
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


Install...

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
```
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

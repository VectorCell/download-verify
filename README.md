download-verify
===============

Quick and dirty script to download a things and verify file integrity.

Usage:

	download <url of md5 file>

or

	download-scp <address:/path/to/md5-file>

The md5 file should be the result of a md5sum call on the file, in the directory in which it resides. The file should contain one or more lines that look like this:

	<md5 hash> <filename>

And each file should be accessable in the same directory as the md5 file.

WARNING ABOUT download-scp: Using this method without having ssh keys properly set up will cause you to have to enter your password for each file download, ruining the "hands-off" intention of this script.

Usage of the more trivial features of this script may require inclusion of the program "toilet".

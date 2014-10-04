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

Usage of the more trivial features of this script may require inclusion of the program <a href="http://caca.zoy.org/wiki/toilet">toilet</a>.

I made this because I was trying to transfer large files over a very slow, unreliable network connection. Since I kept getting connection timeouts and corrupted files, I decided to split the files into smaller parts and download them separately. This script lets me download them all using a single set of md5 checksums to verify file integrity. This script doesn't stop until all files are downloaded, and their integrity is verified using the checksums. As such, it's entirely possible that this script will run forever. This may be caused by a really crappy network connection, missing files on the server, etc.

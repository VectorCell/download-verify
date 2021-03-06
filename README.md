download-verify
===============

Quick and dirty script to download a bunch of things with wget or scp, and verify file integrity.

Usage:

	download <url of md5 file>

or, for password-protected stuff, use the same argument style that wget uses:

	download <password>

or, if you want to download files using scp instead of wget

	download-scp <address:/path/to/md5-file>

The md5 file should be the result of a md5sum call on the file, in the directory in which it resides. The file should contain one or more lines that look like this:

	<md5 hash> <filename>

And each file should be accessable in the same directory as the md5 file. Here is an example of a valid md5 file:

	cdd9be3c147911a15b63229b02d2031d  file1.txt
	5f6d8a11ed64cbbecc4864e20a0f3e60  file2.mp4
	1cbbd5b9f871ea0041caa699e3f4edc1  file3.pdf
	cdd543cf35a0408746226bfd2579c2e6  file4.7z

This can be generated easily on all files in a directory like this, where "sums.md5" can be replaced by whatever you want to call the md5 sum file:

	for file in $(ls); do md5sum $file >> sums.md5; done

or by using the included "prepare" script, which generates a checksum file for all files in the current directory, like this:

	prepare <filename-to-create>

WARNING about using download-scp: Using this method without having ssh keys properly set up will cause you to have to enter your password for each file download, ruining the "hands-off" intention of this script.

ANOTHER WARNING: These scripts were not designed to work with files that have spaces in their names (and certainly won't work with weird files that have newlines and other such oddities in their names). I don't need this to work with those kinds of files, and I probably won't rewrite it to make it so. As it is now, this script will fail miserably on filenames with spaces.

Usage of the more trivial features of this script may require inclusion of the program <a href="http://caca.zoy.org/wiki/toilet">toilet</a>.

I made this because I was trying to transfer large files over a very slow, unreliable network connection. Since I kept getting connection timeouts and corrupted files, I decided to split the files into smaller parts and download them separately. This script lets me download them all using a single set of md5 checksums to verify file integrity. This script doesn't stop until all files are downloaded, and their integrity is verified using the checksums. As such, it's entirely possible that this script will run forever. This may be caused by a really crappy network connection, missing files on the server, etc.

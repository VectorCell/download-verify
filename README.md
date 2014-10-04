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

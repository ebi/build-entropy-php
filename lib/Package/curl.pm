package Package::curl;

use strict;
use warnings;

use base qw(PackageSplice);

our $VERSION = '7.15.1';





sub base_url {
	return "http://curl.haxx.se/download";
}


sub packagename {
	return "curl-" . $VERSION;
}



sub subpath_for_check {
	return "lib/libcurl.dylib";
}




1;
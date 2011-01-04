package Package::phpunit;

use strict;
use warnings;
use base qw(Package::pearbase);

our $VERSION = '3.5.6';

sub init {
    my $self = shift;
    $self->SUPER::init(@_);
    $self->{PACKAGE_NAME} = "PHPUnit";
    $self->{VERSION} = $VERSION;
}

sub base_url {
    return "http://pear.phpunit.de/get";
}

sub install {
    my $self = shift @_;
    $self->SUPER::install(@_);
    
    my $src = $self->packagesrcdir();
    my $dst = $self->install_prefix() . '/bin';
    
    # create 2 binaries: phpunit and phpdb with sed
    $self->shell({silent => 0}, "sed 's|\@php_bin\@|" . $dst . "\/php|' " . $src . "/phpunit.php >" . $dst . "/phpunit");
    $self->shell({silent => 0}, "chmod 0755 " . $dst . "/phpunit");
    # $self->shell({silent => 0}, "sed 's|\@php_bin\@|" . $dst . "\/php|' " . $src . "/dbunit.php >" . $dst . "/dbunit");
    # $self->shell({silent => 0}, "chmod 0755 " . $dst . "/dbunit");
}

sub subpath_for_check {
    my $self = shift @_;
    return sprintf("bin/phpunit");
}

return 1;
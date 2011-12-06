#!/usr/bin/env perl
use 5.010;
use utf8;
use strict;
use warnings;
 
use OpenDocument::Template;
 
my $template_dir = 'test-odt/templates';
my $src          = 'test-odt/template.odt';
my $dest         = 'test-odt/result/result.odt';
 
my %config_file;
 
$config_file{templates}{'content.xml'} = {
    test    => 'English',
    korean   => '한글',
};
 
my $odt = OpenDocument::Template->new(
    config       => \%config_file,
    template_dir => $template_dir,
    src          => $src,
    dest         => $dest,

$odt->generate;

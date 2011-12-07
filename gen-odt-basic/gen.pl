#!/usr/bin/env perl
use 5.010;
use utf8;
use strict;
use warnings;
 
use OpenDocument::Template;
 
my $name  = "이민선";
my %date  = ( 
        "y"=>"2011",
        "m"=>"12",
        "d"=>"8",
);

my $time=time;

my $template_dir = 'templates';
my $src          = 'template.odt';
my $dest = sprintf "templates/result/%s-%s.odt", $time,$name;
 
my %config_file;

$config_file{templates}{'content.xml'} = {
    name    => $name,
    date      => \%date,
};
 
my $odt = OpenDocument::Template->new(
    config       => \%config_file,
    template_dir => $template_dir,
    src          => $src,
    dest         => $dest,
);
$odt->generate;

#!/usr/bin/perl

## Often files which are included contain terrible characters in their filenames which make it painful to access.  This script cleans the filenames of files in the current working directory.

use strict;

sub processDir
{
    my $dir=shift;
    opendir(DIR, $dir);
    my @files=grep {! /^\.\.?$/} readdir(DIR);
    closedir(DIR);
    foreach my $file(@files)
    {
        if(-d "$dir/$file") 
        {
            processDir("$dir/$file");
        }
        my $newfile=$file;
        $newfile=~ s/[,& '\(\)]/_/g; #Search for ',','&','<','>','*','?','|','"',':', "'", '(', ')' in filenames and replace them with underscores.
        if( $newfile ne $file )
        {
            print "Renaming \"$dir/$file\" to \"$dir/$newfile\"\n";
            rename "$dir/$file","$dir/$newfile" or warn("Problems renaming $dir/$file --> $dir/$newfile: $!\n"); 
        }
    }
}

my $dir=shift;
if(!defined($dir))
{
    $dir=".";
}
processDir($dir);

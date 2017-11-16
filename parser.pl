#!/usr/bin/perl
#use strict;
#use warnings;
use File::Basename;

my ($name, $path, $suffix);
my $filename = "log.log";

( $name, $path, $suffix ) = fileparse( $filename, "\.[^+.]*" );

print $name."\n";
print $path."\n";
print $suffix."\n";

print "File is ". $name.$suffix."\n";

open (LOGFILE,"$filename") || die "  Error opening log file $filename.\n";

while($line = <LOGFILE>) {
    chomp;
    print "$line\n";
}

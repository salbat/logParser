#!/usr/bin/perl
#use strict;
#use warnings;
use File::Basename;

my ($name, $path, $suffix);
my $filename = "log.log";
my $count;

( $name, $path, $suffix ) = fileparse( $filename, "\.[^+.]*" );

print $name."\n";
print $path."\n";
print $suffix."\n";

print "File is ". $name.$suffix."\n";

open (LOGFILE,"$filename") || die "  Error opening log file $filename.\n";

while(defined($line = <LOGFILE>)) {
    chomp;
    #print "$line\n";


    if ($line =~ /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/) {
        $count++;
        print "$1\n";
    }
}

print "Total number of IP hits: $count\n";

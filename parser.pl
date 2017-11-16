#!/usr/bin/perl
#use strict;
#use warnings;
use File::Basename;
use Geo::IPfree;

my ($name, $path, $suffix);
my $filename = "log.log";
my $count, %countries;
my $geo = Geo::IPfree->new;
my %data = ();

( $name, $path, $suffix ) = fileparse( $filename, "\.[^+.]*" );

open (LOGFILE,"$filename") || die "  Error opening log file $filename.\n";

while(defined($line = <LOGFILE>)) {
    chomp;
    if ($line =~ /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/) {
        $count++;
        my( $code, $country ) = $geo->LookUp( $1 );
        $data{$country}++;
    }
}

print "Total number of IP hits: $count\n";
print "$_ $data{$_}\n" for (keys %data);

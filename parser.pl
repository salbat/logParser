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

print "\$data{'John Paul'} = $data{'John Paul'}\n";
print "\$data{'Lisa'} = $data{'Lisa'}\n";
print "\$data{'Kumar'} = $data{'Kumar'}\n";


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
        #print "$1\n";

        my( $code, $country ) = $geo->LookUp( $1 );

        #print "Country: $country\n" . "Country Code: $code\n";

        $data{$country}++;
        #print "$country occurred: $data{$country}\n";

    }
}

print "Total number of IP hits: $count\n";
print "$_ $data{$_}\n" for (keys %data);

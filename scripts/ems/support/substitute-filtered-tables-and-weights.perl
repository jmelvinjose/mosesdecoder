#!/usr/bin/perl -w 

use strict;
use Getopt::Long "GetOptions";
use FindBin qw($RealBin);

if (scalar @ARGV != 4) {
  die("ERROR: wrong args");
}

my $filteredPath = $ARGV[0];
my $origPath = $ARGV[1];
my $tunedPath = $ARGV[2];
my $outPath = $ARGV[3];

my $tempPath = "/tmp/moses.ini.$$";

print STDERR "filteredPath=$filteredPath \n";
print STDERR "origPath=$origPath \n";
print STDERR "tunedPath=$tunedPath \n";
print STDERR "outPath=$outPath \n";
print STDERR "tempPath=$tempPath \n";

my $cmd;
$cmd = "$RealBin/substitute-filtered-tables.perl $filteredPath < $origPath > $tempPath ";
print STDERR "cmd=$cmd \n";
system($cmd);

$cmd = "$RealBin/substitute-weights.perl $tempPath $tunedPath $outPath ";
print STDERR "cmd=$cmd \n";
system($cmd);


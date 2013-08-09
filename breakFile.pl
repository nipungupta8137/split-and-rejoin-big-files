#!/usr/bin/perl
####################################################################################################
# Author : Nipun Gupta                                                                             #
# Date   : 09-August-2013                                                                          #
#                                                                                                  #
#  Revision History                                                                                #
#  ================                                                                                #
#  v1.0 09-AUgust-2013  Code ok Initial draft.                                                     #
#                                                                                                  #
#                                                                                                  #
# Description :                                                                                    #
#     Help you to break the split files back to original.                                           #
#                                                                                                  #
#                                                                                                  #
####################################################################################################
use strict;
use warnings;

my $file = shift;
my $counter = 0;
my $fileCounter = 1;
my $filename;
open FILE, "$file" or die $!;
open FILE1, ">Split000" or die $!;
binmode FILE;
binmode FILE1;
my ($buf, $data, $n);
while (($n = read FILE, $data, 1) != 0) {
	if($counter++ > 1024*1024){
		$counter = 0;
		close(FILE1);
		$fileCounter = sprintf("%3d", $fileCounter);
		$fileCounter =~ tr/ /0/;
		$filename = "Split" . $fileCounter++;
		print "\n Writing ... $filename";
		open FILE1, ">$filename" or die $!;
		binmode FILE1;
	}
	print FILE1 $data;
}
close(FILE);
close(FILE1);

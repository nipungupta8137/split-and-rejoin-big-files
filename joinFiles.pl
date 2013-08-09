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
#     Help you to join the split files back to original.                                           #
#                                                                                                  #
#                                                                                                  #
####################################################################################################
use strict;
use warnings;

my $file = shift;
open FILE, ">$file" or die $!;
binmode FILE;

my $dir = '.';
foreach my $fp (glob("$dir/Split*")) {
  print "\n Processing ", $fp;
  open my $fh, "<", $fp or die "Error while reading file !!!";
  binmode $fh;
  while (<$fh>) {
    print FILE $_;
  }
  close $fh or die "Error while closing !!!";
}
close(FILE);
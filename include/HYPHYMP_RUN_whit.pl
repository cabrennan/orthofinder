#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

MAIN: {
    my $ctl_file = $ARGV[0] or die "usage: $0 CTL_FILE\n";

    my @ctl_files = ();
    open IN, $ctl_file or die "cannot open $ctl_file:$!";
    while (my $line = <IN>) {
        chomp $line;
        next if ($line =~ m/^\s*$/);
        $line =~ s/\s+$//;
        push @ctl_files, $line;
    }

#    my %data = ();
    for (my $i = 0; $i < @ctl_files; $i++) {
        system("hyphy -i /home/santagata/BUSTED_14spp/$ctl_files[$i]\n");
        
#        $data= $ctl_files[$i];
    }
#    system Dumper \%data;
}

#!/usr/bin/perl

use strict;
use warnings; 
use Data::Dumper;

MAIN: {
    my $c_file = $ARGV[0] or die "usage: $0 CDS_FILE\n";

    my @c_files = ();
    open IN, $c_file or die "cannot open $c_file:$!";
    while (my $line = <IN>) {
        chomp $line;
        next if ($line =~ m/^\s*$/);
        $line =~ s/\s+$//;        
        push @c_files, $line;
    }

#    my %data = ();
    for (my $i = 0; $i < @c_files; $i++) {
        print "perl subset_fasta.pl -i $c_files[$i] All16spp_cds.fa_trim3.fa > $c_files[$i]_cds.fa\n";
        system "perl subset_fasta.pl -i $c_files[$i] All16spp_cds.fa_trim3.fa > $c_files[$i]_cds.fa\n";
#      
    }
#    print Dumper \%data;
}

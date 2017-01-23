#!/usr/bin/perl

use strict;
use DBI;

open my $ind, "../../data/StockNames/India/stocks.txt" or die "Cannot open indian stock list file: $!\n";
open my $us, "../../data/StockNames/US/stocks.txt" or die "Cannot open american stock list file: $!\n";

read_us();

#sub routines

sub read_us{
        print "Working on US stocks\n";
        while(<$us>){
                my $symbol = $_; chomp $symbol;
		next if($symbol !~ /GOOG$/);

		my @dirs = ('1_day_5_years','5_mins_1_year');	
		
		foreach my $dir(sort @dirs){
			my $filename = "../../data/StockPrices/US/$dir/$symbol.csv";
			my $new_filename = "../../data/StockPrices/US/$dir/$symbol.new.csv";
			print $filename."\n";

			if(-e $filename){
				`rm $filename`; # remove existing data so that you can create new data
			}

                	print "\t\tWorking on $symbol now\n";

			if($dir =~ /^1/){
                		`./US_getYTDStockData.py $symbol`;
			}else{
				`./US_getIntraDay1YR.py $symbol`;
			}
			sleep 1;

			open my $fh, $filename or next;
			open my $wh, ">$new_filename" or die "Cannot find $new_filename for writing: $!\n";

			while(<$fh>){
        			my $line = $_; chomp $line;
				$line =~ s/^.*?,//g if($dir =~ /^1/);
        			$line =~ s/\"//g if($dir =~ /^1/);
				$line = "TIMESTAMP".$line if($line =~ /CLOSE/);
        			print $wh "$line\n";
			}		
			close $fh;
			close $wh;

			`rm $filename`; # remove unformatted file
			`mv $new_filename $filename`; # create new formatted file
        	}
	}
}

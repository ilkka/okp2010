#!/usr/bin/perl -w
use strict;

my @input = <STDIN>;
my @inputchars = split //, lc(join('', @input));

# find most frequent letter

my %letters;
foreach my $letter (@inputchars) {
	if ($letter =~ /\w/) {
		if (exists $letters{$letter}) {
			$letters{$letter} += 1;
		} else {
			$letters{$letter} = 1;
		}
	}
}

my @letterkeys = sort { $letters{$b} <=> $letters{$a} } keys %letters;

my $letter_e = $letterkeys[0];

# calculate caesar key
my $caesarkey = ord($letter_e) - ord('e');
# wrap caesar keys over 13 to negative
#if ($caesarkey > 13) {
#$caesarkey = 13 - $caesarkey;
#}

print "I'm guessing that 'e' is '$letter_e' and the caesar key is $caesarkey.\n";

foreach my $char (@inputchars) {
	if ($char =~ /\w/) {
		# de-caesarize
		my $neword = ord($char) - $caesarkey;
		if ($neword < 97) {
			# wrap
			$neword += 26;
		}
		print chr($neword);
	} else {
		# just print the non-word stuff
		print $char;
	}
}


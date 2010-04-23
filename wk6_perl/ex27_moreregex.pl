#!/usr/bin/perl -w
use strict;

my @sentences = (
	"This is a sentence of more than five (5) words.",
	"this is not a legal sentence.",
	"Nor is this one",
	"2343 is not legal either.",
);

my @numbers = (
	0,
	5,
	12,
	20,
	555,
	-15,
);

my @lengthstrings = (
	"abba",
	"zarquon",
	"beebl",
	"zaphodbeeblebroxthe1",
);

my @fourdigits = (
	1234,
	4334,
	0000,
	5445,
);

my @romans = (
	"I",
	"IIII",
	"IV",
	"VI",
	"XIV",
	"MCM",
	"XXXIV",
	"MCMLX",
	"MCMLXXXIV",
	"VIV",
	"VV",
);

my @chars = (
	"Q",
	"w",
	"x",
	"(",
);

my $sentenceregex = '^[A-Z][^.]*\.';
my $numberregex = '^[-]?\d*[05]$';
my $fivestringregex = '^(?:.{5})+$';
my $fourdigitregex = '^(\d)(\d)\g{-1}\g{-2}$';
my $romanregex = '^M{0,3}(CM|CD|C{0,3}|DC{0,3})(XC|XL|L?X{0,3}|IX|XI{0,3})(I{0,3}|IV|VI{0,3})$';
my $notqregex = '(?=\w)[^Q]';

foreach my $sentence (@sentences) {
	print $sentence;
	if ($sentence =~ /$sentenceregex/) {
		print " IS";
	} else {
		print " IS NOT";
	}
	print " a proper sentence.\n";
}

print "\n";

foreach my $number (@numbers) {
	print $number;
	if ($number =~ /$numberregex/) {
		print " IS";
	} else {
		print " IS NOT";
	}
	print " a number divisible by five.\n";
}

print "\n";

foreach my $fivestring (@lengthstrings) {
	print $fivestring;
	if ($fivestring =~ /$fivestringregex/) {
		print " IS";
	} else {
		print " IS NOT";
	}
	print " a string with a length divisible by five.\n";
}

print "\n";

foreach my $fourdigit (@fourdigits) {
	print $fourdigit;
	if ($fourdigit =~ /$fourdigitregex/) {
		print " IS";
	} else {
		print " IS NOT";
	}
	print " a four digit palindrome.\n";
}

print "\n";

foreach my $roman (@romans) {
	print $roman;
	if ($roman =~ /$romanregex/) {
		print " IS";
	} else {
		print " IS NOT";
	}
	print " a roman numeral.\n";
}

print "\n";

foreach my $notqchar (@chars) {
	print $notqchar;
	if ($notqchar =~ /$notqregex/) {
		print " IS";
	} else {
		print " IS NOT";
	}
	print " a non-Q word char.\n";
}


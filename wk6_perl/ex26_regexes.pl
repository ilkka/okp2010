#!/usr/bin/perl

my %strings = (
	"a" => "the quick brown fox jumped over the lazy dog",
	"b" => "The Sea! The Sea!",
	"c" => '(.+)\s*\1',
	"d" => "9780471975632",
	"e" => 'C:\DOS\PATH\NAME',
);

my %regexes = (
	'i' => '[a-z]',
	'ii' => '(\W+)',
	'iii' => '\W*',
	'iv' => 'ˆ\w+$',
	'v' => '[ˆ\w+$]',
	'vi' => '\d',
	'vii' => '(.+)\s*\1',
	'viii' => '((.+)\s*\1)',
	'ix' => '(.+)\s*((\1))',
	'x' => '\DOS',
	'xi' => '\\DOS',
	'xii' => '\\\DOS',
);

my ($MATCH);
my @strkeys = sort { $a cmp $b } keys %strings;
foreach my $key (@strkeys) {
	print "$key => $strings{$key}:\n";
	my @rekeys = sort { $a cmp $b } keys %regexes;
	foreach my $rekey (@rekeys) {
		if ($strings{$key} =~ /$regexes{$rekey}/) {
			print "\t$rekey: \$MATCH $&, \$1 $1, \$2 $2\n";
		}
	}
	print "\n";
}


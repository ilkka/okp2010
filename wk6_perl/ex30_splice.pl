#!/usr/bin/perl -w
use strict;

print "Perl versions:\n";

my @array = (1, 2, 3, 4);
print "Array is @array\n";

push @array, (5);
print "After push, array is @array\n";

pop @array;
print "After pop, array is @array\n";

my $val = shift @array;
print "After shift, array is @array\n";

unshift @array, ($val);
print "After unshift, array is @array\n";

# -------------

print "My versions:\n";

print "Array is @array\n";

splice @array, scalar(@array), 1, (5);
print "After splice-push, array is @array\n";

splice @array, $#array, 1;
print "After splice-pop, array is @array\n";

my $val = splice @array, 0, 1;
print "After splice-shift, array is @array\n";

splice @array, 0, 0, ($val);
print "After splice-unshift, array is @array\n";


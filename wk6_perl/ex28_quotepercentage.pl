#!/usr/bin/perl -w
use strict;

my $msg1 = <<'EOS';
Having been recovered now for six months, it comes as something of a 
relief to find paid employment. So now I find myself wondering ... are 
there any monks out there in Nhpxynaq, AM? Yup, I'm moving across the 
ditch, in the *opposite* direction to the majority. Oh my. Oh my. Ooh 
crumbs. Ooh 'elp...
EOS

my $msg2 = <<'EOS';
"Lawns 'R' Us" <nob...@nowhere.example.com> wrote in message 
news:slrnhs5pqv.11p.nobody@invalid.hostname.does.not.exist.666.au... 
> Having been recovered now for six months, it comes as something of a 
> relief to find paid employment. So now I find myself wondering ... are 
> there any monks out there in Nhpxynaq, AM? Yup, I'm moving across the 
> ditch, in the *opposite* direction to the majority. Oh my. Oh my. Ooh 
> crumbs. Ooh 'elp... 

Well, congratulations. I keep hearing it's a lovely place to spend one's 
vacation. 
It's probably still a better place to work than being unemployed in any 
other place. 
Tebrgwrf, 
Maarten Wiltink
EOS

my $msg3 = <<'EOS';
On 2010-04-12, Maarten Wiltink <maar...@kittensandcats.net> wrote: 
> "Lawns 'R' Us" <nob...@nowhere.example.com> wrote in message 
> news:slrnhs5pqv.11p.nobody@invalid.hostname.does.not.exist.666.au... 
>> Having been recovered now for six months, it comes as something of a 
>> relief to find paid employment. So now I find myself wondering ... are 
>> there any monks out there in Nhpxynaq, AM? Yup, I'm moving across the 
>> ditch, in the *opposite* direction to the majority. Oh my. Oh my. Ooh 
>> crumbs. Ooh 'elp... 
> Well, congratulations. I keep hearing it's a lovely place to spend one's 
> vacation. 


As do I - but that generally applies to the *south* island. 
> It's probably still a better place to work than being unemployed in any 
> other place. 

Which is why I've accepted the offer, in spite of them not paying 
relocation expenses (grumble, mutter, bitch, moan.) Oh well, we'll see 
how I fare, I guess - first I have to get over this episode of 
freaking out.
EOS

my @messages = ($msg1, $msg2, $msg3);

foreach my $msg (@messages) {
	print "Message:\n$msg\n";
	my $linectr = 0;
	my $quotelines = 0;
	foreach my $line (split("\n", $msg)) {
		$linectr += 1;
		if ($line =~ /^[>]/) {
			$quotelines += 1;
		}
	}
	printf("%.2f%% of lines are quotes (%d out of %d)\n",
		($quotelines/$linectr)*100,
		$quotelines,
		$linectr);
	print "\n----\n\n";
}


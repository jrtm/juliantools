#!/usr/bin/perl

use strict;
use warnings;

use Term::ANSIColor;

use constant MAX_BRANCHES => 30;

sub getHEAD() {
	my $HEAD = `git symbolic-ref --short -q HEAD`;
	chomp $HEAD;
	$HEAD;
}

sub getBranchHistory() {
	my @branches;
	my %seen;
	my $HEAD = getHEAD();
	foreach my $history (`git reflog --pretty="%D"`) {
		chomp $history;
		$history =~ s/tag: /tag\//g; # Make sure we can treat tags as single tokens
		while ($history =~ m/([a-zA-Z0-9_.æøåÆØÅ\/-]+)/g) {
			my $part = $1;
			next if $part =~ m/^(?:\d+|tag\/.+|origin\/.+|-|HEAD|master|main)$/
				or $seen{$part}
				or $part eq $HEAD;
			$seen{$part} = 1;
			push @branches, $part;
		}
		last if scalar(@branches) >= MAX_BRANCHES;
	}

	return @branches;
}

my $param = $ARGV[0];

my @bh = getBranchHistory();

if ($param) {
	my $branchIndex = int($param) or die "Invalid branch index";

	my $branch = $bh[$branchIndex - 1];
	exec "git checkout $branch";
} else {
	while (my ($index, $branch) = each @bh) {
		printf colored('%2d', 'green bold') . " %s\n", ($index + 1), $branch;
	}
	
}

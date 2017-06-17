#created by Carlos Williamberg 03/06/2017
use strict;
use warnings;

my $file = 'iris.data';
my %classes;

open my $info, $file or die  "Could not open the file $file";

while (<$info>) {
	my ($attributes, $class_name) = split(/,I/);
	$classes {$attributes} = "I".$class_name;
}
close $info;

while(1){
	print "Enter the attributes separated by , : ";
	chomp (my $attributes = <STDIN>);
	classify_nn($attributes);
}
 
sub classify_nn{
	my ($min_distance, $min_distance_key) = 100, 0;
	for my $key (keys %classes){
		my $current_distance = distance($key, $_[0]);
		if ($current_distance < $min_distance){
			$min_distance = $current_distance;
			$min_distance_key = $key;			
		}
	}
	print "$classes{$min_distance_key}\n";
}

sub distance{
	my $result = 0;
	my @attributes0 = split(/,/, shift);
	my @attributes1 = split(/,/, shift);
	for my $i (0..$#attributes0){
		$result += abs $attributes0[$i] - $attributes1[$i];
	}
	return $result;
}

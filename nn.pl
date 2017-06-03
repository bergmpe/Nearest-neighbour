use strict;
use warnings;

my $file = 'iris.data';
open my $info, $file or die  "Could not open the file $file";

while (my $line = <$info>) {
	my @numero =  split(/,/, $line, 5);
	for(my $k = 0; $k < 4; $k++){
		#print("$_\n");
		print $numero[$k], "\n";
	}
}

close $info

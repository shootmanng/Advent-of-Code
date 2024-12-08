use v5.4;
use Data::Dumper;
use Cwd;
use feature qw<say>;

open my $input, '<', getcwd().'/Day 4/input.txt' or die "Could not open the file: $!";

my $result = 0;
my $result2 = 0;
my $mx = [];

while (my $line = <$input>) {

    chomp($line);
    
    my @array = split //, $line;

    push @$mx, \@array;    
}

close $input;

foreach my $i (0..scalar(@$mx)-1) {

    foreach my $j (0..scalar(@{$mx->[$i]})-1) {
        
        if ($$mx[$i][$j] eq 'X') {
            
            my $bool1 = ($i+3) <= (scalar(@$mx)-1);
            my $bool2 = ($j+3) <= (scalar(@{$mx->[$i]})-1);
            my $bool3 = ($i-3) >= 0;
            my $bool4 = ($j-3) >= 0;

            if ((($$mx[$i][$j]).($$mx[$i][$j+1]).($$mx[$i][$j+2]).($$mx[$i][$j+3]) eq "XMAS") && $bool2) {

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i-1][$j+1]).($$mx[$i-2][$j+2]).($$mx[$i-3][$j+3]) eq "XMAS") && ($bool2 * $bool3)) {

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i-1][$j]).($$mx[$i-2][$j]).($$mx[$i-3][$j]) eq "XMAS") && $bool3) {

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i-1][$j-1]).($$mx[$i-2][$j-2]).($$mx[$i-3][$j-3]) eq "XMAS") && ($bool3 * $bool4)) {

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i][$j-1]).($$mx[$i][$j-2]).($$mx[$i][$j-3]) eq "XMAS") && $bool4) {

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i+1][$j-1]).($$mx[$i+2][$j-2]).($$mx[$i+3][$j-3]) eq "XMAS") && ($bool1 * $bool4)){

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i+1][$j]).($$mx[$i+2][$j]).($$mx[$i+3][$j]) eq "XMAS") && $bool1){

                $result++;
            }

            if ((($$mx[$i][$j]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j+2]).($$mx[$i+3][$j+3]) eq "XMAS") && ($bool1 * $bool2)){

                $result++;
            }
        }
    }
}

say $result;

foreach my $i (0..scalar(@$mx)-1) {

    foreach my $j (0..scalar(@{$mx->[$i]})-1) {
        
        my $bool1 = ($j+2) <= (scalar(@{$mx->[$i]})-1);
        my $bool2 = ($i+2) <= (scalar(@$mx)-1);

        if (($$mx[$i][$j] eq 'M') && ($bool1 * $bool2)) {
            
            if ((($$mx[$i][$j]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j+2]) eq "MAS") && (($$mx[$i][$j+2]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j]) eq "MAS")) {
                
                $result2++;
            }

            if ((($$mx[$i][$j]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j+2]) eq "MAS") && (($$mx[$i][$j+2]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j]) eq "SAM")) {
                
                $result2++;
            }
        }

        if (($$mx[$i][$j] eq 'S') && ($bool1 * $bool2)) {

            if ((($$mx[$i][$j]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j+2]) eq "SAM") && (($$mx[$i][$j+2]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j]) eq "MAS")) {
                
                $result2++;
            }

            if ((($$mx[$i][$j]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j+2]) eq "SAM") && (($$mx[$i][$j+2]).($$mx[$i+1][$j+1]).($$mx[$i+2][$j]) eq "SAM")) {
                
                $result2++;
            }
        }
    }
}

say $result2;
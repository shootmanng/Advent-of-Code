use v5.34.0;
use Data::Dumper;
use Cwd;
#use feature qw<say>;
sub _checker {

    my ($i, $j, $line) = @_;
    
    my $index1 = index($line, $i);
    my $index2 = index($line, $j);

    if (($index1 != -1) && ($index2 != -1)) {
        
        return $index1 < $index2;
    }

    return 1;
}

sub _rearrange {


}

sub _sum {
    my ($results) = @_;
    my $result = 0;

    foreach (@$results) {
        $result += $_;
    }
    return $result;
}

open my $input, '<', getcwd().'/input.txt' or die "Could not open the file: $!";

my @result_list = ();
my @result_list2 = ();
my @rules = ();

while (my $line = <$input>) {

    chomp($line);
    $line =~ s/\r//g;

    if (index($line,'|') != -1) {
        
        my @temp = split /\|/, $line;

        push @rules, $temp[0];
        push @rules, $temp[1];
        
    } elsif (index($line,',') != -1) {

        my @pages = split /,/,$line;
        my $i = 0;
        my $bool = 1;
        
        while (($i <= scalar(@rules) - 2) && ($bool != 0)) {
        
            if (!&_checker($rules[$i], $rules[$i+1], $line)) {$bool = 0}
            $i += 2;
        }

        if ($bool != 0) {push @result_list, $pages[(scalar(@pages) - 1)/2]}

        while ($bool == 0) {

            $line = &_rearrange($line, \@rules);
            # need to reimplement rules checking somehow, loop above ended
        }
    } 
    
}

close $input;

say &_sum(\@result_list);
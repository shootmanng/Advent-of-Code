use v5.34.0;
use Data::Dumper;
use Cwd;

sub _distance {
    
    my ($l1,$l2) = @_;

    my @left = @$l1; 
    my @right = @$l2; 
    my $result = 0;

    @left = sort { $a <=> $b } @left;
    @right = sort { $a <=> $b } @right;

    foreach (0..scalar(@left) - 1) {

        $result += abs($left[$_] - $right[$_]);
    }

    return $result;
}

sub _similarity {

    my ($l1,$l2) = @_;
    my @left = @$l1; 
    my @right = @$l2; 
    my $result = 0;

    foreach (@left) {

        my $i = $_;
        $result += $_ * scalar(grep {$_ == $i} @right);
    }

    return $result;
}

open my $input, '<', getcwd().'/Day 1/input.txt' or die "Could not open the file: $!";

my $result = 0;
my @left = ();
my @right = ();

while (my $line = <$input>) {

    chomp($line);

    my @list = split '   ', $line;
    
    push @left, $list[0];
    push @right, $list[1];
    
}

say &_distance(\@left,\@right);
say &_similarity(\@left,\@right);
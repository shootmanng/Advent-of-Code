use v5.4;
use Data::Dumper;
use Cwd;
use feature qw<say>;

sub _check {

    my ($array1, $array2) = @_;

    foreach (0..scalar(@$array1)-1) {

        if (@$array1[$_] != @$array2[$_]) {
            return 0;
        }
    }

    return 1;
}

sub _safe {

    my ($line) = @_;

    my @increasing = sort {$a <=> $b} @$line;
    my @decreasing = sort {$b <=> $a} @$line;

    if (&_check($line, \@increasing) || &_check($line, \@decreasing)) {

        foreach (1..scalar(@$line)-1) {

            if (abs(@$line[$_- 1]-@$line[$_]) < 1 || abs(@$line[$_- 1]-@$line[$_]) > 3) {

                return 0;
            }
        }

        return 1;
    }
}

sub _damper {

    my ($line) = @_;
    my $result = 0;

    foreach (0..scalar(@$line) - 1) {

        my @array = @$line;
        splice(@array,$_,1);
        $result += &_safe(\@array);
    }

    return 1 if $result > 0;
    return 0;
}

open my $input, '<', getcwd().'/Day 2/input.txt' or die "Could not open the file: $!";

my $result = 0;
my $result2 = 0;

while (my $line = <$input>) {

    chomp($line);

    my @list = split ' ', $line;

    $result += &_safe(\@list);   
    $result2 += &_damper(\@list);   
}

close $input;

say $result;
say $result2;
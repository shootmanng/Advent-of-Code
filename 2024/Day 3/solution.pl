use v5.34.0;
use Data::Dumper;
use Cwd;

sub _mul {

    my ($line) = @_;
    my $result = 0;

    while ($line =~ /mul\((\d+),(\d+)\)/g) {
        
        $result += $1 * $2;
    }

    return $result;
}

open my $input, '<', getcwd().'/Day 3/input.txt' or die "Could not open the file: $!";

my $result = 0;
my $file = '';
my $result2 = 0;

while (my $line = <$input>) {

    chomp($line);
    
    $result += &_mul($line);
    $file .= $line;
}

say $result;

$file =~ s/don't\(\)(.*?)do\(\)//g;
say &_mul($file);
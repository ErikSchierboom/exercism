package Luhn;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    $number =~ s/\s//g;
    return 0 unless $number =~ /^\d{2,}$/;

    my $sum = 0;
    my $i = 0;

    foreach my $digit (reverse split '', $number) {
        $sum += $i++ % 2 ? $digit * 2 - ($digit > 4 ? 9 : 0) : $digit;
    }

    return $sum % 10 == 0;
}

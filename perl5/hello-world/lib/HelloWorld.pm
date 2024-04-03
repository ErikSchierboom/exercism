# Declare package 'HelloWorld'
package HelloWorld;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<hello>;

sub hello () {
    return 'Hello, World!';
}

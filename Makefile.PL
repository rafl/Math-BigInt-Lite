
# We need at least Perl 5.6.2
require 5.6.2;
use strict;

# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# The name of your distribution
name		'Math-BigInt-Lite';

# Get most of the details from the primary module
all_from	'lib/Math/BigInt/Lite.pm';

requires	'perl'		=> 5.006002;
requires	'Math::BigInt'	=> 1.86;
requires	'Math::BigRat'	=> 0.19;

build_requires	'Test::More'	=> 0.52;

license		'perl';

author		'Tels <nospam-abuse@bloodgate.com>';

# Do not index these
no_index	directory	=> 'examples';

sign;

# Generate the Makefile
WriteAll;


#!/usr/bin/perl -w

use strict;
use Test;

BEGIN 
  {
  $| = 1;
  chdir 't' if -d 't';
  unshift @INC, '../lib'; # for running manually
  plan tests => 2;
  }

use Math::BigFloat with => 'Math::BigInt::Lite';

my $x = Math::BigFloat->new(-123);

ok ($x,-123);

$x->babs();

ok ($x,123);

# done

1;


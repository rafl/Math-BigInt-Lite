#!/usr/bin/perl -w

use strict;
use Test;

BEGIN 
  {
  $| = 1;
  chdir 't' if -d 't';
  unshift @INC, '../lib'; # for running manually
  plan tests => 38;
  }

# testing of Math::BigRat

use Math::BigInt::Lite;

my $c = 'Math::BigInt::Lite';
my $mbi = 'Math::BigInt';

my ($x,$y,$z);

$x = $c->new(1234); 	ok (ref($x),$c);	ok ($x,1234);
$x = $c->new('1234'); 	ok (ref($x),$c);	ok ($x,1234);
$x = $c->new('1e12'); 	ok (ref($x),$mbi);
$x = $c->new('1.'); 	ok (ref($x),$c);	ok ($x,1);
$x = $c->new('1.0'); 	ok (ref($x),$c);	ok ($x,1);
$x = $c->new('1.00'); 	ok (ref($x),$c);	ok ($x,1);
$x = $c->new('1.02'); 	ok (ref($x),$mbi);	ok ($x,'NaN');

$x = $c->new('1'); 	ok (ref($x),$c); $y = $x->copy(); ok (ref($y),$c);
ok ($x,$y);

$x = $c->new('6'); 	$y = $c->new('2');
ok (ref($x),$c); ok (ref($y),$c);

$z = $x; $z += $y; 	ok (ref($z),$c);	ok ($z,8);
$z = $x + $y;	 	ok (ref($z),$c);	ok ($z,8);
$z = $x - $y;	 	ok (ref($z),$c);	ok ($z,4);
$z = $y - $x;	 	ok (ref($z),$c);	ok ($z,-4);
$z = $x * $y;	 	ok (ref($z),$c);	ok ($z,12);
$z = $x / $y;	 	ok (ref($z),$c);	ok ($z,3);

$z = $y / $x;	 	ok (ref($z),$mbi);	ok ($z,0);

$z = $x->as_number(); 	ok (ref($z),$c);	ok ($z,6);

###############################################################################
# non-objects

$x = Math::BigInt::Lite::badd('1','2'); ok ($x,3);
$x = Math::BigInt::Lite::badd('1',2); ok ($x,3);
$x = Math::BigInt::Lite::badd(1,'2'); ok ($x,3);
$x = Math::BigInt::Lite::badd(1,2); ok ($x,3);

# done

1;


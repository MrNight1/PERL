#!perl

#Anota Olmos Oscar David
#Practica 1 - Numeros Pares

use warnings;
use strict;

my @uno = (1..10);
my @pares = ();

foreach(@uno){
  if($_%2 == 0){
    print $_,"\n";
    push(@pares,$_);
  }
}

print @uno,"\n";
print @pares,"\n";

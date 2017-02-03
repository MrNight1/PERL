#!perl

#Anota Olmos Oscar David
#Tarea 1 - Numeros Pares

use warnings;
use strict;

my $escalar;

print "Un pragma son las directivas que afectan al compilador a  que se le dan al compilador. Se usan en el código fuente con la palabra reservada *use*.";

print "Tablas de multiplicar :P\n";
for(1..10){
  $escalar = $_; 
  for(1..10){
    print $escalar," x ",$_," = ",$escalar*$_,"\n";
  }
}

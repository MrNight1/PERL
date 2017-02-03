#!perl
use warnings;
use strict;
my @a;
#@a[5] = 4; #Esto no se hace
$a[0] = 5;  #esto si
@a[1] = 4;
@a[5] = 4;#imprimir todo el contenido del array
print $#a; #Imprime el ultimo indice del arreglo
$a[10]=7;

@a=('a'..'z');

foreach (@a) { 
  print $_; #Variable favorita en perl
};

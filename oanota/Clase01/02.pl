#!perl
use warnings;
use strict;

#my @a=(1..11);
my @a=('a'..'z');
my @z=();
my $x=$a[5];
my $y=@a; #Cambio de contexto de arreglo a escalar
#print @a; #Imprime todos los elementos del arreglo
#print 0+@a; #A cero sumale una lista, escalar + arreglo, entonces transforma el arreglo a escalar obteniendo el numero de elementos
#print $x,$y;
#print "\n";

($x,@z) = ($x,@a);
#print $x,"\n";
#print @a[5..8],"\n"; #imprime el rango de elementos de un arreglo
#print @a[1,2,5..8],"\n"; #imprime los elementos 1,2 y el rango de 5 a 8 elementos de un arreglo
#print @z,"\n";
$x=@a; 
#print $x,"\n";
$x=\@a; #X es un escalar y a es un arreglo, por lo tanto x obtiene la referencia al arreglo a. el "\" extrae la ubicacion de memoria del arreglo
print $x,"\n"; #imprime la referencia al arreglo a
print @a,"\n";

print $x -> [5],"\n"; # -> es como si fuera @a

for(@$x){ # En X existe una referencia, pero tratala como arreglo
  print $_;
}
print "\n";

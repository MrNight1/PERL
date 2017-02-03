#!perl
@uno = ('a'..'z');
@dos = (1..9);
@tres = (@uno, @dos); #Concatena la lista @dos al final de la lista @uno

print $tres[1];

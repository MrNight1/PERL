#!perl

# Anota Olmos Oscar David
# Tarea - Busqueda de patrones
use warnings;
use 5.014;
use strict;

=pod

=head1 Tarea

=head2 Explicacion

El programa cuenta los patrones de ocurrencias de IPs, URLs, dominios y correos electronicos
de un archivo de entrada pasado como argumento.
La salida se guarda en un archivo llamado salida.txt

=cut

my @tmp;

my %hIPs = ();
my %hCorreos=();
my %hURLS=();
my %hDominios=();

scalar @ARGV == 1 ? my $entrada = $ARGV[0]:die "No hay archivo de entrada o hay mas de 1 argumento\n";

open(FCG, "<",$entrada) or die "Error al abrir el archivo: ",$entrada,"\n";
while(<FCG>){
	chomp;
	if(/([_a-z0-9-])+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})/){
		if (defined $hCorreos{$&}){
		  $hCorreos{$&}=$hCorreos{$&}+1;
		}
		else{
		  $hCorreos{$&}=1;
		}
	}
	elsif(/(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])/){
	  #say $&; #Imprime la coincidencia
		if (defined $hIPs{$&}){
		  $hIPs{$&}=$hIPs{$&}+1;
		}
		else{
		  $hIPs{$&}=1;
		}
	}
	elsif(/(https?:\/\/)([\w\.-]+)\.([a-z\.]{2,6})([\/\w\?=.-]*)*/){
	  #say $&; #Imprime la coincidencia
	  if (defined $hURLS{$&}){
		  $hURLS{$&}=$hURLS{$&}+1;
		}
		else{
		  $hURLS{$&}=1;
		}	  
	}
	elsif(/([\w\.-]+)\.([a-z\.]{2,6})([\/\w\?=.-]*)*/){
	  #say $&; #Imprime la coincidencia
	  if (defined $hDominios{$&}){
		  $hDominios{$&}=$hDominios{$&}+1;
		}
		else{
		  $hDominios{$&}=1;
		}
	}
}
close (FCG);

my $file="salida.txt";
open(FH, '>', $file) or die "EROR '$file' $!";

my $acum=0;
print FH "Los correos encontrados son:\n";
print FH "TOTAL\t| CORREO\n";
for my $key (sort keys %hCorreos){
#		say $key,"-->",$hCorreos{$key};
    print FH " ",$hCorreos{$key},"\t|",$key,"\n";
		$acum+=$hCorreos{$key};
}
print "Encontre ",$acum," emails. :P\n";
print FH "Encontre ",$acum," emails. :P\n";
print FH "---------------------------------------------------------------------------------------\n\n";

print FH "Las direcciones IP encontradas son:\n";
print FH "TOTAL\t| IP\n";
$acum=0;
for my $key (sort keys %hIPs){
		#say $key,"-->",$hIPs{$key};
		print FH " ",$hIPs{$key},"\t|",$key,"\n";
		$acum+=$hIPs{$key};
}
print "Encontre ",$acum," ips. XD\n";
print FH "Encontre ",$acum," ips. XD\n";
print FH "---------------------------------------------------------------------------------------\n\n";

print FH "Las URL encontradas son:\n";
print FH "TOTAL\t| URL\n";
$acum=0;
for my $key (sort keys %hURLS){
		#say $key,"-->",$hIPs{$key};
		print FH " ",$hURLS{$key},"\t|",$key,"\n";
		$acum+=$hURLS{$key};
}
print "Encontre ",$acum," URLs. B|\n";
print FH "Encontre ",$acum," URLs. B|\n";
print FH "---------------------------------------------------------------------------------------\n\n";

print FH "Los dominios encontrados son:\n";
print FH "TOTAL\t| Dominio\n";
$acum=0;
for my $key (sort keys %hDominios){
		#say $key,"-->",$hIPs{$key};
		print FH " ",$hDominios{$key},"\t|",$key,"\n";
		$acum+=$hDominios{$key};
}
print "Encontre ",$acum," Dominios. :D\n";
print FH "Encontre ",$acum," Dominios. :D\n";

close FH;


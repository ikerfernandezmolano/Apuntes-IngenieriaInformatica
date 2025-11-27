#include <stdio.h>
int main() {
  FILE * entrada;
  char nombre[100];
  int contador=0;
  char c;
  printf("¿De qué fichero deseas conocer el tamaño?");
  __fpurge(stdin);
  gets(nombre); //scanf("%s",nombre)
  //abrir fichero
  entrada=fopen(nombre,"r");
  //recorrer el fichero
  c=fgetc(entrada);
  while(c!=EOF){
    contador=contador+1;
    c=fgetc(entrada);
  }
  
  //cerrar fichero
  fclose(entrada);
  printf("El tamaño del fichero es de %d",contador);
  return 0;
}

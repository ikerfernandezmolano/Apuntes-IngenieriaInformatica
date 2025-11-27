#include <stdio.h>
int main() {
  FILE * salida;
  char nombre[100];
  char c;
  printf("Introduce el nombre del fichero a crear:");
  __fpurge(stdin);
  gets(nombre); 
  //abrir fichero
  salida=fopen(nombre,"w");
  //recorrer el fichero
  for(c='a';c<='z';c++) {
    fputc(c,salida);
  }
  c='\n';
  fputc(c,salida);
  for(c='A';c<='Z';c++) {
    fputc(c,salida);
  }
  //cerrar fichero
  fclose(salida);
  return 0;
}

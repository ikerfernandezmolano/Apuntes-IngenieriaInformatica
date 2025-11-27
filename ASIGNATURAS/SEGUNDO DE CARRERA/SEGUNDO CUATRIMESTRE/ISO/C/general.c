int ffichnumcarac(char c, FILE * fp){
	int contador=0;
	char car;
	//recorrer el fichero
	car=fgetc(fp);
	while(car!=EOF){
		if(car==c){
			contador=contador+1;
		}
	car=fgetc(fp);
	}
	return contador;
}

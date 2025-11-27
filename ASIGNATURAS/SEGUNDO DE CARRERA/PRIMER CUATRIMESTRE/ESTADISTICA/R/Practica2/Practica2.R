##########Pr?ctica n?1: Estad?stica Descriptiva #########

##########Ejercicio n?1: importaci?n de datos ##########
##########Apartado a
##lectura de hoja Excel: NO SE LEEN FICHEROS EXCEL

##########Apartado b

##########Apartado c: lectura fichero txt
datos<-read.table("datosP2.txt", header = TRUE, sep = "\t", quote = "\"'",dec = ".")
datos2<-read.delim("Pr?ctica de ordenador n?2 (R).txt", header = TRUE, sep = "\t", quote = "\"'",dec = ".")
read.table(file=file.choose(), header = TRUE, sep = "\t", quote = "\"'",dec = ".")
##########Apartado d
str(datos)
str(datos2)
View(datos)
##########Ejercicio n?2: datos categ?ricos ##########
##########Apartado a: tabla de frecuencias
datos$Grado
fabs=table(datos$Grado);fabs
frel=prop.table(fabs);frel
tabla.f=data.frame(fabs,frel);tabla.f
frel=round(as.vector(frel),4);frel
colnames(tabla.f)=c("Grado","ni","fi");tabla.f
##########Apartado b: tabla de frecuencias acumuladas
v=1:5;v
sum(v)
v;cumsum(v)
tabla.f$Ni=cumsum(fabs);tabla.f
tabla.f$Fi=cumsum(frel);tabla.f
View(tabla.f)
##########Apartado c: diagramas de barras
barplot(tabla.f$ni, xlab = "Grado", ylab = "Frecuencia absoluta",
        col = "gold", border = "brown",main = "Diagrama de barras",
        names.arg = c("EAut","Elec","Mec"))
text(c(0.7,1.90,3.1),tabla.f$ni/2,tabla.f$ni,col = "brown")
 ##########Apartado e: diagrama de sectores


##########Apartado f: pol?gono de frecuencias


##########Ejercicio n?3: datos num?ricos ##########
##########Apartado a: intervalos de clase y amplitud
#N?mero de intervalos de clase: k
datos$Altura
n=length(datos$Altura);n
k=round(sqrt(n));k
k=nclass.Sturges(datos$Altura);k
k=10
#Amplitud de los intervalos: A
L=min(datos$Altura);L
H=max(datos$Altura);H
A=(H-L)/k;A
range(datos$Altura)
diff(range(datos$Altura))
diff(range(datos$Altura))/k
##########Apartado b: tabla de frecuencias con intervalos de clase
#L?mites de los intervalos
lim=seq(L,H,A);lim
#Marcas de clase
m.clase=((lim[1:k]+lim[1:k+1])/2);m.clase
#Clasificaci?n de datos por intervalo
sort(datos$Altura)
int.clase.alt=cut(sort(datos$Altura),breaks=lim,include.lowest = TRUE,right=FALSE);int.clas.alt
#Frecuencias absolutas y relativas por intervalo
col1=table(int.clase.alt);col1
col2=prop.table(col1);col2
#Como vector para representar la tabla de frecuencias
ni=as.vector(col1);ni
fi=round(as.vector(col2),4);fi
#Frecuencias absolutas y relativas acumuladas por intervalo
Ni=cumsum(ni);Ni
Fi=cumsum(fi);Fi
#Como vector para representar la tabla de frecuencias
Intervalos=levels(int.clase.alt)
#Tabla de frecuencias
tabla=data.frame(Intervalos,m.clase,ni,fi,Ni,Fi);tabla
View(tabla)
colnames(tabla)=c("Intervalos","Marca de Clase"," ni"," fi  ","Ni"," Fi  ");tabla
##########Apartado c: diagrama de tallo y hojas

##########Apartado d: histograma de frecuencias absolutas
#Informaci?n adicional
h=hist(datos$Altura,breaks=lim,right=FALSE,plot=FALSE)
str(h)
h$breaks;h$mids;h$counts;h$density

#Histograma
hist(datos$Altura,breaks=lim,xaxt="n",right=FALSE,freq=TRUE,
     col="light blue",main="Histograma frecuencias absolutas",
     xlab="Intervalos de clase",ylab="Frecuencias absolutas")
#L?mites de los intervalos en el eje OX
axis(1,lim)
#Texto sobre barras
text(m.clase,ni/2,ni)

##########Apartado e: histograma de frecuencias relativas
#Histograma


##########Apartado f: pol?gonos de frecuencias

#Frecuencia absoluta
#Coordenadas x

#Coordenadas y

#Frecuencia relativa
#Coordenadas x

#Coordenadas y




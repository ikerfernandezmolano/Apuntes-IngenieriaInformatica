##########Práctica nº3: Estadística Descriptiva II #########
datos=read.table(file=file.choose(), header = TRUE, sep = "\t", quote = "\"'", dec = ".")
datos
str(datos)
View(datos)
alt=datos$Altura;alt
peso=datos$Peso;peso
edad=datos$Edad;edad
sexo=datos$Sexo;sexo
pobl=datos$Población;pobl
grado=datos$Grado;grado
##########Ejercicio nº4: estadísticos de posición central ##########
v=c(0:7,NA);v
v[-which(is.na(v))] #Para eliminar elemento en la pos donde haya NA
#NA
which(is.na(alt))
mean(alt)
#Media
mean(alt,na.rm=TRUE)
apply(datos[1:3],2,FUN=mean,na.rm=TRUE)
mean(alt,na.rm = TRUE,trim=0.05)
#Mediana
apply(datos[1:3],2,FUN=median,na.rm=TRUE)
#Moda
which.max(table(alt))
moda.alt=as.numeric(names(which.max(table(alt))));moda.alt
##########Ejercicio nº5: estadísticos de dispersión ##########
#RECORRIDO
rec.alt=max(alt,na.rm = TRUE)-min(alt,na.rm=TRUE);rec.alt
diff(range(alt,na.rm=TRUE))
#VARIANZA
cs2.alt=var(alt,na.rm=TRUE);cs2.alt
n=length(alt);n
s2.alt=(n-1)*cs2.alt/n;s2.alt
#DESVIACIÓN TÍPICA
s.alt=sqrt(s2.alt);s.alt
cs.alt=sd(alt,na.rm = TRUE);cs.alt
sqrt((n-1)*cs2.alt/n)
#COEFICIENTE VARIACIÓN PEARSON
cv=function(x){
  n=length(x)
  csd.x=sd(x,na.rm = TRUE)
  sd.x=sqrt((n-1)/n)*csd.x
  m.x=mean(x,na.rm=TRUE)
  sd.x/abs(m.x)*100
}
cv(alt)
cv(peso)
cv(edad)
##########Ejercicio nº6 y 7: estadísticos de posición NO central ##########
quantile(alt,0.15,na.rm = TRUE,type=2) #percentil 15
quantile(alt,0.5,na.rm = TRUE,type=2) #percentil 50
quantile(alt,seq(0,1,0.25),na.rm = TRUE,type=2) #todos los cuartiles
IQR(alt,na.rm=TRUE,type=2)#RANGO INTERCUARTILICO
#Números resumen
fivenum(alt,na.rm = TRUE)
summary(alt,na.rm=TRUE,type=2)
#ejercicio 7 apartado b
by(alt,datos$Grado,FUN=summary,na.rm=TRUE,type=2,)
##########Ejercicio nº8
bp=boxplot(alt, horizontal = TRUE,col="wheat",border="maroon4",main="Boxplot",xlab="Altura (m)",notch=TRUE)
bp$stats
quantile(alt,0.75,na.rm=TRUE,type=2)+1.5*IQR(alt,na.rm=TRUE,type=2)
bp$n
bp$out
##########Ejercicio nº9
skewness(alt,na.rm=TRUE) #coeficiente de fisher
kurtosis(alt,na.rm=TRUE)-3

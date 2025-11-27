#EJERCICIO 1
  #a
  phyper(24,80,80,50)
  
  #b
  1-phyper(30,80,80,50)
  phyper(30,80,80,50, lower.tail = FALSE)
  
  #c
  qpois(0.75,2)
  
  #d
  1-ppois(3,2)
  ppois(3,2, lower.tail = FALSE)
  
  #e
  qbinom(0.50,60,0.50)
  
  #f
  espX=60*0.50
  pbinom(espX-1,60,0.50)
  
  #g
  cuar=seq(0.25,0.75,0.25);cuar
  Cuartiles1=qbinom(cuar,60,0.50);Cuartiles1
  Cuartiles2=qhyper(cuar,80,80,50);Cuartiles2
  Cuartiles3=qpois(cuar,2);Cuartiles3
  
  #h
  tam=250
  m250=rbinom(tam,60,0.50);m250  
  fabs=table(m250);fabs
  plot(fabs,col="blue",xlab="Valores de x",ylab="Frencuencia absoluta",main=c("B(60,0.5);n=250"))
  
#EJERCICIO 2
  #a
  pnorm(1.14)
  #b
  1-pnorm(-0.98)
  pnorm(-0.98,lower.tail = FALSE)  
  #c
  qnorm(0.8729)
  #d
  1-pnorm(4.82,3.8,1.5)
  pnorm(4.83,3.8,1.5,lower.tail = FALSE)  
  #e
  qnorm(0.754,3.8,1.5)
  #f
  pexp(2,0.5)
  #g
  qexp(0.65,0.5)
  #h
  tam=50
  m50=rexp(tam,0.5);m50
  plot(m50,col="blue",main=c("exp(0.5);n=50"))
  #i
  tam=250
  z=rnorm(tam);z
  dens=dnorm(z);dens
  plot(z,dens,col="blue",type="p",main=c("N(0,1);n=250"))
  
#EJERCICIO 4
  #a
  lamnda=15
  x=0:35;x
  fmpX=dpois(x,lamnda);fmpX
  tabla.fmp=data.frame(x,fmpX);tabla.fmp
  
  #b
  fmpX2=ppois(x,lamnda);fmpX2
  tabla.fmp2=data.frame(x,fmpX2);tabla.fmp2
  for(i in 0:35){
    fmp=dpois(i,lamnda)
    fdp=ppois(i,lamnda)
    cat(i,"\t",fmp,"\t",fdp,"\n")
  }
  
  #e
  ppois(14,lamnda)
  
  #f
  ppois(lamnda,lamnda,lower.tail = FALSE)
  
  #g
  dpois(lamnda,lamnda)*ppois(lamnda-1,lamnda)
  
  #h
  dpois(31,30)
    
  #EJERCICIO 5
  #exponencial
  promedio=1/lamnda
  #b1
  pexp(4/60,lamnda)
  #b2
  dexp(4/60,lamnda)
  #a
  split.screen(c(1,2))
  screen(1)
  colors()
  curve(dexp(x,lamnda),from=0,to=30/60,col="steelblue")
  screen(2)
  curve(pexp(x,lamnda),from=0,to=30/60,col="wheat2")
  close.screen(2,all.screens = TRUE)
  
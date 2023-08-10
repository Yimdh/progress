n<-1000
A<-c(rep(0,n*0.8),runif(n*0.2,0,0.5))
B<-c(rep(0,n*0.8),runif(n*0.2,0.5,1))
C<-c(rep(0,n*0.8),runif(n*0.2,0,0.5))

x<-c(A,B,C)
grps<-c(rep(0,100),rep(1,100),rep(2,100))

holl.x <- c(2.9,3.0,2.5,2.6,3.2,3.8,2.7,4.0,2.4,2.8,3.4,3.7,2.2,2.0)
holl.grps <- factor(c(1,1,1,1,1,2,2,2,2,3,3,3,3,3), 
                    labels=c("Normal Subjects","Obstr. Airway Disease","Asbestosis"))
kruskal.test(holl.x, holl.grps)

fit<-kruskal.test(x, grps)
fit

#install.packages("FSA")
library(FSA)

A<-c(runif(50,0,0.4),0.87,runif(50,0.9,0.95))
B<-c(runif(50,0,0.4),0.74,runif(50,0.9,0.95))
C<-c(runif(50,0.5,0.8),0.81,runif(50,0.96,1))
cat("median(A) :",median(A),",median(B):",median(B),",median(C):",median(C),"\n")
grps<-c(rep(0,length(A)),rep(1,length(B)),rep(2,length(C)))
data<-data.frame(x=c(A,B,C),gr=as.factor(grps))
ggplot(data=data,mapping=aes(x=x,color=gr)) + geom_histogram(bins=100)
kruskal.test(x ~ gr, data = data)
dunnTest(x ~ gr,
         data=data,
         method="bonferroni")


median(A)
median(B)
median(C)


#A<-c(3,4,5,9,8,10,9)
#B<-c(4,3,7,9,11)
#C<-c(11,12,9,10,11)
gr<-c(rep("A",length(A)),rep("B",length(B)),rep("C",length(C)))
data<-data.frame(x=c(A,B,C),gr)
rnk_set<-data %>% mutate(rnk=rank(x)) 
N<-length(gr)
C<-rnk_set %>% group_by(gr) %>% summarise(ri=sum(rnk),ni=n()) %>% mutate(sum_C=ri^2/ni) %>% pull(sum_C) %>% sum()
H<-((12/(N*(N+1)))*C)-(3*(N+1))
t<-rnk_set %>% group_by(rnk) %>% summarise(Tied=n()) %>% mutate(t3_t=Tied^3-Tied) %>% pull(t3_t) %>% sum()
T<-1-(1/(N^3-N)*t)
abj_H<-H/T
H
abj_H

n1<-100
n2<-100
n<-n1+n2
(n*(n+1))/12*(1/n1+1/n2)

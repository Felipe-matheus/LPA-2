homem(ivo).
homem(noe).
homem(cio).
homem(gil).
homem(rui).
homem(rai).
homem(pat).
mulher(ana).
mulher(bia).
mulher(ary).
mulher(eva).
mulher(gal).
mulher(lia).

gerou(ana,ary).
gerou(ana,eva).
gerou(ivo,eva).
gerou(ivo,ary).
gerou(bia,rui).
gerou(bia,rai).
gerou(pat,noe).
gerou(ary,noe).
gerou(eva,cio).
gerou(rui,cio).
gerou(rai,lia).
gerou(gal,lia).

pai(X,Y):-homem(X), gerou(X,Y).
mae(X,Y):-mulher(X), gerou(X,Y).
filho(X,Y):- homem(X), gerou(Y,X).
filha(X,Y):- mulher(X), gerou(Y,X).
irmao(X,Y):-homem(X), gerou(Z,Y), gerou(Z,X).
irma(X,Y):-mulher(X),gerou(Z,Y),gerou(Z,X).
tio(X,Y):- homem(X), irmao(X,Z), gerou(Z,Y).
tia(X,Y):- mulher(X), irma(X,Z), gerou(Z,Y).
avo(X,Y):- homem(X),gerou(X,Z),gerou(Z,Y).
avoh(X,Y):-mulher(X),gerou(X,Z),gerou(Z,Y).
primo(X,Y):- homem(X), avo(Z,X),avo(Z,Y);avoh(Z,Y),avoh(Z,X).
prima(X,Y):-mulher(X), avo(Z,X),avo(Z,Y);avoh(Z,Y),avoh(Z,X).
casal(X,Y):- gerou(X,Z),gerou(Y,Z).


continente(asia).
continente(america).
continente(europa).

pais(portugal,europa,10).
pais(espanha,europa,48).
pais(franca,europa,52).
pais(belgica,europa,9).
pais(alemanha,europa,82).
pais(holanda,europa,15).
pais(eua,america,235).
pais(brasil,america,135).
pais(china,asia,1100).
pais(mongolia,asia,3).

fronteira(portugal,espanha).
fronteira(franca,espanha).
fronteira(franca,belgica).
fronteira(belgica,alemanha).
fronteira(belgica,holanda).
fronteira(alemanha,holanda).
fronteira(alemanha,franca).
fronteira(china,mongolia).

%Escreva o predicado junto(P1,P2) que sucede se o pais P1 faz fronteira com P2.
junto(X,Y):-fronteira(X,Y).

%Escreva o predicado paises_continente(Lista, Cont) que calcula a Lista de países existentes num dado continente. 
paises_continentes(X,Y):- findall(X,(pais(X,Y,_)),Z),sort(Z,J),write(J).

%Escreva o predicado paises_grandes(Lista, Cont) que calcula a Lista de países com mais de 100 milhões de habitantes de um dado continente. 
paises_grandes(X,Y):- findall(X,(pais(X,Y,Z), Z > 100),K),sort(K,I),write(I).

% Escreva o predicado dois_mais_pop(P1, P2), que calcula quais os dois países com mais habitantes.
dois_mais_pop(X,Y):- findall(Z,(pais(X,Y,Z)),K), sort(K,L), reverse(L,H), [A,B|_]=H, findall(X,(pais(X,Y,Z), Z=A),Q),findall(X,(pais(X,Y,Z), Z=B),N), write(Q), write(" "), write(N).

%Escreva o predicado descricao(Lista), que retorne uma lista com a descrição de todos os países, incluindo o seu nome, continente e população ( [portugal*europa*10, …,china*asia*1000] ). 

%Escreva o predicado nao_sou_o_maior_do_continente(P1) que sucede se P1 não é o maior país do seu continente.
two([J, K | _], A, B):- A is J, B is K.
nao_sou_o_maior_do_continente(X):- pais(X, C, P), findall(K, (pais(_, C, K)), T), sort(T, O), reverse(O, M), two(M, V, _), not(V =:= P).

% Escreve o predicado chego_la_facil(P1, P2) que sucede se é possível chegar de P1 a P2, directamente ou atravessando unicamente um outro país. 
chego_la_facil(X,Y):- findall(Z,(fronteira(X,Z)),K),write(K), fronteira(Z,Y);fronteira(X,Y).

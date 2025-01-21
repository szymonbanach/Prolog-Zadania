%Predykaty muszą być dynamiczne by zmieniać ich własności
:- dynamic produkt/3.

% Fakty o produktach
produkt(tv, 20, sektor_a).
produkt(smartfon, 54, sektor_a).
produkt(amplituner, 30, sektor_b).
produkt(gramofon, 15, sektor_b).
produkt(sluchawki, 40, sektor_c).
produkt(gitara, 12, sektor_c).

% Reguła dostępności produktu
dostepny_produkt(X) :-
    produkt(X, N, _),
    N > 0, % Jeśli ilość(N) jest większa niż 0, program zwróci wartość True
	write('Status produktu: Dostepny').

% Reguła przenosząca produkt do innego sektoru
przenies_produkt(X, Y) :-
    produkt(X, N, OldY),
    retract(produkt(X, N, OldY)), % usuwa
    assertz(produkt(X, N, Y)), % dodaje
	write(produkt(X, N, Y)). % Nowa lokalizacja produktu

% Reguła dodającą ilość
uzupelnij_stan(X, N) :-
    produkt(X, N1, Y),
    N2 is N1 + N, % Nowa ilość to suma ilości początkowej i ilości podawanej(N)
    retract(produkt(X, N1, Y)), % usuwa
	assertz(produkt(X, N2, Y)), % dodaje
	write(produkt(X, N2, Y)). %Nowa ilość produktu

% P.S. Program nie działa w środowisku SWISH, dlatego trzeba go uruchamiać w SWI, dlatego na GitHub załączam również plik z rozszerzeniem pl.
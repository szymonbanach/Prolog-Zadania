:- dynamic ocena/3.

% Fakty
ksiazka('Ogniem i mieczem', sienkiewicz, powiesc).
ksiazka('Mroki', gombrowicz, poezja).
ksiazka('Lalka', prus, powiesc).
ksiazka('Maly ksiaze', saint-exupery, powiesc).
ksiazka('Wybor poezji', lesmian, poezja).
ksiazka('Ojciec Chrzestny', puzo, powiesc).
ocena(uzytkownik1, 'Ogniem i mieczem', 2).
ocena(uzytkownik1, 'Ojciec Chrzestny', 5).
preferencje(uzytkownik1, powiesc).
preferencje(uzytkownik2, poezja).

% Dodanie nowej oceny
dodaj_ocene(X, Ksiazka, Ocena) :-
    assertz(ocena(X, Ksiazka, Ocena)), % Dodawanie nowych faktów (ocen).
	write('Pomyslnie dodano: '), write(ocena(X, Ksiazka, Ocena)).
% Przykład: dodaj_ocene(uzytkownik2, 'Wybor poezji', 5).

% Usunięcie oceny
usun_ocene(X, Ksiazka) :-
    retract(ocena(X, Ksiazka, _)), % Usuwanie faktów (ocen).
    write('Pomyslnie usunieto ocene').
% Przykład: usun_ocene(uzytkownik2, 'Wybor poezji').

% Reguła polecane_ksiazki/2
polecane_ksiazki(X, Gatunek) :-
    findall(
        Tytul, (ksiazka(Tytul, _, Gatunek), % Funkcja findall zbiera wszystkie tytuły ksiazek,
            preferencje(X, Gatunek),        % których gatunek pokrywa się z preferencjami uzytkownika,
            ocena(X, Tytul, Ocena),         % które zostały ocenione przez uzytkownika
            Ocena >= 3), 	                % na conajmniej 3
        PolecaneKsiazki), 	               % w liście PolecaneKsiazki
    write(PolecaneKsiazki).
% Przykładowe zapytanie: polecane_ksiazki(uzytkownik1, powiesc).

% P.S. Program nie działa w środowisku SWISH, dlatego trzeba go uruchamiać w SWI, dlatego na GitHub załączam również plik z rozszerzeniem pl
     
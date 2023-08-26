# Babišovo?
---

This is my first app ever. It scans barcodes of products and warns the user if the manufacturer is part of Agrofert Holding.  
Works even offline.  
Heavily inspired by https://github.com/babisovka510/Babisovka/  
Comments, strings & data stuff (json, models, parsed data, result class, ...) are in Czech. 

# Problems I am aware of

> Since this is is my first app (and project) ever & it's my first week with Flutter, I made a bunch of mistakes I might or might not work on later

- Very bad state management (Didn't understand any st. m. approach at time of coding)
  - Everything is basically just a ValueNotifier, not only it is exposing state, it is also quite messy and hard to read.
- Saving JSONs locally instead of list of parsed ResultData or some kind of database (maybe sqlite)? - This results in app having to parse every time it is run (even though it's fast).

# My TODO:
- Oznacit veci z Ruska
- Vahove kody
- Zmenit Babis obrazky
- Pridat vyhledavani pomoci nazvu
- Pridat vyhledavani pomoci oválné značky výrobce
- Nastaveni - zobrazeni reklam?, 
- Databaze - FB skupina popup pri nahlaseni chyby
- Dodelat O aplikaci
- Zmenit design? - zmensit tlacitka, appbar
- Ohlasit uzivateli kdyz jsou nova data? idk how

## monetize (trying to get some of the $100 a year for AppStore back)
Maybe reklamy?
Donate button

# Babišovo?
---

This is my first app ever. It scans barcodes of products and warns the user if the manufacturer is part of Agrofert Holding.  
Works even offline, light/dark mode.
Heavily inspired by https://github.com/babisovka510/Babisovka/  
Comments, strings & data stuff (json, models, parsed data, result class, ...) are in Czech. 


https://github.com/gitStanda/babis/assets/136804505/8752c568-4799-4397-ad0f-8b0b7feeaee6

# Problems I am aware of

> Since this is is my first app (and project) ever & it's my first week with Flutter, I made a bunch of mistakes I might or might not work on later

- Very bad state management (Didn't understand any st. m. approach at time of coding)
  - Everything is basically just a ValueNotifier, not only it is exposing state, it is also quite messy and hard to read.
- Saving JSONs locally instead of list of parsed ResultData or some kind of database (maybe sqlite)? - This results in app having to parse every time it is run (even though it's fast).

# My TODO:
- all TODOS in code
- nefunguje offline pri prvnim spusteni - fixnout - stahnout nejaky default asset jsons
- Logo aplikace 
- Zmenit Babis obrazky
- Pridat vyhledavani pomoci oválné značky výrobce
- Nastaveni - zobrazeni reklam?, 

## monetization (trying to get some of the $100 a year for AppStore back)
reklamy?
Donate?

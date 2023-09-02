# Babišovo?
---

This is my first app ever. It scans barcodes of products and warns the user if the manufacturer is part of Agrofert Holding.  
Works even offline, light/dark mode.
Heavily inspired by https://github.com/babisovka510/Babisovka/  
Comments, strings & data stuff (json, models, parsed data, result class, ...) are in Czech. 

![image](https://github.com/gitStanda/babis/assets/136804505/83415efd-eeeb-47b9-889f-a11566a8dada)
![image](https://github.com/gitStanda/babis/assets/136804505/468baf8e-5a70-4de0-aa11-b0bef8dd7f39)

# Problems I am aware of

> Since this is is my first app (and project) ever & it's my first week with Flutter, I made a bunch of mistakes I might or might not work on later

- Very bad state management (Didn't understand any st. m. approach at time of coding)
  - Everything is basically just a ValueNotifier, not only it is exposing state, it is also quite messy and hard to read.
- Saving JSONs locally instead of list of parsed ResultData or some kind of database (maybe sqlite)? - This results in app having to parse every time it is run (even though it's fast).

# My TODO:
- all TODOS in code
- Logo aplikace 
- Zmenit Babis obrazky
- Pridat vyhledavani pomoci nazvu
- Pridat vyhledavani pomoci oválné značky výrobce
- Nastaveni - zobrazeni reklam?, 

## monetization (trying to get some of the $100 a year for AppStore back)
reklamy?
Donate?

# Seltskonnamäng

iOS rakendus, mis pakub erinevaid küsimusi seltskonnamängudeks. Rakendus on arendatud SwiftUI raamistikus.

## Funktsionaalsus

Rakendus koosneb neljast peamisest kategooriast:

1. **Tõde või vale?**
   - Väited koos selgitustega
   - Visuaalne tagasiside õige/vale vastuse kohta
   - Animatsioonid vastuse näitamisel

2. **Noorte eri**
   - Küsimused nooremale sihtrühmale
   - Juhuslik küsimuste järjekord
   - Küsimuste loendur

3. **Täiskasvanute eri**
   - Küsimused täiskasvanutele
   - Juhuslik küsimuste järjekord
   - Küsimuste loendur

4. **Jäälõhkujad**
   - Küsimused täiskasvanutele
   - Juhuslik küsimuste järjekord
   - Küsimuste loendur

## Tehniline Dokumentatsioon

### Projekti Struktuur

```
seltskonnamang/
├── CategorySelectionView.swift    # Peamine navigatsioonivaade
├── QuestionView.swift             # Küsimuste kuvamise vaade
├── TruthQuestions.swift           # Tõde/vale küsimuste andmebaas
└── README.md                      # Projekti dokumentatsioon
```

### Põhilised Komponendid

#### QuestionView
- Kuvab küsimused kategooriate järgi
- Haldab küsimuste juhuslikku järjekorda

#### CategorySelectionView
- Navigatsioon kategooriate vahel
- Visuaalselt atraktiivne kasutajaliides
- Gradienttaust ja modernne disain

### Funktsionaalsed Detailid

#### Küsimuste Juhuslik Järjekord
- Küsimused valitakse juhuslikult
- Iga küsimus kuvatakse ainult üks kord
- Kui kõik küsimused on kasutatud, alustatakse otsast peale

#### Visuaalne Tagasiside
- Õige vastus: valge taust õrna rohelise alatooniga
- Vale vastus: valge taust õrna punaka alatooniga
- Sujuvad animatsioonid vastuste vahetumisel

#### Kasutajaliides
- Modernne ja minimalistlik disain
- Gradienttaust (oranž kuni roosa)
- Ümarad nurgad ja varjud elementidel
- Selge loetavus

### Tehnilised Nõuded

- iOS 15.0 või uuem
- Xcode 13.0 või uuem
- Swift 5.5 või uuem
- SwiftUI raamistik

### Funktsionaalne Testimine

1. **Küsimuste Kuvamine**
   - [ ] Kontrolli, et kõik kategooriad laevad korrektselt
   - [ ] Veendu, et küsimused kuvatakse õigesti
   - [ ] Kontrolli, et juhuslik järjekord töötab
   - [ ] Veendu, et küsimused ei kordu enne kui kõik on läbi käidud

2. **Tõde/Vale Kategooria**
   - [ ] Kontrolli, et väited kuvatakse korrektselt
   - [ ] Veendu, et õige/vale vastused on õiged
   - [ ] Kontrolli, et selgitused kuvatakse
   - [ ] Veendu, et värvid muutuvad vastavalt vastusele

3. **Navigatsioon**
   - [ ] Kontrolli, et kategooriate vahel liikumine töötab
   - [ ] Veendu, et "Tagasi" nupp töötab
   - [ ] Kontrolli, et "Järgmine küsimus" nupp töötab
   - [ ] Veendu, et küsimuste loendur töötab õigesti (Note to self - Kas jätta loendur või mitte?)

### Stabiilsuse Testimine

1. **Pikaajaline Kasutamine**
   - [ ] Testi rakendust pidevalt 1+ tund, korduv avamine ja sulgemine
   - [ ] Kontrolli, et rakendus ei jookse kokku
   - [ ] Veendu, et jõudlus ei halvene aja jooksul

2. **Erinevad Seadmed**
   - [ ] Testi erinevatel iPhone mudelitel
   - [ ] Kontrolli erinevatel iOS versioonidel
   - [ ] Veendu, et kasutajaliides kohandub ekraani suurusega

## Järgmised Sammud

- [ ] Lisada uusi küsimuskategooriaid, igasse 100?
- [ ] Implementeerida skoorisüsteem?? 
- [ ] Lisada animatsioone
- [ ] Parandada animatsioonide sujuvust
- [ ] Lisada küsimuste filtreerimise võimalus
- [ ] Lisada oma küsimuste lisamise võimaluse
- [ ] Uued kategooriad
- [ ] Kasutajad?
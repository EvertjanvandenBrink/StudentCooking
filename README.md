# StudentCoocking App - 2019 edition

Studenten kunnen middels deze app hun ingredienten laten herkennen. De herkende ingrediënten worden aan het lijstje met subscritpions toegevoegd. Vanuit daar kan de gebruiker alle recepten waarbij dat ingrediënt benodigd is kunnen openen. De gebruiker kan vervolgens 1 van die recepten selecteren, om zo de details te kunnen inzien. 
Verder kan de gebruiker door alle recepten heen scrollen en recepten bekijken. Ook kan de gebruiker zijn device schudden, de app zal dan met een aanbeveling komen. Dit is erg handig aangezien studenten vaak niet weten wat ze willen gaan eten.
Tevens is het mogelijk om recepten als favorieten op te slaan en op ingrediënten en categorieën te subscriben. 
Een mogelijke uitbreiding is de koppeling met de Albert Heijn winkelmand. 

## Inhoudsopgave

* **[1. Voorwaarden](#Prerequisites)**

* **[2. Snelle start](#Quick_start)** 

  - [2.1 Installeer XCode](#XCode)
  - [2.2 Installeer Swift](#Swift)
  - [2.3 Hoe het project clonen](#HowToClone)
  - [2.4 Run in XCode](#RunXCode)

* **[3. Release geschiedenis](#Release_History)**

* **[4. Requirements](#Requirements)**

## 1. Voorwaarden <a name="Prerequisites"/>

Deze applicatie is ontwikkeld in Swift. 

macOS, Ubuntu Linux LTS, en de laatste Ubuntu Linux-release zijn de huidige
ondersteunde besturingssystemen voor hostontwikkeling.
    
## 2. Snelle start <a name="Quick_start"/>

### 2.1 Installeer XCode <a name="XCode"/>

Om te bouwen voor macOS, is [Xcode 10.2 beta](https://developer.apple.com/xcode/downloads/) nodig.

### 2.2 Installeer Swift <a name="Swift"/>

U moet [Swift installeren](https://swift.org/getting-started/#installing-swift)

### 2.3 Hoe het project clonen <a name="HowToClone"/>

1. Clone de repository en ga naar de map.

```
$ git clone https://github.com/HANICA-MAD/dia-app2-2019-evertjan-jesper.git
``` 

### 2.4 Run in XCode <a name="RunXCode"/>

Ontgrendel je apparaat en sluit het aan op je computer.

Open het project (.xcworkspace-bestand) in XCode en klik op de knop Uitvoeren of klik op Product> Build om het project te compileren.
Het project zal niet compileren wanneer u het .xcodeproj-bestand opent, omdat de gebruikte cocoapods dan niet werken. Dus let op dat u het juiste bestand opent!

Na het bouwen van het project, genereert u een uitvoerbaar bestand. U kunt dit uitvoerbare bestand uitvoeren via een Unix-shell of door middel van Xcode. Om Xcode in te stellen om het project uit te voeren, gaat u naar Product> Schema> Bewerkingsschema.
Selecteer Uitvoeren in het linkerdeelvenster, selecteer Info bovenaan en klik op de vervolgkeuzelijst naast Uitvoerbaar.
Klik op Overig en selecteer het uitvoerbare bestand dat werd gegenereerd toen u uw project compileerde. Klik OK.
Nu kunt u uw project opnieuw uitvoeren door op de knop Uitvoeren te klikken of via Product> Uitvoeren.

## 3. Release geschiedenis <a name="Release_History"/>

- 1.0.0 
  - ReadMe aangevuld.
  - 10 april 2019
- 0.1.0
  - Initiële versie gemaakt
  - 12 maart 2019

## 4. Requirements <a name="Requirements"/>

Voor de requirements wil ik u naar [dit document](StudentCooking.docx) verwijzen. 

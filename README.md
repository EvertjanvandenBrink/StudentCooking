# StudentCoocking App - 2019 edition

Studenten kunnen middels deze app hun ingredienten laten herkennen. Vervolgens zal de app met 1 of kmeerdere recepten komen. De gerbuiker kan vervolgens 1 van die recpten selecteren. De app zal dan de missende ingredienten direct aan het Albert Heijn winkelmandje toevoegen zodat de gebruiker deze direct kan bestellen. 

Verder kian de gebruiker door alle recepten heenscrollen en recepten bekijken.
Ook kan de gebruiker zijn device schudden, de app zal dan met een aanbeveling komen. Dit is erg handig aangezien studenten vaak niet weten wat ze willen gaan eten. 

Mogelijke uitbreidingen:
- De gebruiker kan subscriben op bepaalcde ingredienten of categorieën zodat hij push notificaties ontvangt zodra er een nieuw recept binnenkomt waar het betreffende ingredient in wordt gebruikt. 

## Inhoudsopgave

* **[1. Prerequisites](#Prerequisites)**

* **[2. Quick start](#Quick_start)** 

  - [2.1 Install XCode](#XCode)
  - [2.2 Install Swift](#Swift)
  - [2.3 How to clone](#HowToClone)
  - [2.4 How to run in XCode](#RunXCode)

* **[3. Release history](#Release_History)**

* **[4. Requirements](#Requirements)**

## 1. Prerequisites <a name="Prerequisites"/>

This application is written in Swift. 

macOS, Ubuntu Linux LTS, and the latest Ubuntu Linux release are the current
supported host development operating systems.
    
## 2. Quick Start <a name="Quick_start"/>

### 2.1 Install XCode <a name="XCode"/>

To build for macOS, you need [Xcode 10.2 beta](https://developer.apple.com/xcode/downloads/).

### 2.2 Install Swift <a name="Swift"/>

You need to [install Swift](https://swift.org/getting-started/#installing-swift)

### 2.3 How to clone <a name="HowToClone"/>

1. Clone the repo and go to that directory

```
$ git clone https://github.com/HANICA-MAD/dia-app2-2019-evertjan-joas.git
``` 

### 2.4 How to run in XCode <a name="RunXCode"/>

Unlock your device and connect it to your computer.

Open the project (.xcworkspace file) in XCode and click on the	Run button or click on Product > Build to compile the project. 
The project will not buidl when you open the .xcodeproj file because the used cocoapods don't work then. So pay attention that you open the correct file!

After	building the project, you will generate an executable. You can run this executable through a	unix	shell or 
through	Xcode. To	setup	Xcode	to run the project go to Product > Scheme >	Edit Scheme.	
Select Run from	the	left panel,	select Info from top and click on	the	drop down	list next to Executable.
Click	Other	and	select the executable that was generated when you compiled your	project. Click Ok.
Now	you	can	run	your project again by clicking the Run button or through Product > Run.

## 3. Release History <a name="Release_History"/>

- 0.1.0
  - Filled the empty readMe file
  - 12 March 2019

## 4. Requirements <a name="Requirements"/>

- [ ] De gebruiker kan ingredienten laten herkennen
- [ ] De gebruiker kan recepten bekijken
- [ ] De gebruiker kan ingredienten toevoegen aan albert heijn winkelwagen
- [ ] De gebruiker kan recepten doorzoeken en filteren
- [ ] De gebruiker kan een willekeurig recept opvragen
- [ ] De gebruiker kan recepten aan favorieten toevoegen
Uitbreidingen
- [ ] De gebruiker kan subscriben op categorieen en ingredienten

API's:
- https://www.themealdb.com/api.php --> voor recepten/ingredienten
- https://www.food2fork.com/ --> voor recepten
- https://developer.nutritionix.com/docs/v2 --> evt. voor nutrition informatie bij ingredienten/recepten
- https://www.veggipedia.nl/recepten/ --> voor ingredienten en recepten

Frameworks: 
- pods (alamofire & swiftyjson) voor de api calls

add-to-list widget

Voor het herkennen van ingredienten:
- OCR
- Image recognition (coreML)
- Barcode scannen en uitlezen uit een api


Screen layout

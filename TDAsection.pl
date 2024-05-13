/* TDA SECTION
Estructura de lista de elementos [ST1,ST2,DI,CO]
DOM:    ST1: estacion de metro 1 (VAR TDA station)
		ST2: estacion de metro 2 (VAR TDA station)
		DI: Distancia entre estaciones (num)
		CO: nombre de estacion (num >= 0)
        SECTION: TDA section de metro (VAR)

PREDICADOS:
	section(ST1,ST2,DI,CO,SECTION)
    getStation1Section(SECTION,ST1)
    getStation2Section(SECTION,ST2)
    getDistanceSection(SECTION,DI)
    getCostSection(SECTION,CO)
    setStation1Section(SECTION,ST1,SECTION)
    setStation2Section(SECTION,ST2,SECTION)
    setDistanceSection(SECTION,DI,SECTION)
    setCostSection(SECTION,CO,SECTION)
    isSection(SECTION)

METAS PRIMARIAS:
	section: relacionar elementos de una section en una Variable
    isSection: Verificar section
    getStation1Section: Station1 de una section
    getStation2Section: Station2 de una section
    getDistanceSection: Ditancia de una section
    getCostSection: Costo de una section
    setStation1Section: Section con nueva Station1
    setStation2Section: Section con nueva Station2
    setDistanceSection: Section con nueva distancia
    setCostSection: Section con nuevo costo
*/
:- module(tdaSection,[section/5,isSection/1,getStation1Section/2,getStation2Section/2,getDistanceSection/2,getCostSection/2]).
:- use_module(tdaStation).

%constructor
section(Station1,Station2,Distancia,Costo,[Station1,Station2,Distancia,Costo]).

%pertenecia
isSection(SEC):-section(_,_,_,_,SEC).

%selectores
getStation1Section(SEC,ST1):-section(ST1,_,_,_,SEC).
getStation2Section(SEC,ST2):-section(_,ST2,_,_,SEC).
getDistanceSection(SEC,DIS):-section(_,_,DIS,_,SEC).
getCostSection(SEC,COST):-section(_,_,_,COST,SEC).

%modificadores
setStation1Section(SEC,NewST1,NewSEC):-section(_,ST2,DIS,COST,SEC),section(NewST1,ST2,DIS,COST,NewSEC).
setStation2Section(SEC,NewST2,NewSEC):-section(ST1,_,DIS,COST,SEC),section(ST1,NewST2,DIS,COST,NewSEC).
setDistanceSection(SEC,NewDIS,NewSEC):-section(ST1,ST2,_,COST,SEC),section(ST1,ST2,NewDIS,COST,NewSEC).
setCostSection(SEC,NewCOST,NewSEC):-section(ST1,ST2,DIS,_,SEC),section(ST1,ST2,DIS,NewCOST,NewSEC).
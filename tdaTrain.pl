/* TDA train
Abstraccion de un tren de metro, no todo tren creado es un tren valido, se require verificar validez (isTrain())
Representacion estructura de lista de elementos [ID,MAKER,RailT,SPEED,PCARs]
DOM:
    ID: Id del tren (num)
    MAKER: Fabricante del tren (string)
    RailT: Tipo de vias compatibles con el tren (string)
    SPEED: Rapidez del tren km/h (num)
    PCARs: Lista de TDA Pcar (lista VAR TDA pcar) *puede ser lista vacia en un inicio*
    TRAIN: TDA Tren (VAR)
    PCAR: TDA Pcar (TDA Pcar)
    POSITION: Posicion de un elemento dentro de una lista (num)
    LIST: Lista de elementos (Lista)
    ELE: Elemento x de una lista (cualquier tipo de dato)
    CAP: Capacidad de pasajeros (VAR, num)

PREDICADOS:
    train(ID,MAKER,RailT,SPEED,PCARs,TRAIN)
    isTrainWithoutVerifications(TRAIN)
    getIdTrain(TRAIN,ID)
    getMakerTrain(TRAIN,MAKER)
    getRailTypeTrain(TRAIN,RailT)
    getSpeedTrain(TRAIN,SPEED)
    getPCARsTrain(TRAIN,PCARs)
    setIdTrain(TRAIN,ID,TRAIN)
    setMakerTrain(TRAIN,MAKER,TRAIN)
    setRailTypeTrain(TRAIN,RailT,TRAIN)
    setSpeedTrain(TRAIN,SPEED,TRAIN)
    setPCARsTrain(TRAIN,PCARs,RAIN)
    listOfPCARs(PCARs)
    trainAddCar(TRAIN,PCAR,POSITION,TRAIN)
    insertarElementoEnPosicion(LIST,POSITION,ELE,LIST)
    trainRemoveCar(TRAIN,POSITION,TRAIN)
    eliminarElementoEnPosicion(LIST,POSITION,LIST)
    trainCapacity(TRAIN,CAP)
    capacidadTotal(PCARs,CAP)
    isTrain(TRAIN)
    compatibleModelPCARs(PCARs)
    compatibleTypePCARs(PCARs)
    listaSinLosExtremos(LIST,LIST)
    carrosCentrales(PCARs)

METAS PRIMARIAS:
    train: Relaciona elementos de un tren en una variable
    isTrainWithoutVerifications: Verificar train sin validaciones de compatibilidad
    getIdTrain: Id de un train
    getMakerTrain: Maker de un train
    getRailTypeTrain: Tipo de riel de un train
    getSpeedTrain: Rapidez de un train
    getPCARsTrain: Carros de un train
    setIdTrain: Train con nuevo id
    setMakerTrain: Train con nuevo maker
    setRailTypeTrain: Train con nuevo tipo de riel
    setSpeedTrain: Train con nueva rapidez
    setPCARsTrain: Train con nuevos carros
    trainAddCar: Train con un nuevo pcar en una posicion determinada
    trainRemoveCar: Train sin el pcar de una posicion determinada
    trainCapacity: Capacidad de pasajeros de un tren
    isTrain: Verificar train valido

METAS SECUNDARIAS:
    listOfPCARS: verifica si los elementos de una lista son todos TDA Pcar
    insertarElementoEnPosicion: insertar un elemento en una posicion determina en una lista
    eliminarElementoEnPosicion([_|COLA],0,COLA) : eliminar un elemento en una posicion determinada en una lista
    capacidadTotal: obtener la capacidad total de una lista de TDAs Pcar
    compatibleModelPCARs: verificar que todos los elementos de una lista de TDAs Pcar sean del mismo modelo
    compatibleTypePCARs: verificar que todos los elementos de una lista de TDAs Pcar sean compatibles segun el tipo, (extremos tr y centrales ct)
    listaSinLosExtremos: elimina el primer y ultimo elemento de una lista
    carrosCentrales: verifica que los carros centrales de una linea sean del tipo ct

*/
:- module(tdaTrain,[train/6,isTrain/1,getIdTrain/2,getMakerTrain/2,getRailTypeTrain/2,getSpeedTrain/2,getPCARsTrain/2,trainAddCar/4,trainRemoveCar/3,trainCapacity/2]).
:- use_module(tdaPcar).
:- use_module(tdaLine).

%constructor, Funcionalidad 10
train(ID,MAKER,RailT,SPEED,PCARs,[ID,MAKER,RailT,SPEED,PCARs]):-listOfPCARs(PCARs).



%pertenencia
isTrainWithoutVerifications(TRAIN):-train(_,_,_,_,_,TRAIN).



%selectores
getIdTrain(TRAIN,ID):-train(ID,_,_,_,_,TRAIN).
getMakerTrain(TRAIN,MAKER):-train(_,MAKER,_,_,_,TRAIN).
getRailTypeTrain(TRAIN,RailT):-train(_,_,RailT,_,_,TRAIN).
getSpeedTrain(TRAIN,SPEED):-train(_,_,_,SPEED,_,TRAIN).
getPCARsTrain(TRAIN,PCARs):-train(_,_,_,_,PCARs,TRAIN).



%modificadores
setIdTrain(TRAIN,NewID,NewTRAIN):-train(_,MAK,RAI,SPE,PCARs,TRAIN),train(NewID,MAK,RAI,SPE,PCARs,NewTRAIN).
setMakerTrain(TRAIN,NewMAKER,NewTRAIN):-train(ID,_,RAI,SPE,PCARs,TRAIN),train(ID,NewMAKER,RAI,SPE,PCARs,NewTRAIN).
setRailTypeTrain(TRAIN,NewRailT,NewTRAIN):-train(ID,MAK,_,SPE,PCARs,TRAIN),train(ID,MAK,NewRailT,SPE,PCARs,NewTRAIN).
setSpeedTrain(TRAIN,NewSPEED,NewTRAIN):-train(ID,MAK,RAI,_,PCARs,TRAIN),train(ID,MAK,RAI,NewSPEED,PCARs,NewTRAIN).
setPCARsTrain(TRAIN,NewPCARs,NewTRAIN):-train(ID,MAK,RAI,SPE,_,TRAIN),train(ID,MAK,RAI,SPE,NewPCARs,NewTRAIN).




%otros predicados

%predicado que verifica si una lista tiene solo elementos TDA Pcar, tambien es cierto cuando es lista vacia.
listOfPCARs([]).
listOfPCARs([X|COLA]):-isPcar(X),listOfPCARs(COLA),!.




/* Funcionalidad 11*/
trainAddCar(TRAIN,PCAR,POSITION,NewTRAIN):- isPcar(PCAR), train(ID,MAKER,RailT,SPEED,PCARsBefore,TRAIN),
    insertarElementoEnPosicion(PCARsBefore,POSITION,PCAR,PCARsAfter), train(ID,MAKER,RailT,SPEED,PCARsAfter,NewTRAIN).

%insertar un elemento en una posicion determina en una lista
insertarElementoEnPosicion([],0,ELE,[ELE]).    %caso primer elemento de la lista, y se inserta en la posicion 0
insertarElementoEnPosicion([X|COLA],0,ELE,[ELE,X|COLA]):-!.
insertarElementoEnPosicion([X|COLA],Posicion,ELE,[X|COLA1]):-Posicion > 0, P is Posicion-1, insertarElementoEnPosicion(COLA,P,ELE,COLA1),!.




/* Funcionalidad 12*/
trainRemoveCar(TRAIN,POSITION,NewTRAIN):- train(ID,MAKER,RailT,SPEED,PCARsBefore,TRAIN), eliminarElementoEnPosicion(PCARsBefore,POSITION,PCARsAfter),
    train(ID,MAKER,RailT,SPEED,PCARsAfter,NewTRAIN).

%eliminar un elemento en una posicion determinada en una lista
eliminarElementoEnPosicion([_|COLA],0,COLA):-!.
eliminarElementoEnPosicion([X|COLA],Posicion,[X|COLA1]):-Posicion > 0, P is Posicion-1,eliminarElementoEnPosicion(COLA,P,COLA1),!.




/* Funcionalidad 13*/
isTrain(TRAIN):- train(ID,MAKER,RailT,SPEED,PCARs,TRAIN), number(ID), string(MAKER), string(RailT), number(SPEED), length(PCARs,CantPCARs), CantPCARs >=2,  %condicion para estrucutra minima de 2 carros
    compatibleModelPCARs(PCARs), compatibleTypePCARs(PCARs). 

%verifica que todos los pcar de una lista de pcars sean del mismo modelo de carro 
compatibleModelPCARs([PcarActual|COLA]):- getModelPcar(PcarActual,MODELO), compatibleModelPCARs(COLA,MODELO),!.
compatibleModelPCARs([],_).
compatibleModelPCARs([PcarActual|COLA],MODELO):- getModelPcar(PcarActual,MODELOActual), MODELOActual == MODELO,
    compatibleModelPCARs(COLA,MODELO).

%verifica que todos los pcar de una lista de pcars sean compatibles, (extremos son tipo tr y los centrales tipo ct), considerando la estructura minima tr - tr
compatibleTypePCARs(PCARs):- getFirstList(PCARs,FirstPCAR), getTypePcar(FirstPCAR,TypeFirstPCAR), TypeFirstPCAR == tr,
    getLastList(PCARs,LastPCAR), getTypePcar(LastPCAR,TypeLastPCAR), TypeLastPCAR == tr,
    listaSinLosExtremos(PCARs,PCARsSinExtremos), carrosCentrales(PCARsSinExtremos).

%elimina el primer y ultimo elemento de una lista
listaSinLosExtremos([_|COLA],ListSalida):-reverse(COLA,[_|COLA1]),reverse(COLA1,ListSalida).

%verifica que los carros centrales de una linea sean del tipo ct
carrosCentrales([]):-!.
carrosCentrales([X|COLA]):- getTypePcar(X,TypePcarActual), TypePcarActual == ct, carrosCentrales(COLA),!.




/* Funcionalidad 14*/
trainCapacity(TRAIN,CAP):- train(_,_,_,_,PCARs,TRAIN),capacidadTotal(PCARs,CAP).

%obtener la capacidad total de una lista de TDA pcar
capacidadTotal([],0):-!.
capacidadTotal([PcarActual|COLA],CAPA):- getCapacityPcar(PcarActual,CapacidadActual), capacidadTotal(COLA,C), CAPA is C+CapacidadActual.
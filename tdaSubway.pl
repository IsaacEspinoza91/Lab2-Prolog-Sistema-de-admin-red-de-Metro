/* TDA subway
Abstraccion de una red de metro
Representacion estructura de lista de elementos [ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN]
DOM:
    ID: Id del metro (num)
    NAME: Nombre del metro (string)
    TRAINS: Lista de trenes (Lista TDAs train)
    LINES: Lista de lineas (Lista TDAs line)
    DRIVERS: Lista de conductores (Lista TDAs driver)
    IdLinea: Id de una linea del metro (num)
    IdTrain: Id de un tren del metro (num)
    LINE_TRAINS: Lista de pares donde el primer elemento es la ID de una linea, 
        y el segundo una lista de trenes asociados a esa linea ([IdLinea, Lista TDAs Train])
    HoraPartida: Horario de partida de un tren en el metro en formato HH:MM:SS (string)
    StPartida: Nombre de la estacion de partida de un tren en el metro (string)
    StLlegada: Nombre de la estacion de llegada de un tren en el metro (string)
    DRIVER_TRAIN: Lista de elementos con la siguientes estructura [IdDriver,IdTrain,HoraPartida,StPartida,StLlegada]
    SUBWAY: TDA red de metro (TDA suwbay)
    LIST: Lista de elementos (Lista)

PREDICADOS:
    subway(ID,NAME,SUBWAY)
    isSubway(SUBWA)
    getIdSubway(SUBWAY,ID)
    getNameSubway(SUBWAY,NAME)
    getTrainsSubway(SUBWAY,TRAINS)
    getLinesSubway(SUBWAY,LINES)
    getDriversSubway(SUBWAY,DRIVERS)
    getLine_TrainsSubway(SUBWAY,LINE_TRAINS)
    getDriver_TrainSubway(SUBWAY,LINE_TRAINS)
    subwayAddTrain(SUBWAY,TRAINS,SUBWAY)
    listaSinElementosRepetidos(LIST)
    subwayAddLine(SUBWAY,LINES,SUBWAY)
    subwayAddDriver(SUBWAY,DRIVERS,SUBWAY)

METAS PRIMARIAS:
    subway: Relacionar elementos id y nombre de un TDA subway (constructor)
    isSubway: Verificar subway
    getIdSubway: Id de subway
    getNameSubway: Nombre de subway
    getTrainsSubway: Trenes de un subaway
    getLinesSubway: Lineas de un subway
    getDriversSubway: Conductores de un subway
    getLine_TrainsSubway: Lista de linea-trenes de un subway
    getDriver_TrainSubway: Lista de conductor-tren de un subway
    subwayAddTrain: Añade trenes a un subway, dado que no hay trenes repetidos
    subwayAddLine: Añade lineas a un subway, dado que no hay lineas repetidas
    subwayAddDriver: Añade conductores a un subway, dado que no hay drivers repetidos 

METAS SECUNDARIAS:
    listaSinElementosRepetidos: Verificar que una lista no tiene elementos repetidos


*/
:-module(tdaSubway,[subway/3,subwayAddTrain/3,subwayAddLine/3,subwayAddDriver/3]).
:-use_module(tdaSection).
:-use_module(tdaStation).
:-use_module(tdaLine).
:-use_module(tdaPcar).
:-use_module(tdaDriver).
:-use_module(tdaTrain).


%constructor, Funcionalidad 16
subway(ID,NAME,[ID,NAME,[],[],[],[],[]]).
subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,[ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN]).



%pertenencia
isSubway(SUBWAY):-subway(_,_,SUBWAY).



%selectores
getIdSubway(SUBWAY,ID):-subway(ID,_,SUBWAY).
getNameSubway(SUBWAY,NAME):-subway(_,NAME,SUBWAY).
getTrainsSubway(SUBWAY,TRAINS):-subwayComplete(_,_,TRAINS,_,_,_,_,SUBWAY).
getLinesSubway(SUBWAY,LINES):-subwayComplete(_,_,_,LINES,_,_,_,SUBWAY).
getDriversSubway(SUBWAY,DRIVERS):-subwayComplete(_,_,_,_,DRIVERS,_,_,SUBWAY).
getLine_TrainsSubway(SUBWAY,LINE_TRAINS):-subwayComplete(_,_,_,_,_,LINE_TRAINS,_,SUBWAY).
getDriver_TrainSubway(SUBWAY,DRIVER_TRAINS):-subwayComplete(_,_,_,_,_,_,DRIVER_TRAINS,SUBWAY).



%modificadores
setIdSubway(SUBWAY,NewID,NewSUBWAY):-subwayComplete(_,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,SUBWAY),
    subwayComplete(NewID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,NewSUBWAY).
setNameSubway(SUBWAY,NewNAME,NewSUBWAY):-subwayComplete(ID,_,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,SUBWAY),
    subwayComplete(ID,NewNAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,NewSUBWAY).
setTrainsSubway(SUBWAY,NewTRAINS,NewSUBWAY):-subwayComplete(ID,NAME,_,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,SUBWAY),
    subwayComplete(ID,NAME,NewTRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,NewSUBWAY).
setLinesSubway(SUBWAY,NewLINES,NewSUBWAY):-subwayComplete(ID,NAME,TRAINS,_,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,SUBWAY),
    subwayComplete(ID,NAME,TRAINS,NewLINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,NewSUBWAY).
setDriversSubway(SUBWAY,NewDRIVERS,NewSUBWAY):-subwayComplete(ID,NAME,TRAINS,LINES,_,LINE_TRAINS,DRIVER_TRAIN,SUBWAY),
    subwayComplete(ID,NAME,TRAINS,LINES,NewDRIVERS,LINE_TRAINS,DRIVER_TRAIN,NewSUBWAY).
setLine_TrainsSubway(SUBWAY,NewLINE_TRAINS,NewSUBWAY):-subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,_,DRIVER_TRAIN,SUBWAY),
    subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,NewLINE_TRAINS,DRIVER_TRAIN,NewSUBWAY).
setDriver_TrainSubway(SUBWAY,NewDRIVER_TRAIN,NewSUBWAY):-subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,_,SUBWAY),
    subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,NewDRIVER_TRAIN,NewSUBWAY).




%otros predicados

/* Funcionalidad 17 */
subwayAddTrain(SUBWAY,AddTRAINS,NewSUBWAY):- subwayComplete(_,_,TRAINS,_,_,_,_,SUBWAY), append(TRAINS,AddTRAINS,NewTRAINS),
    listaSinElementosRepetidos(NewTRAINS), setTrainsSubway(SUBWAY,NewTRAINS,NewSUBWAY).     %no hay trenes repetidos

%verificar que una lista no tiene elementos repetidos
listaSinElementosRepetidos([]):-!.
listaSinElementosRepetidos([X|COLA]):- not(member(X,COLA)), listaSinElementosRepetidos(COLA).




/* Funcionalidad 18 */
subwayAddLine(SUBWAY,AddLINES,NewSUBWAY):- subwayComplete(_,_,_,LINES,_,_,_,SUBWAY), append(LINES,AddLINES,NewLINES),
    listaSinElementosRepetidos(NewLINES), setLinesSubway(SUBWAY,NewLINES,NewSUBWAY).




/* Funcionalidad 19 */
subwayAddDriver(SUBWAY,AddDRIVERS,NewSUBWAY):- subwayComplete(_,_,_,_,DRIVERS,_,_,SUBWAY), append(DRIVERS,AddDRIVERS,NewDRIVERS),
    listaSinElementosRepetidos(NewDRIVERS), setDriversSubway(SUBWAY,NewDRIVERS,NewSUBWAY).



/* Funcionalidad 20 */
%subwayToString
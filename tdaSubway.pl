/* TDA subway
Abstraccion de una red de metro
Representacion estructura de lista de elementos [ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN]
DOM:
    ID: Id del metro (num)
    NAME: Nombre del metro (string)
    TRAINS: Lista de trenes (Lista TDAs train)
    LINES: Lista de lineas (VAR, Lista TDAs line)
    DRIVERS: Lista de conductores (Lista TDAs driver)
    IdLinea: Id de una linea del metro (num)
    IdTrain: Id de un tren del metro (num)
    LINE_TRAINS: Lista de pares donde el primer elemento es la ID de una linea, 
        y el segundo una lista IDs de trenes asociados a esa linea ([IdLinea, Lista IDs TDAs Train])
    HoraPartida: Horario de partida de un tren en el metro en formato HH:MM:SS (string)
    StPartida: Nombre de la estacion de partida de un tren en el metro (string)
    StLlegada: Nombre de la estacion de llegada de un tren en el metro (string)
    DRIVER_TRAIN: Lista de elementos con la siguientes estructura [IdDriver,IdTrain,HoraPartida,StPartida,StLlegada]
    SUBWAY: TDA red de metro (TDA suwbay)
    LIST: Lista de elementos (Lista)
    NameStation: Nombre de una estacion de metro (string)
    StopTime: Tiempo de parada en una estacion (string)
    Sections: Lista de secciones (VAR, Lista TDAs section)

PREDICADOS:
    subway(ID,NAME,SUBWAY)
    isSubway(SUBWA)
    subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,SUBWAY).
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
    subwaySetStationStopTime(SUBWAY,NameStation,StopTime,SUBWAY)
    recorrerLinesModStopTime(LINES,NameStation,StopTime,LINES)
    recorrerSectionsModStopTime(Sections,NameStation,StopTime,Sections)

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
    subwaySetStationStopTime: Subway con nuevo tiempo de parada en una estacion en especifico

METAS SECUNDARIAS:
    listaSinElementosRepetidos: Verificar que una lista no tiene elementos repetidos
    subwayComplete: Constructor de elemento TDA Subway con todos sus parametros
    recorrerLinesModStopTime: Recorre lista de Lines donde a cada uno se aplica recorrerSectionsModStopTime para modificar el StopTime de una station en especifico
    recorrerSectionsModStopTime: Recorre una lista de Sections, modificando el StopTime de una station en especifico

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
    listaSinElementosRepetidos(NewLINES), setLinesSubway(SUBWAY,NewLINES,NewSUBWAY). %utilizamos modificador del TDA




/* Funcionalidad 19 */
subwayAddDriver(SUBWAY,AddDRIVERS,NewSUBWAY):- subwayComplete(_,_,_,_,DRIVERS,_,_,SUBWAY), append(DRIVERS,AddDRIVERS,NewDRIVERS),
    listaSinElementosRepetidos(NewDRIVERS), setDriversSubway(SUBWAY,NewDRIVERS,NewSUBWAY).




/* Funcionalidad 20 */
%subwayToString




/* Funcionalidad 21 */
subwaySetStationStopTime(SUBWAY,NameStation,StopTime,NewSubway):- subwayComplete(_,_,_,LINES,_,_,_,SUBWAY),
    recorrerLinesModStopTime(LINES,NameStation,StopTime,NewLINES), setLinesSubway(SUBWAY,NewLINES,NewSubway). %se usa modificador


%predicado que recorre una lista de lineas donde a cada una se aplica el predicado recorrerSectionsModStopTime para modificar el StopTime de una station en especifico
recorrerLinesModStopTime([],_,_,[]).
recorrerLinesModStopTime([CurrentLine|COLA],NameStation,NewStopTime,[NewLine|COLA1]):-
    line(IDLine,NOMLine,RailTLine,SectionsLine,CurrentLine), recorrerSectionsModStopTime(SectionsLine,NameStation,NewStopTime,NewSectionsLine),
    line(IDLine,NOMLine,RailTLine,NewSectionsLine,NewLine), recorrerLinesModStopTime(COLA,NameStation,NewStopTime,COLA1).


%predicado que recorrer una lista de sections, compara los nombre de las estaciones (st1 y st2) y cambia el StopTime si es la estacion deseada
recorrerSectionsModStopTime([],_,_,[]):-!.

recorrerSectionsModStopTime([CurrentSection|COLA],NameStation,NewStopTime,[ModifiedSection|COLA1]):- section(ST1,ST2,DIST,COST,CurrentSection),
    station(IDSt1,NameSt1,TypeSt1,_,ST1), NameSt1 == NameStation,
    station(IDSt1,NameSt1,TypeSt1,NewStopTime,ModifiedStation), section(ModifiedStation,ST2,DIST,COST,ModifiedSection),
    recorrerSectionsModStopTime(COLA,NameStation,NewStopTime,COLA1).

recorrerSectionsModStopTime([CurrentSection|COLA],NameStation,NewStopTime,[ModifiedSection|COLA1]):- section(ST1,ST2,DIST,COST,CurrentSection),
    station(IDSt2,NameSt2,TypeSt2,_,ST2), NameSt2 == NameStation, 
    station(IDSt2,NameSt2,TypeSt2,NewStopTime,ModifiedStation), section(ST1,ModifiedStation,DIST,COST,ModifiedSection),
    recorrerSectionsModStopTime(COLA,NameStation,NewStopTime,COLA1).

recorrerSectionsModStopTime([CurrentSection|COLA],NameStation,NewStopTime,[CurrentSection|COLA1]):-
    recorrerSectionsModStopTime(COLA,NameStation,NewStopTime,COLA1).




/* Funcionalidad 22 */
subwayAssignTrainToLine(SUBWAY,TrainID,lineID,NewSUBWAY):- compatibleTrainLine(TrainID,LineID,SUBWAY), 
    getLine_TrainsSubway(SUBWAY,Line_TrainsBefore), trenNoRepetidosEnLine_TrainsSubway(Line_TrainsBefore,TrainID),
    addLine_TrainsToSubway(Line_TrainsBefore,LineID,TrainID,Line_TrainsAfter), setLine_TrainsSubway(SUBWAY,Line_TrainsAfter,NewSUBWAY).


%verifica compatibilidad entre los rieles de una linea y un tren, mediante la ID de ambos, usa predicados auxiliares findTrainInTrains y findLineInLines
%ademas verifica que el tren y la linea existan en el subway
compatibleTrainLine(TrainID,LineID,SUBWAY):- 
    getTrainsSubway(SUBWAY,TrainsList), findTrainInTrains(TrainsList,TrainID,TrenEncontradoPorID), getRailTypeTrain(TrenEncontradoPorID,RailTypeTrenEncontrado),
    getLinesSubway(SUBWAY,LinesList), findLineInLines(LinesList,LineID,LineaEncontradaPorID), getRailTypeLine(LineaEncontradaPorID,RailTypeLineaEncontrada),
    RailTypeTrenEncontrado == RailTypeLineaEncontrada.

%busca un tren segun la ID en una lista de trenes, en caso de no encontrarlo su valor es false
findTrainInTrains([CurrentTrain|COLA],TrainID,CurrentTrain):- getIdTrain(CurrentTrain,IDTrenActual), IDTrenActual == TrainID.
findTrainInTrains([CurrentTrain|COLA],TrainID,TrainAUX):- getIdTrain(CurrentTrain,IDTrenActual), IDTrenActual \= TrainID, 
    findTrainInTrains(COLA,TrainID,TrainAUX),!.

%busca una linea segun la ID en una lista de lineas, en caso de no encontrarlo su valor es false
findLineInLines([CurrentLine|COLA],LineID,CurrentLine):- getIdLine(CurrentLine,IDLineaActual), IDLineaActual == LineID.
findLineInLines([CurrentLine|COLA],LineID,LineAUX):- getIdLine(CurrentLine,IDLineaActual), IDLineaActual \= LineID,
    findLineInLines(COLA,LineID,LineAUX),!.


%verifica que un tren segun su ID, no este repetido dentro deLine_Trains de un subway, para que no se pueda agregar un tren a dos lineas distintas o un tren repetido
trenNoRepetidosEnLine_TrainsSubway([],_):-!.  %caso base no se encontraron trenes repetidos
trenNoRepetidosEnLine_TrainsSubway([CurrentLINE_TRAINS|COLA],TrainID):- getLastList(CurrentLINE_TRAINS,CurrentTrains), not(member(TrainID,CurrentTrains)),
    trenNoRepetidosEnLine_TrainsSubway(COLA,TrainID).


%añade un elemento Line_train al subway, considerando si la linea ya existia o no en el apartado de Line_trains
addLine_TrainsToSubway([],LineID,TrainID,[LineID,[TrainID]]):-!.    %caso base cuando recorre toda la lista y no existia la linea buscada, se agrega al final

%caso LINE_TRAINS actual SI es el line buscado
addLine_TrainsToSubway([CurrentLINE_TRAINS|COLA],LineID,TrainID,[LineID,ModifiedTrains|COLA]):-
    getFirstList(CurrentLINE_TRAINS,CurrentLineID), CurrentLineID == LineID,
    getLastList(CurrentLINE_TRAINS,CurrentTrains), append(CurrentTrains,[TrainID],ModifiedTrains).

%caso LINE_TRAINS actual NO es el line buscado, caso recursivo
addLine_TrainsToSubway([CurrentLINE_TRAINS|COLA],LineID,TrainID,[CurrentLINE_TRAINS|COLA1]):-
    getFirstList(CurrentLINE_TRAINS,CurrentLineID), CurrentLineID \= LineID, addLine_TrainsToSubway(COLA,LineID,TrainID,COLA1).
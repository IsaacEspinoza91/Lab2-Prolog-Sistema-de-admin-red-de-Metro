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
    IdDriver: Id de un conductor del metro (num)
    LINE_TRAINS: Lista de pares donde el primer elemento es la ID de una linea, 
        y el segundo una lista IDs de trenes asociados a esa linea ([IdLinea, Lista IDs TDAs Train])
    Line_Train: Par [ID de linea, Lista de Ids de trenes]
    HoraPartida: Horario de partida de un tren en el metro en formato HH:MM:SS (string TDA Hora)
    StPartida: Nombre de la estacion de partida de un tren en el metro (string)
    StLlegada: Nombre de la estacion de llegada de un tren en el metro (string)
    DRIVER_TRAIN: Lista de elementos con la siguientes estructura [IdDriver,IdTrain,HoraPartida,StPartida,StLlegada]
    SUBWAY: TDA red de metro (TDA suwbay)
    LIST: Lista de elementos (Lista)
    NameStation: Nombre de una estacion de metro (string)
    StopTime: Tiempo de parada en una estacion (string)
    Sections: Lista de secciones (VAR, Lista TDAs section)
    LINE: TDA linea (TDA Line)
    TRAIN: TDA Tren (TDA Train)
    StringFinal: String de texto (string)
    PCARs: Lista de carros (Lista de TDAs pcars)
    Section: TDA seccion (TDA Section)
    LISTA: Lista con elementos, sin sub listas (lista)
    LISTAS: Lista de sublistas con elementos (lista de sublistas)

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
    subwayAssignTraintoLine(SUBWAY,IdTrain,IdLinea,SUBWAY)
    compatibleTrainLine(IdTrain, IdLinea, SUBWAY)
    findTrainInTrains(TRAINS,IdTrain,TRAIN)
    findLineInLines(LINES,IdTrain,LINE)
    trenNoRepetidosEnLine_TrainsSubway(LINE_TRAINS,IdTrain)
    addLine_TrainsToSubway(LINE_TRAINS,IdLinea,IdTrain,LINE_TRAINS)
    subwayAssignDriverToTrain(SUBWAY, IdDriver, IdTrain, HoraPartida, StPartida, StLlegada, SUBWAY)
    trenExisteEnSubway(SUBWAY,IdTrain)
    driverExisteEnSubway(SUBWAY,IdDriver)
    estacionesExistenEnLineaAsociadaAlTren(SUBWAY,IdTrain,StPartida,StLlegada)
    stationEstaEnSections(Sections,StPartida)       ; o    stationEstaEnSections(Sections,StLlegada)
    findLine_TrainINLine_Trains(LINE_TRAINS,IdTrain,Line_Train)
    subwayToString(SUBWAY, StringFinal)
    trainsToString(TRAINS,StringFinal)
    trenAString(TRAIN,StringFinal)
    pcarsToString(PCARs,StringFinal)
    sectionsToString(Sections,StringFinal)
    seccionAString(Section,StringFinal)
    linesToString(LINES,StringFinal)
    lineaAString(LINE,StringFinal)
    driversToString(DRIVERS,StringFinal)
    line_TrainsToString(LINE_TRAINS,StringFinal)
    line_TrainAString(Line_Train,StringFinal)
    driver_TrainToString(DRIVER_TRAIN,StringFinal)
    convertirListaDeListasAString(LISTAS, StringFinal)
    convertirListaAString(LISTA, StringFinal)

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
    subwayAssignTraintoLine: Asignar un tren a una linea en un subway, si es que existen en el subway y son compatibles segun el tipo de riel
    subwayAssignDriverToTrain: Asignar un recorrido a un conductor en un tren, segun si exite el driver, el train, y si las estaciones son de la linea asignadas al tren
    subwayToString: Convierte todos los datos de un subway a un único string.

METAS SECUNDARIAS:
    listaSinElementosRepetidos: Verificar que una lista no tiene elementos repetidos
    subwayComplete: Constructor de elemento TDA Subway con todos sus parametros
    recorrerLinesModStopTime: Recorre lista de Lines donde a cada uno se aplica recorrerSectionsModStopTime para modificar el StopTime de una station en especifico
    recorrerSectionsModStopTime: Recorre una lista de Sections, modificando el StopTime de una station en especifico
    compatibleTrainLine: Verifica la compatibilidad de Tren y Linea, dado que tengan el mismo tipo de riel
    findTrainInTrains: Busca un tren segun la ID en una lista de trenes, en caso de no encontrarlo su valor es false
    findLineInLines: Busca una linea segun la ID en una lista de lineas, en caso de no encontrarlo su valor es false
    trenNoRepetidosEnLine_TrainsSubway: Verifica que un tren segun su ID, no este repetido dentro de Line_trains de un subway
    addLine_TrainsToSubway: añade un elemento Line_train al subway, considerando si la linea ya existia o no en el apartado de Line_trains
    trenExisteEnSubway: Verifica que un tren exista dentro de un subway segun su ID
    driverExisteEnSubway: Verifica que un driver exista dentro de un suwbay segun su ID
    estacionesExistenEnLineaAsociadaAlTren: Verifica que dos estaciones existan en una linea de un tren asociado segun la ID del tren
    stationEstaEnSections: Verifica que una estacion este dentro de una lista de sectiones segun el nombre de la estacion
    findLine_TrainINLine_Trains: Busca segun la ID de un tren, el elemento Line_Train de un Subway
    trainsToString: Convertir una lista de trenes a un único string
    trenAString: Convertir un unico tren a string
    pcarsToString: Convertir los carros de un tren a un string
    sectionsToString: Convertir una lista de sections a string
    seccionAString: Convertir una unica section a un string
    linesToString: Convertir una lista de lineas a un unico string
    lineaAString: Convertir una linea a sting
    driversToString: Convertir lista de conductores a un string
    line_TrainsToString: Convertir una lista de elementos Line_trains a string
    line_TrainAString: Convertir elemento Line_train a string
    driver_TrainToString: Convertir una lista de elementos driver_train a string
    convertirListaDeListasAString: Convertir una lista de sublistas de elementos a un string
    convertirListaAString: Convertir una lista SIN SUB LISTAS a un string

*/
:-module(tdaSubway,[subway/3,subwayAddTrain/3,subwayAddLine/3,subwayAddDriver/3,getIdSubway/2,getNameSubway/2,getTrainsSubway/2,getLinesSubway/2,getDriversSubway/2,
getDriver_TrainSubway/2,getLine_TrainsSubway/2]).
:-use_module(tdaSection).
:-use_module(tdaStation).
:-use_module(tdaLine).
:-use_module(tdaPcar).
:-use_module(tdaDriver).
:-use_module(tdaTrain).
:-use_module(tdaHora).


%constructor, Funcionalidad 16
subway(ID,NAME,[ID,NAME,[],[],[],[],[]]).
subwayComplete(ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN,[ID,NAME,TRAINS,LINES,DRIVERS,LINE_TRAINS,DRIVER_TRAIN]).



%pertenencia
isSubway(SUBWAY):-subway(_,_,SUBWAY).



%selectores
getIdSubway(SUBWAY,ID):-subwayComplete(ID,_,_,_,_,_,_,SUBWAY).
getNameSubway(SUBWAY,NAME):-subwayComplete(_,NAME,_,_,_,_,_,SUBWAY).
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
subwayToString(SUBWAY, StringFinal):-
    getIdSubway(SUBWAY,IDSub), 
    string_concat("\nDatos del sistema de metro\n ID: ",IDSub, Str1),
    getNameSubway(SUBWAY,NameSub),
    string_concat(Str1,"\n Nombre: ", Str2),
    string_concat(Str2,NameSub, Str3),
    getTrainsSubway(SUBWAY,TrainsSub),
    trainsToString(TrainsSub,StringTrenes), string_concat(Str3, StringTrenes,Str4),
    getLinesSubway(SUBWAY,LinesSub),
    linesToString(LinesSub,StringLineas), string_concat(Str4, StringLineas,Str5),
    getDriversSubway(SUBWAY,DriversSUB),
    driversToString(DriversSUB,StringDrivers), string_concat(Str5, StringDrivers,Str6),
    getLine_TrainsSubway(SUBWAY,Li_TrSUB),
    line_TrainsToString(Li_TrSUB,StringLi_Tr), string_concat(Str6, StringLi_Tr, Str7),
    getDriver_TrainSubway(SUBWAY,Driv_Tr),
    driver_TrainToString(Driv_Tr,StringDriv_Tr), string_concat(Str7, StringDriv_Tr, StringFinal).


%convertir una lista de trenes a un unico string
trainsToString(Trenes,StringFinal):- maplist(trenAString, Trenes, ListaStringTrenes),
    atomic_list_concat(ListaStringTrenes, "\n", St2), string_concat("\n\n Trenes:\n",St2,StringFinal).
%convertir un unico tren a string
trenAString(Tren,StringF):-getIdTrain(Tren,ID),getMakerTrain(Tren,Maker),getRailTypeTrain(Tren,RailT),getSpeedTrain(Tren,Speed),getPCARsTrain(Tren,Pcars),
    string_concat("   Id Tren: ",ID, St1), string_concat("   Fabricante: ", Maker, St2), string_concat("   Tipo de riel: ",RailT, St3),
    string_concat("   Rapidez km/h: ",Speed, St4), pcarsToString(Pcars, St5),
    convertirListaAString([St1,St2,St3,St4,St5,"\n"],StringF).
%convertir los carros de un tren a un string
pcarsToString(ListaPcars,StringF):-string_concat("\n   ","Carros (Id carro, Capacidad de pasajeros, Modelo carro, Tipo carro):\n     ",StringInicio),
    convertirListaDeListasAString(ListaPcars,StringPcars), string_concat(StringInicio, StringPcars, StringF).


%convertir una lista de sections a string
sectionsToString(Sections,StringF):- maplist(seccionAString, Sections, ListaStringSections),
    atomic_list_concat(ListaStringSections, "\n",StringSections), string_concat("\n   Secciones de la linea:  estructura de estaciones->([ID, Nombre, Tipo,Tiempo de Parada])\n", StringSections, StringF).
%convertir una unica section a un string
seccionAString(Section,StringF):- getStation1Section(Section,Station1), convertirListaAString(Station1, StringStation1),
    string_concat("     Estacion 1: ", StringStation1, St1),
    getStation2Section(Section, Station2), convertirListaAString(Station2, StringStation2),
    string_concat("   Estacion 2: ", StringStation2, St2),
    getDistanceSection(Section, Dis), string_concat("   Distancia Km: ", Dis, St3),
    getCostSection(Section, Cost),    string_concat("   Costo: ",Cost, St4),
    convertirListaAString([St1,St2,St3,St4],StringF).


%convertir una lista de lineas a un unico string
linesToString(Lineas,StringFinal):- maplist(lineaAString, Lineas, ListaStringLineas),
    atomic_list_concat(ListaStringLineas, "\n", String), string_concat("\n\n Lineas:\n",String,StringFinal).
%convertir una linea a sting
lineaAString(Linea,StringF):-getIdLine(Linea,ID), getNameLine(Linea,Name), getRailTypeLine(Linea,RailT),getSectionsLine(Linea,Sections),
    string_concat("   Id Linea: ",ID, St1), string_concat("\n   Nombre: ",Name,St2), string_concat("\n   Tipo de riel: ",RailT,St3),
    sectionsToString(Sections,St4),  convertirListaAString([St1,St2,St3,St4,"\n"],StringF).


%convertir lista de conductores a un string
driversToString(DriversSub,StringF):-string_concat("\n\n"," Conductores del metro: \n     ",StringInicio),
    convertirListaDeListasAString(DriversSub,StringDrivers), string_concat(StringInicio, StringDrivers, StringF).


%convertir una lista de elementos Line_trains a string
line_TrainsToString(ListaLine_Trains,StringFinal):-maplist(line_TrainAString, ListaLine_Trains, ListaStringLi_Tr),
    atomic_list_concat(ListaStringLi_Tr, "\n",String), string_concat("\n\n Asignaciones Linea-Tren: \n",String,StringFinal).
%convertir elemento Line_train a string
line_TrainAString([IDLinea,ListaIDsTrenes],StringF):-string_concat("   Linea con ID: ",IDLinea, St1), 
    convertirListaAString(ListaIDsTrenes,StringIDsTrenes), string_concat("         ,se asignan trenes con IDs: ",StringIDsTrenes ,St2),
    string_concat(St1,St2,StringF).


%convertir una lista de elementos driver_train a string
driver_TrainToString(Driver_Train,StringF):-string_concat("\n\n"," Asignaciones Conductor-Tren: (ID conductor, ID de tren, HoraPartida, Estacion de partida, Estacion de Llegada)\n     ",StringInicio),
    convertirListaDeListasAString(Driver_Train,StringDriver_train), string_concat(StringInicio, StringDriver_train, StringF).


%convertir una lista de sublistas de elementos a un string
convertirListaDeListasAString(LISTAS, StringF):-
    maplist(convertirListaAString, LISTAS, ListaDeString1Elemento),
    atomic_list_concat(ListaDeString1Elemento, "\n     ", StringF).
%convertir una lista SIN SUB LISTAS a un string
convertirListaAString(LISTA, StringF):- atomic_list_concat(LISTA, ', ', StringF).





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
subwayAssignTraintoLine(SUBWAY,IDTren,IDLinea,NuevoSUBWAY):- 
    compatibleTrainLine(IDTren, IDLinea, SUBWAY),
    getLine_TrainsSubway(SUBWAY, LineTrainsBefore), trenNoRepetidosEnLine_TrainsSubway(LineTrainsBefore, IDTren),
    addLine_TrainsToSubway(LineTrainsBefore, IDLinea, IDTren, LineTrainsAfter),
    setLine_TrainsSubway(SUBWAY, LineTrainsAfter, NuevoSUBWAY).


%verifica compatibilidad entre los rieles de una linea y un tren, mediante la ID de ambos, usa predicados auxiliares findTrainInTrains y findLineInLines
%ademas verifica que el tren y la linea existan en el subway
compatibleTrainLine(TrainID,LineID,SUBWAY):- 
    getTrainsSubway(SUBWAY,TrainsList), findTrainInTrains(TrainsList,TrainID,TrenEncontradoPorID), getRailTypeTrain(TrenEncontradoPorID,RailTypeTrenEncontrado),
    getLinesSubway(SUBWAY,LinesList), findLineInLines(LinesList,LineID,LineaEncontradaPorID), getRailTypeLine(LineaEncontradaPorID,RailTypeLineaEncontrada),
    RailTypeTrenEncontrado == RailTypeLineaEncontrada.

%busca un tren segun la ID en una lista de trenes, en caso de no encontrarlo su valor es false
findTrainInTrains([CurrentTrain|_],TrainID,CurrentTrain):- getIdTrain(CurrentTrain,IDTrenActual), IDTrenActual == TrainID.
findTrainInTrains([CurrentTrain|COLA],TrainID,TrainAUX):- getIdTrain(CurrentTrain,IDTrenActual), IDTrenActual \= TrainID, 
    findTrainInTrains(COLA,TrainID,TrainAUX),!.
%busca una linea segun la ID en una lista de lineas, en caso de no encontrarlo su valor es false
findLineInLines([CurrentLine|_],LineID,CurrentLine):- getIdLine(CurrentLine,IDLineaActual), IDLineaActual == LineID.
findLineInLines([CurrentLine|COLA],LineID,LineAUX):- getIdLine(CurrentLine,IDLineaActual), IDLineaActual \= LineID,
    findLineInLines(COLA,LineID,LineAUX),!.


%verifica que un tren segun su ID, no este repetido dentro deLine_Trains de un subway, para que no se pueda agregar un tren a dos lineas distintas o un tren repetido
trenNoRepetidosEnLine_TrainsSubway([],_):-!.  %caso base no se encontraron trenes repetidos
trenNoRepetidosEnLine_TrainsSubway([CurrentLINE_TRAINS|COLA],TrainID):- getLastList(CurrentLINE_TRAINS,CurrentTrains), not(member(TrainID,CurrentTrains)),
    trenNoRepetidosEnLine_TrainsSubway(COLA,TrainID).


%añade un elemento Line_train al subway, considerando si la linea ya existia o no en el apartado de Line_trains
addLine_TrainsToSubway([],LineID,TrainID,[[LineID,[TrainID]]]):-!.    %caso base cuando recorre toda la lista y no existia la linea buscada, se agrega al final
%caso LINE_TRAINS actual SI es el line buscado
addLine_TrainsToSubway([CurrentLINE_TRAINS|COLA],LineID,TrainID,[[LineID,ModifiedTrains]|COLA]):-
    getFirstList(CurrentLINE_TRAINS,CurrentLineID), CurrentLineID == LineID,
    getLastList(CurrentLINE_TRAINS,CurrentTrains), append(CurrentTrains,[TrainID],ModifiedTrains).
%caso LINE_TRAINS actual NO es el line buscado, caso recursivo
addLine_TrainsToSubway([CurrentLINE_TRAINS|COLA],LineID,TrainID,[CurrentLINE_TRAINS|COLA1]):-
    getFirstList(CurrentLINE_TRAINS,CurrentLineID), CurrentLineID \= LineID, addLine_TrainsToSubway(COLA,LineID,TrainID,COLA1).






/* Funcionalidad 23 */
subwayAssignDriverToTrain(SUBWAY, DriverID, TrainID, DepartureTime, DepartureStation, ArrivalStation, NewSUBWAY):-
    trenExisteEnSubway(SUBWAY, TrainID), driverExisteEnSubway(SUBWAY, DriverID),  %verificaciones de tern y de conductor
    estacionesExistenEnLineaAsociadaAlTren(SUBWAY, TrainID, DepartureStation, ArrivalStation),
    getDriver_TrainSubway(SUBWAY, DRIVER_TRAINList),
    append(DRIVER_TRAINList, [[DriverID, TrainID, DepartureTime, DepartureStation, ArrivalStation]], DRIVER_TRAINListAfter),
    setDriver_TrainSubway(SUBWAY, DRIVER_TRAINListAfter, NewSUBWAY).


%verifica que un tren exista dentro de un subway segun su ID
trenExisteEnSubway(SUBWAY,TrainID):-getTrainsSubway(SUBWAY,TrenesSubway),member([TrainID,_,_,_,_],TrenesSubway).


%verifica que un conductor exista dentro de un subway segun su ID
driverExisteEnSubway(SUBWAY,DriverID):-getDriversSubway(SUBWAY,DriversSubway),member([DriverID,_,_],DriversSubway).


%verifica que dos estaciones existan en una linea, tal que esta linea este asociada a un tren en especifico, mediante la ID del tren mencionado
estacionesExistenEnLineaAsociadaAlTren(SUBWAY,TrainID,NombreSt1,NombreSt2):-
    getLine_TrainsSubway(SUBWAY,Line_TrainsSUBWAY), findLine_TrainINLine_Trains(Line_TrainsSUBWAY, TrainID, Line_TrainEncontrado),
    getFirstList(Line_TrainEncontrado, LineaID),  %el primer elemento del Line_Train encontrado es la ID de la linea
    getLinesSubway(SUBWAY, LinesSubway), findLineInLines(LinesSubway, LineaID, LineEncontrada),  
    getSectionsLine(LineEncontrada, SectionsLineEncontrada),   %se verifica que las estaciones sean efectivamente de la ID de la linea encontrada
    stationEstaEnSections(SectionsLineEncontrada, NombreSt1), stationEstaEnSections(SectionsLineEncontrada, NombreSt2).


%verifica que una estacion esta dentro de una lista de sections segun su nombre
stationEstaEnSections(Sections,NombreStation):-member([[_,NombreStation,_,_],_,_,_],Sections),!. %la estacion existe como st1
stationEstaEnSections(Sections,NombreStation):-member([_,[_,NombreStation,_,_],_,_],Sections),!. %la estacion existe como st2


%busca segun la id de un tren, un el elemento Line_Train de un SUBWAY; si no encuentra el tren, el valor es falso
findLine_TrainINLine_Trains([CurrentLINE_TRAINS|_],IDTrain,CurrentLINE_TRAINS):- getLastList(CurrentLINE_TRAINS, TrenesAsigancionActual),
    member(IDTrain,TrenesAsigancionActual),!.
findLine_TrainINLine_Trains([CurrentLINE_TRAINS|COLA],IDTrain,AUX):- getLastList(CurrentLINE_TRAINS, TrenesAsigancionActual),
    not(member(IDTrain,TrenesAsigancionActual)), findLine_TrainINLine_Trains(COLA,IDTrain,AUX),!.






/* Funcionalidad 24*/
%caso sentido normal de recorrido
whereIsTrain(SUBWAY,TrainID,TiempoPreguntado,NombreStationOut):-
    getDriver_TrainSubway(SUBWAY,Drivers_Trains),findEleDriver_TrainByTrainID(Drivers_Trains,TrainID,TiempoPartida,EstacionInicio,EstacionFin),
    diferenciaDeHorasEnSS(TiempoPartida,TiempoPreguntado,DiferenciaTiemposEnSS),          %obtener diferencia de tiempos en Segundos
    getTrainsSubway(SUBWAY,TrenesSUB), findTrainInTrains(TrenesSUB,TrainID,Tren), getSpeedTrain(Tren,RapidezTrenKmH),              %obtener rapidez del tren
    getLine_TrainsSubway(SUBWAY,Line_TrainsSUBWAY),
    findLine_TrainINLine_Trains(Line_TrainsSUBWAY, TrainID, Line_TrainEncontrado), getFirstList(Line_TrainEncontrado, LineID),%encontrar id linea segun id tren en line_trains
    getLinesSubway(SUBWAY,Lineas), findLineInLines(Lineas,LineID,LineaEncontrada),          %obtener linea buscada dentro del subway
    getSectionsLine(LineaEncontrada,ListaSections),
    getSubListaSections(ListaSections,EstacionInicio,EstacionFin,SectionsDelTramoDelRecorrido), %retorna la sub lista entre estaciones, da igual cual sale primero. 
    sentidoNormalDeRecorrido(SectionsDelTramoDelRecorrido, EstacionInicio),    %condicion de que es sentido normal de recorrido, en que caso de que falle, se intenta con sentido inverso en otro predicado
    recorrerSectionsHastaLlegar(SectionsDelTramoDelRecorrido, RapidezTrenKmH, DiferenciaTiemposEnSS, NombreStationOut),!.

%caso sentido inverso de recorrido
whereIsTrain(SUBWAY,TrainID,TiempoPreguntado,NombreStationOut):-
    getDriver_TrainSubway(SUBWAY,Drivers_Trains),findEleDriver_TrainByTrainID(Drivers_Trains,TrainID,TiempoPartida,EstacionInicio,EstacionFin),
    diferenciaDeHorasEnSS(TiempoPartida,TiempoPreguntado,DiferenciaTiemposEnSS),          %obtener diferencia de tiempos en Segundos
    getTrainsSubway(SUBWAY,TrenesSUB), findTrainInTrains(TrenesSUB,TrainID,Tren), getSpeedTrain(Tren,RapidezTrenKmH),              %obtener rapidez del tren
    getLine_TrainsSubway(SUBWAY,Line_TrainsSUBWAY),
    findLine_TrainINLine_Trains(Line_TrainsSUBWAY, TrainID, Line_TrainEncontrado), getFirstList(Line_TrainEncontrado, LineID),%encontrar id linea segun id tren en line_trains
    getLinesSubway(SUBWAY,Lineas), findLineInLines(Lineas,LineID,LineaEncontrada),          %obtener linea buscada dentro del subway
    getSectionsLine(LineaEncontrada,ListaSections),
    getSubListaSections(ListaSections,EstacionInicio,EstacionFin,SectionsDelTramoDelRecorrido),
    recorridoInversoDeSections(SectionsDelTramoDelRecorrido, SectionsParaRecorridoInverso),   %como sabemos que es SENTIDO INVERSO, se invierte las secciones y las estaciones
    recorrerSectionsHastaLlegar(SectionsParaRecorridoInverso, RapidezTrenKmH, DiferenciaTiemposEnSS, NombreStationOut).


%verifica que una lista de secciones tenga sentido normal de recorrido
sentidoNormalDeRecorrido([[NombreST1,_,_,_]|_],NombreST1).


%encuentra elementos tiempo partida, estacion partida y estacion llegada dentro de una lista de Driver_trains en un 1ERA ocurrencia. En caso de no encontrar, el valor es false
findEleDriver_TrainByTrainID([[_,TrainID,TiempoPartida,EstacionPartida,EstacionLlegada]|_],TrainID,TiempoPartida,EstacionPartida,EstacionLlegada):-!. %caso base
findEleDriver_TrainByTrainID([[_,ActTrainID,_,_,_]|COLA],TrainID,TiempoPartida,EstacionPartida,EstacionLlegada):-
    ActTrainID \= TrainID, findEleDriver_TrainByTrainID(COLA,TrainID,TiempoPartida,EstacionPartida,EstacionLlegada). %caso recursivo


%invertir las secciones de una lista, talque ahora la estacion1 este en el lugar de la estacion 2 (y viceversa) de cada section
recorridoInversoDeSections(Secciones,SeccionesSALIDA):-reverse(Secciones,SeccionesAUX),invertirStationsEnSections(SeccionesAUX,SeccionesSALIDA).
%invertir las estaciones de lugar en un lista de sections
invertirStationsEnSections([],[]).
invertirStationsEnSections([[ST1,ST2,DIS,COST]|COLA],[[ST2,ST1,DIS,COST]|COLA1]):-invertirStationsEnSections(COLA,COLA1).


%CASO Especial en donde la primera seccion ya supera el tiempo limite. Se retorna el nombre de Station1
recorrerSectionsHastaLlegar([[[_,NombreStLimite,_,TiempoParadaInicialSt1],_,DistanciaSection,_]|+],RapidezTrenKmH,TiempoLimite,NombreStLimite):-
    TiempoSection is ((DistanciaSection/RapidezTrenKmH)*3600), TiempoACUM is (TiempoSection+TiempoParadaInicialSt1),
    TiempoACUM > TiempoLimite.
%Caso de encapsulacion para hacer la recursion
recorrerSectionsHastaLlegar([[[_,_,_,TiempoParadaInicialSt1],[_,_,_,TiempoParadaInicialSt2],DistanciaSection,_]|COLA],RapidezTrenKmH,TiempoLimite,NombreStLimite):- 
    TiempoSection1 is ((DistanciaSection/RapidezTrenKmH)*3600), TiempoACUM is (TiempoSection1+TiempoParadaInicialSt1+TiempoParadaInicialSt2),
    recorrerSectionsHastaLlegar(COLA, RapidezTrenKmH, TiempoACUM, TiempoLimite,NombreStLimite),!.
%Casos base
recorrerSectionsHastaLlegar([[_,[_,NombreStation,_,_],_,_]|[]],_,_,_,NombreStation). % caso base en que se acabo el recorrido del tren y todavia no se superaba el tiempo limite preguntado
recorrerSectionsHastaLlegar([[[_,NombreStation,_,_],_,_,_]|_],_,_,_,NombreStation). %caso base
%caso recursivo
recorrerSectionsHastaLlegar([[_,[_,_,_,TiempoParadaSt2],DistanciaSection,_]|COLA], RapidezTrenKmH, TiempoACUM, TiempoLimite, NombreST):-
    TiempoSection is ((DistanciaSection/RapidezTrenKmH)*3600),
    TiempoActualACUM is (TiempoACUM+TiempoParadaSt2+TiempoSection), TiempoActualACUM =< TiempoLimite,
    recorrerSectionsHastaLlegar(COLA, RapidezTrenKmH, TiempoActualACUM, TiempoLimite, NombreST).

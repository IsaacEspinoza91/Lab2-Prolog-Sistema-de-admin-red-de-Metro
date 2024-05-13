/* TDA Line
Estructura de lista de elementos [ID,NOM,RailT,Sections]
DOM:
    ID: Id de la linea (num)
	NOM: Nombre de la linea (string)
	RailT: Tipo de riel de la linea (string)
	Sections: Lista de TDAs Section (Lista de VAR TDAs Section) *puede ser lista vacia en un inicio*
    LINE: TDA linea de metro (VAR)
    LENGTH: largo de line| cantidad de estaciones (VAR)
    DIS: distancia de line (VAR)
    COS: costo de line (VAR)
    Section: TDA section (VAR TDA Section)
    LIS: lista de elementos (Lista)
    Largo: largo de la lista (VAR, num)
    DistanceSections: distancia de una lista de secciones (VAR, num)
    CostoSections: costo de una lista de secciones (VAR, num)
    NombreStation: nombre de una estacion (string)
    SectionsSubPath: secciones de un tramo de las secciones de la linea (VAR)
    ELE: elemento x de una lista (cualquier tipo de dato)

PREDICADOS:
	line(ID,NOM,RailT,Sections,LINE)
    isLineWithoutVerifications(LINE)
    getIdLine(LINE,ID)
    getNameLine(LINE,NOM)
    getRailTypeLine(LINE,RailT)
    getSectionsLine(LINE,SECTIONS)
    setIdLine(LINE,ID,LINE)
    setNameLine(LINE,NOM,LINE)
    setRailType(LINE,RailT,LINE)
    setSections(LINE,RailT,LINE)
    lineLength(LINE,LENGTH,DIS,COS)
    addSectionToSections(Sections,Section,Sections)
    largoLista(LIS,Largo)
    distanciaTotal(Sections,DistanceSections)
    costoTotal(Sections,CostSections)
    lineSectionLength(LINE,NombreStation,NombreStation,SectionsSubPath,DistanceSections,CostoSections)
    getSubListaSections(Sections,NombreStation,NombreStation,Sections)
    lineAddSection(LINE, Section, LINE)
    listaVacia(LIS)
    checkSections(Sections)
    checkAllSectionsConnected(Sections)
    normalLine(Sections)
    circularLine(Sections)
    getFirstList(LIS,ELE)
    getLastList(LIS,ELE)

METAS PRIMARIAS:
	line: Relacionar elementos de una line en una variable
    isLineWithoutVerifications: Verificar line sin verificaciones de compatibilidad de sections
    getIdLine: Id de una line
    getNameLine: Name de una line
    getRailTypeLine: RailTpe de una line
    getSectionsLine: Lista de Sections de una line
    setIdLine: Line con nueva Id
    setNameLine: Line con nuevo nombre
    setRailType: Line con nuevo RailType
    setSections: Line con nuevas Sections
    lineLength: Datos largo, distancia, costo de linea
    lineSectionLength: Datos distancia y costo de un sub tramo de las secciones de una linea
    lineAddSection: Linea con una sections especificada agregada al final de sections, dado que esta no este repetida

METAS SECUNDARIAS:
    largoLista: numero de elementos de una lista
    distanciaTotal: distancia de una lista de sections
    costoTotal: costo de una lista de sections
    addSectionToSections: añade una seccion al final de la lista de secciones
    member: verificar si un elementos esta en una lista
    getSubListaSections: Sublista de secciones entre dos sections especificadas dados sus nombres
    listaVacia: verifica si una lista es lista vacia
    checkSections: determina si los elementos de una lista son efectivamente del tipo TDA section
    chekAllStationConnected: verifica que todas las sections esten conectadas, es decir, que de una se pueda llegar a todas.
    normalLine: deterna si las sections de una linea cumplen criterio linea normal, es decir, la primera st1 y la ultima st2 son tipo "t"
    circularLine: determina si las sections de una linea cumplen criterio linea circular, es decir, la priemra st1 y la ultima st2 son la misma
    getFirstList: selector primer elemento de una lista
    getLastList: selector ultimo elemento de una lista

*/
:-module(tdaLine,[getRailTypeLine/2]).
:-use_module(tdaSection).
:-use_module(tdaStation).



%constructor, Funcionalidad 4
line(ID,Nombre,RailType,Sections,[ID,Nombre,RailType,Sections]).



%pertenecia
isLineWithoutVerifications(LINE):-line(_,_,_,_,LINE).



%selectores
getIdLine(LINE,ID):-line(ID,_,_,_,LINE).
getNameLine(LINE,Name):-line(_,Name,_,_,LINE).
getRailTypeLine(LINE,RailT):-line(_,_,RailT,_,LINE).
getSectionsLine(LINE,SECTIONS):-line(_,_,_,SECTIONS,LINE).



%modificadores
setIdLine(LINE,NewID,NewLINE):-line(_,NOM,RT,Sects,LINE),line(NewID,NOM,RT,Sects,NewLINE).
setNameLine(LINE,NewNOM,NewLINE):-line(ID,_,RT,Sects,LINE),line(ID,NewNOM,RT,Sects,NewLINE).
setRailTypeLine(LINE,NewRT,NewLINE):-line(ID,NOM,_,Sects,LINE),line(ID,NOM,NewRT,Sects,NewLINE).
setSectionsLine(LINE,NewSects,NewLINE):-line(ID,NOM,RT,_,LINE),line(ID,NOM,RT,NewSects,NewLINE).



%OTROS PREDICADOS
addSectionToSections(Secciones,NewSeccion,NewSecciones):-append(Secciones,[NewSeccion],NewSecciones).




/*Funcionalidad 5 */
lineLength(LINE,LENGTH,Distancia,Costo):-line(_,_,_,Sections,LINE),largoLista(Sections,LENGTH),distanciaTotal(Sections,Distancia),costoTotal(Sections,Costo).

%obtener cantidad de elementos de una lista
largoLista([],0):-!.
largoLista([_|Y],R):-largoLista(Y,R1),R is R1+1.

%obtener la distancia total de los elementos de una lista de sections
distanciaTotal([],0):-!.
distanciaTotal([X|Y],T):-getDistanceSection(X,DIS),distanciaTotal(Y,T1),T is T1+DIS. % getDistanceSection es del TDA section

%obtener el costo total de los elementos de una lista de sections
costoTotal([],0):-!.
costoTotal([X|Y],T):-getCostSection(X,COS),costoTotal(Y,T1),T is T1+COS. %getCostSection es del TDA section




/*Funcionalidad 6 */
lineSectionLength(LINE,NombreST1,NombreST2,Sections,Distancia,Costo):-line(_,_,_,ListaSections,LINE),getSubListaSections(ListaSections,NombreST1,NombreST2,Sections),
    distanciaTotal(Sections,Distancia),costoTotal(Sections,Costo).

%obtener sub lista de secciones entre dos secciones especificas, notamos los predicados para los casos en que se encuentre cualquiera de los dos stations primero
getSubListaSections(Lista,N1,N2,Sub):-
    append(_,[[[ID, N1, T, Stop],St2,Dis,Cost]|Cola],Lista),
    append(Sub,[[[_, N2, _, _],_,_,_]|_],[[[ID, N1, T, Stop],St2,Dis,Cost]|Cola]),!.
%caso en que la station2 este primero que la station1 en la lista de sections
getSubListaSections(Lista,N1,N2,Sub):-
    append(_,[[[ID, N2, T, Stop],St2,Dis,Cost]|Cola],Lista),%ojo, agregamos el anterior a la st segunda, porque en el anterior termina esta, y así no consideramos el tramo extra
    append(Sub,[[[_, N1, _, _],_,_,_]|_],[[[ID, N2, T, Stop],St2,Dis,Cost]|Cola]),!.




/*Funcionalidad 7 */
lineAddSection(LineBefore, Section, LineAfter):-line(ID,Name,RT,SectionsBefore,LineBefore), not(member(Section,SectionsBefore)), % con not member verificamos tramos no repetidos.
    addSectionToSections(SectionsBefore,Section,SectionsAfter), line(ID,Name,RT,SectionsAfter,LineAfter).
%recordar que si la seccion esta repetida, retorna false, por lo que se cae la conjuncion de predicados en el script de pruebas




/* Funcionalidad 8 */
isLine(LINE):- line(ID,NombreL,RTL,SectionsL,LINE), number(ID), string(NombreL), string(RTL), checkSections(SectionsL),
    normalLine(SectionsL), checkAllStationsConnected(SectionsL),!. %caso linea normal
isLine(LINE):- line(ID,NombreL,RTL,SectionsL,LINE), number(ID), string(NombreL), string(RTL), checkSections(SectionsL),
    circularLine(SectionsL), checkAllStationsConnected(SectionsL),!. %caso linea cirucular


% determina si los elementos de una lista son efectivamente del tipo TDA section
checkSections(Secciones):-not(listaVacia(Secciones)),checkSectionsAux(Secciones),!. %verifica que la linea efectivamente tenga secciones
checkSectionsAux([]).
checkSectionsAux([Act|Cola]):-isSection(Act),checkSectionsAux(Cola).

%verifica si una lista es lista vacia
listaVacia([]).

%verifica que de una estacion se puede llegar a todas las demas estaciones de una lista de secciones, recordar que sections tiene las secciones ordenadas en un sentido de recorrido
%comparacion entre el nombre de la seccion anterior y la actual (st2 y st1), por lo que partimos del segundo elementos, para poder considerar el anterior 1
checkAllStationsConnected([Actual|COLA]):-getStation2Section(Actual,St2Actual),checkAllStationsConnected(COLA,St2Actual),!. %notamos el uso de el mismo predicado pero con distinta aridad (especie de anidacion)
checkAllStationsConnected([],_):-!.
checkAllStationsConnected([Actual|COLA],St2Anterior):- getStation1Section(Actual,St1Actual), getStation2Section(Actual,St2Actual),
    St1Actual == St2Anterior, checkAllStationsConnected(COLA,St2Actual). %notamos la utilizacion de selectores del TDA section

%determina si las secciones de una linea cumplen para ser ser linea normal, esto quiere decir que sus estaciones terminales son tipo t
normalLine(Sections):-getFirstList(Sections,FirstSections),getLastList(Sections,LastSection),getStation1Section(FirstSections,FirstStation),
    getStation2Section(LastSection,LastStation),getTypeStation(FirstStation,TypeFirtStation),getTypeStation(LastStation,TypeLastStation),
    TypeFirtStation == "t", TypeLastStation == "t".   % usamos selectores TDSA station

%determina si las secciones de una linea cumplen para ser linea circular, es decir, la primera st1 y ultima st2 son la misma
circularLine(Sections):-getFirstList(Sections,FirstSections),getLastList(Sections,LastSection),getStation1Section(FirstSections,FirstStation),
    getStation2Section(LastSection,LastStation),FirstStation == LastStation.   % usamos selectores TDSA station

%selector primer elemento de una lista
getFirstList([X|_],X).
%selector ultimo elemento de una lista
getLastList(LIST,X):-reverse(LIST,[X|_]).


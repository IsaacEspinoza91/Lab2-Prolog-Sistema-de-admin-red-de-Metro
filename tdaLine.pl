/* TDA Line
Estructura de lista de elementos [ID,NOM,RailT,Sections]
DOM:    ID: Ide de la linea (num)
		NOM: Nombre de la linea (string)
		RailT: Tipo de riel de la linea (string)
		Sections: Lista de TDAs Section (Lista de VAR TDAs Section) *puede ser lista vacia en un inicio*
        LINE: TDA linea de metro (VAR)
        LENGTH: largo de line| cantidad de estaciones (VAR)
        DIS: distancia de line (VAR)
        COS: costo de line (VAR)

PREDICADOS:
	line(ID,NOM,RailT,Sections,LINE)
    isLine(LINE)
    getIdLine(LINE,ID)
    getNameLine(LINE,NOM)
    getRailTypeLine(LINE,RailT)
    getSectionsLine(LINE,SECTIONS)
    setIdLine(LINE,ID,LINE)
    setNameLine(LINE,NOM,LINE)
    setRailType(LINE,RailT,LINE)
    setSections(LINE,RailT,LINE)
    lineLength(LINE,LENGTH,DIS,COS)

METAS:
	line: Relacionar elementos de una line en una variable
    isLine: Verificar line
    getIdLine: Id de una line
    getNameLine: Name de una line
    getRailTypeLine: RailTpe de una line
    getSectionsLine: Lista de Sections de una line
    setIdLine: Line con nueva Id
    setNameLine: Line con nuevo nombre
    setRailType: Line con nuevo RailType
    setSections: Line con nuevas Sections
    lineLength: Datos largo, distancia, costo de linea

METAS SECUNDARIAS:
    largoLista: numero de elementos de una lista
    distanciaTotal: distancia de una lista de sections
    costoTotal: costo de una lista de sections
*/
:-use_module(tdaSection).
:-use_module(tdaStation).

%constructor
line(ID,Nombre,RailType,Sections,[ID,Nombre,RailType,Sections]).

%pertenecia
%isLine(LINE):-line(_,_,_,_,LINE).

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

%otros predicados
addSectionToSections(Secciones,NewSeccion,NewSecciones):-append(Secciones,[NewSeccion],NewSecciones).

/*Funcionalidad 5 */
lineLength(LINE,LENGTH,Distancia,Costo):-line(_,_,_,Sections,LINE),largoLista(Sections,LENGTH),distanciaTotal(Sections,Distancia),costoTotal(Sections,Costo).






largoLista([],0):-!.
largoLista([_|Y],R):-largoLista(Y,R1),R is R1+1.

distanciaTotal([],0):-!.
distanciaTotal([X|Y],T):-getDistanceSection(X,DIS),distanciaTotal(Y,T1),T is T1+DIS.

costoTotal([],0):-!.
costoTotal([X|Y],T):-getCostSection(X,COS),costoTotal(Y,T1),T is T1+COS.






/*Funcionalidad 6 */
lineSectionLength(LINE,NombreST1,NombreST2,Sections,Distancia,Costo):-line(_,_,_,ListaSections,LINE),getSubListaSections(ListaSections,NombreST1,NombreST2,Sections),
    distanciaTotal(Sections,Distancia),costoTotal(Sections,Costo).


getSubListaSections(Lista,N1,N2,Sub):-
    append(_,[[[ID, N1, T, Stop],St2,Dis,Cost]|Cola],Lista),
    append(Sub,[[[_, N2, _, _],_,_,_]|_],[[[ID, N1, T, Stop],St2,Dis,Cost]|Cola]),!.
%caso en que la station2 este primero que la station1 en la lista de sections
getSubListaSections(Lista,N1,N2,Sub):-
    append(_,[[[ID, N2, T, Stop],St2,Dis,Cost]|Cola],Lista),%ojo, notamos que agregamos el anterior a st segunda, porque en el anterior termina esta,y así no consideramos el tramo extra
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
checkSections([]).
checkSections([Act|Cola]):-isSection(Act),checkSections(Cola),!.


%verifica que de una estacion se puede llegar a todas las demas estaciones de una lista de secciones, recordar que sections tiene las secciones ordenadas en un sentido de recorrido
%comparacion entre el nombre de la seccion anterior y la actual (st2 y st1), por lo que partimos del segundo elementos, para poder considerar el anterior 1
checkAllStationsConnected([[_,St2Actual,_,_]|COLA]):-checkAllStationsConnected(COLA,St2Actual),!. %notamos el uso de el mismo predicado pero con distinta aridad (especie de anidacion)
checkAllStationsConnected([],_):-!.
checkAllStationsConnected([[St1Actual,St2Actual,_,_]|COLA],St2Anterior):- St1Actual == St2Anterior, checkAllStationsConnected(COLA,St2Actual).



%determina si las secciones de una linea cumplen para ser ser linea normal, esto quiere decir que sus estaciones terminales son tipo t
normalLine(Sections):-getFirstList(Sections,[[_,_,"t",_],_,_,_]), getLastList(Sections,[_,[_,_,"t",_],_,_]).

%determina si las secciones de una linea cumplen para ser linea circular, es decir, la primera st1 y ultima st2 son la misma
circularLine(Sections):-getFirstList(Sections,[StationPivote,_,_,_]), getLastList(Sections,[_,StationPivote,_,_]).

%selector primer elemento de una lista
getFirstList([X|_],X).
%selector ultimo elemento de una lista
getLastList(LIST,X):-reverse(LIST,[X|_]).
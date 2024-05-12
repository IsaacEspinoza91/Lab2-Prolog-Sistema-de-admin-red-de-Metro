/* TDA Line
Estructura de lista de elementos [ID,NOM,RailT,Sections]
DOM:    ID: Ide de la linea (num)
		NOM: Nombre de la linea (string)
		RailT: Tipo de riel de la linea (string)
		Sections: Lista de TDAs Section (Lista de VAR TDAs Section) *puede ser lista vacia en un inicio*
        LINE: TDA linea de metro (VAR)

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
*/
:-use_module(tdaSection).
:-use_module(tdaStation).

%constructor
line(ID,Nombre,RailType,Sections,[ID,Nombre,RailType,Sections]).

%pertenecia
isLine(LINE):-line(_,_,_,_,LINE).

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
lineLength(LINE,LENGTH,Distancia,Costo):-line(_,_,_,Sections,LINE),largoLista(Sections,LENGTH),distanciaTotal(Sections,Distancia),costoTotal(Sections,Costo).


largoLista([],0):-!.
largoLista([_|Y],R):-largoLista(Y,R1),R is R1+1.

distanciaTotal([],0):-!.
distanciaTotal([X|Y],T):-getDistanceSection(X,DIS),distanciaTotal(Y,T1),T is T1+DIS.

costoTotal([],0):-!.
costoTotal([X|Y],T):-getCostSection(X,COS),costoTotal(Y,T1),T is T1+COS.

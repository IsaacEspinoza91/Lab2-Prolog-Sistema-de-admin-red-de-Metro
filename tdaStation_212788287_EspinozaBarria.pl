/* TDA STATION
Estrucura de lista de elementos [ID,Nombre,Tipo,StopTime]
DOM:    ID: numero de estacion (num)
		Nombre: nombre de estacion (string)
        Tipo: tipo de estacion (string de una letra {r: regular, m: mantencion, c: combinacion, t: terminal})
        StopTime: tiempo de parada del tren en la estacion (num >0)
        ESTACION: TDA estacion de metro (VAR)

PREDICADOS:
	station(ID,Nombre,Tipo,StopTime,ESTACION)
    getIdStation(ESTACION,ID)
    getNameStation(ESTACION,Nombre)
    getTypeStation(ESTACION,Tipo)
    getStopTimeStation(ESTACION,StopTime)
    setIdStation(ESTACION,ID,ESTACION)
    setNameStayion(ESTACION,Nombre,ESTACION)
    setTypeStation(ESTACION,Tipo,ESTACION)
    setStopTimeStation(ESTACION,StopTime,ESTACION)
    isStation(ESTACION)

METAS PRIMARIAS:
	station: relacionar elementos de una estacion en una Variable
    isStation: Verificar estacion
    getIdStation: Id de una estacion
    getNameStayion: Nombre de una estacion
    getTypeStation: Tipo de estacion
    getStopTimeStation: StopTime de estacion
    setIdStation: Estacion con nueva Id
    setNameStayion: Estacion con nuevo Nombre
    setTypeStation: Estacion con nuevo Tipo
    setStopTimeStation: Estacion con nuevo StopTime
*/
:- module(tdaStation,[station/5,getNameStation/2,getTypeStation/2]).


%constructor
/* Funcionalidad 2
Grado de Implementacion: 1
Crea elemento TDA station, estacion de metro
DOM: ID (num) X Nombre Estacion (string) X Tipo estacion (string) X Tiempo de parada (num) X (VAR)
Recorrido: VAR TDA station (Lista de elementos)*/
station(IDST,NombreST,TipoST,StopTimeST,[IDST,NombreST,TipoST,StopTimeST]).

%pertenecia
isStation(ESTACION):-station(_,_,_,_,ESTACION).

%selectores
getIdStation(ESTACION,ID):-station(ID,_,_,_,ESTACION).
getNameStation(ESTACION,NOMBRE):-station(_,NOMBRE,_,_,ESTACION).
getTypeStation(ESTACION,TIPO):-station(_,_,TIPO,_,ESTACION).
getStopTimeStation(ESTACION,StopTime):-station(_,_,StopTime,_,ESTACION).

%modificadores
setIdStation(ESTACION,NewID,NewESTACION):-station(_,Nombre,Tipo,StopT,ESTACION),station(NewID,Nombre,Tipo,StopT,NewESTACION).
setNameStation(ESTACION,NewName,NewESTACION):-station(ID,_,Tipo,StopT,ESTACION),station(ID,NewName,Tipo,StopT,NewESTACION).
setTypeStation(ESTACION,NewType,NewESTACION):-station(ID,Nombre,_,StopT,ESTACION),station(ID,Nombre,NewType,StopT,NewESTACION).
setStopTimetation(ESTACION,NewStopT,NewESTACION):-station(ID,Nombre,Tipo,_,ESTACION),station(ID,Nombre,Tipo,NewStopT,NewESTACION).


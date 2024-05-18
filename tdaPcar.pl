/* TDA pcar
Abstraccion de un carro/bagon de pasajeros que posteriormente conforman un tren. Pueden ser del tipo terminal (tr) o del tipo central (ct)
Representacion estructura de lista de elementos [ID,CAPA,MODEL,TYPE]
DOM:
    ID: Id del carro (num)
    CAPA: Capacidad de pasajeros del carro (num)
    MODEL: Modelo del carro (string)
    TYPE: Tipo de carro (atomo), {tr, ct}
    PCAR: TDA pcar carro de metro (VAR)

PREDICADOS:
    pcar(ID,CAPA,MODEL,TYPE,PCAR)
    isPcar(PCAR)
    getIdPcar(PCAR,ID)
    getCapacityPcar(PCAR,CAPA)
    getModelPcar(PCAR,MODEL)
    getTypePcar(PCAR,TYPE)
    setIdPcar(PCAR,ID,PCAR)
    setCapacityPcar(PCAR,CAPA,PCAR)
    setModelPcar(PCAR,MODEL,PCAR)
    setTypePcar(PCAR,TYPE,PCAR)

METAS PRIMARIAS
    pcar: Relacionar elementos de un pcar en una variable, constructor
    isPcar: Verificar pcar
    getIdPcar: Id de un pcar
    getCapacityPcar: Capacidad de pasajeros de un pcar
    getModelPcar: Modelo de un pcar
    getTypePcar: Tipo de un pcar
    setIdPcar: Pcar con nueva Id
    setCapacityPcar: Pcar con nueva capacidad
    setModelPcar: Pcar con nuevo modelo
    setTypePcar: Pcar con nuevo tipo
*/
:- module(tdaPcar,[pcar/5,isPcar/1,getCapacityPcar/2,getModelPcar/2,getTypePcar/2]).


%constructor
/* Funcionalidad 9
Grado de Implementacion: 1
Crea elemento TDA pcar, carro de un tren*/
pcar(ID,Capacidad,Modelo,Tipo,[ID,Capacidad,Modelo,Tipo]).



%pertenecia
isPcar(PCAR):-pcar(_,_,_,_,PCAR).



%selectores
getIdPcar(PCAR,ID):-pcar(ID,_,_,_,PCAR).
getCapacityPcar(PCAR,CAPA):-pcar(_,CAPA,_,_,PCAR).
getModelPcar(PCAR,MOD):-pcar(_,_,MOD,_,PCAR).
getTypePcar(PCAR,TYPE):-pcar(_,_,_,TYPE,PCAR).



%modificadores
setIdPcar(PCAR,NewID,NewPCAR):-pcar(_,CA,MO,TY,PCAR),pcar(NewID,CA,MO,TY,NewPCAR).
setCapacityPcar(PCAR,NewCAP,NewPCAR):-pcar(ID,_,MO,TY,PCAR),pcar(ID,NewCAP,MO,TY,NewPCAR).
setModelPcar(PCAR,NewMODEL,NewPCAR):-pcar(ID,CA,_,TY,PCAR),pcar(ID,CA,NewMODEL,TY,NewPCAR).
setTypePcar(PCAR,NewTYPE,NewPCAR):-pcar(ID,CA,MO,_,PCAR),pcar(ID,CA,MO,NewTYPE,NewPCAR).
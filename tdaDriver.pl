/* TDA driver
Abstraccion de un conductor de tren
Representacion estructura de lista de elementos [ID,NAME,MAKER]
DOM:
    ID: Id del driver (num)
    NAME: Nombre del driver (string)
    MAKER: Fabricante de los trenes que conduce el driver (string)
    DRIVER: TDA driver (VAR TDA driver)

PREDICADOS:
    driver(ID,NAME,MAKER,DRIVER)
    isDriver(DRIVER)
    getIdDriver(DRIVER,ID)
    getNameDriver(DRIVER,NAME)
    getMakerDriver(DRIVER,MAKER)
    setIdDriver(DRIVER,ID,DRIVER)
    setNameDriver(DRIVER,NAME,DRIVER)
    setMakerDriver(DRIVER,MAKER,DRIVER)

METAS PRIMARIAS:
    driver: Relacionar elementos TDA driver
    isDriver: Verificar TDA driver
    getIdDriver: Id driver
    getNameDriver: Nombre driver
    getMakerDriver: Fabricante de los trenes del driver
    setIdDriver: Driver con nueva ID
    setNameDriver: Driver con nuevo nombre
    setMakerDriver: Driver con nuevo fabricante de trenes
*/
:-module(tdaDriver,[driver/4,getIdDriver/2,getNameDriver/2,getMakerDriver/2]).


%constructor
/* Funcionalidad 15
Grado de Implementacion: 1
Crea elemento TDA driver, conductor de un tren del metro*/
driver(ID,NAME,MAKER,[ID,NAME,MAKER]).



%pertenencia
isDriver(DRIVER):-driver(_,_,_,DRIVER).



%selectores
getIdDriver(DRIVER,ID):-driver(ID,_,_,DRIVER).
getNameDriver(DRIVER,NAME):-driver(_,NAME,_,DRIVER).
getMakerDriver(DRIVER,MAKER):-driver(_,_,MAKER,DRIVER).



%modificadores
setIdDriver(DRIVER,NewID,NewDRIVER):-driver(_,NA,MAK,DRIVER),driver(NewID,NA,MAK,NewDRIVER).
setNameDriver(DRIVER,NewName,NewDRIVER):-driver(ID,_,MAK,DRIVER),driver(ID,NewName,MAK,NewDRIVER).
setMakerDriver(DRIVER,NewMaker,NewDRIVER):-driver(ID,NA,_,DRIVER),driver(ID,NA,NewMaker,NewDRIVER).
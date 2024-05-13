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
*/


%constructor, Funcionalidad 10
train(ID,MAKER,RailT,SPEED,PCARs,[ID,MAKER,RailT,SPEED,PCARs]).



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
/* TDA Hora
Estructura de Hora como string del tipo HH:MM:SS
Dom:
    HH: Hora (num)
    MM: Minutos  (num)
    SS: Segundos (num)
    Hora: Tda Hora (VAR)
    HHStr: Hora como string (string)
    MMStr: Minutos como string (string)
    SSStr: Segundos como string (string)
    NUM: Numero (num)
    STR: cadera de caracteres (string)
    SegundosTotal: segundos totales de  una hora (num)

Predicado:
    hora(HH,MM,SS,HORA)
    numberHoraString(NUM,String)
    getHHStringHora(Hora, HHStr)
    getMMStringHora(Hora, MMStr)
    getSSStringHora(Hora, SSStr)
    getHHHora(Hora, HH)
    getMMHora(Hora, MM)
    getSSHora(Hora, SS)
    setHHHora(Hora, HH, Hora)
    setMMHora(Hora, MM, Hora)
    setSSHora(Hora, SS, Hora)
    horaASegundos(Hora, SegundosTotal)
    segundosAHora(SegundosTotal, Hora)
    diferenciaDeHorasEnSS(Hora, Hora,SegundosTotal)

Metas Primaria:
    hora: Constructor Tdahora
    getHHStringHora: Obtener Hora de un TDA hora como string
    getMMStringHora: Obtener Minutos de un TDA hora como string
    getSSStringHora: Obtener Segundos de un TDA hora como string
    getHHHora: Obtener Hora de un TDA hora como numero
    getMMHora: Obtener Minutos de un TDA hora como numero
    getSSHora: Obtener Segundos de un TDA hora como numero
    setHHHora: Tda Hora con nuevas horas
    setMMHora: Tda Hora con nuevos minutos
    setSSHora: Tda Hora con nuevos segundos
    horaASegundos: Conversor de TDA Hora a un total de segundos
    diferenciaDeHorasEnSS: Diferencia en segundos de dos TDAs Hora
    segundosAHora: Conversor de un total de segundos a Tda Hora

Meta Secundarias:
    numberHoraString: Convierte un numero menor a 100 a un string considerando dos digitos

*/
:-module(tdaHora_212788287_EspinozaBarria,[hora/4,getHHHora/2,getMMHora/2,getSSHora/2,setHHHora/3,setMMHora/3,setSSHora/3,horaASegundos/2,diferenciaDeHorasEnSS/3,segundosAHora/2]).

%Constructor
hora(HH,MM,SS,StringHora):- HH>=0, HH<24, MM>=0, MM<60, SS>=0, SS<60,
    numberHoraString(HH,StrHH), numberHoraString(MM, StrMM), numberHoraString(SS, StrSS),
    atomics_to_string([StrHH,StrMM,StrSS],":",StringHora).

%convierte un numero a un string de dos digitos
numberHoraString(Numero, StringSalida):- Numero<10, string_concat("0",Numero,StringSalida),!.
numberHoraString(Numero, StringSalida):- Numero>=10, number_string(Numero,StringSalida),!.





%Selectores
getHHStringHora(Hora, HH):-atomic_list_concat([HH|_],":",Hora).
getMMStringHora(Hora, MM):-atomic_list_concat([_,MM|_],":",Hora).
getSSStringHora(Hora, SS):-atomic_list_concat([_,_,SS],":",Hora).
getHHHora(Hora,NumHH):-getHHStringHora(Hora, HH), atom_number(HH, NumHH).
getMMHora(Hora,NumMM):-getMMStringHora(Hora, MM), atom_number(MM, NumMM).
getSSHora(Hora,NumSS):-getSSStringHora(Hora, SS), atom_number(SS, NumSS).





%Modificadores
%nueva hora es en numero
setHHHora(Hora,NewHH,NewHora):-getMMHora(Hora,MM), getSSHora(Hora,SS), hora(NewHH,MM,SS,NewHora).
setMMHora(Hora,NewMM,NewHora):-getHHHora(Hora,HH), getSSHora(Hora,SS), hora(HH,NewMM,SS,NewHora).
setSSHora(Hora,NewSS,NewHora):-getHHHora(Hora,HH), getMMHora(Hora,MM), hora(HH,MM,NewSS,NewHora).




%otros predicados

%conversor de TDA hora a un total de segundos
horaASegundos(Hora, SegundosTotal):-
    getHHHora(Hora,HH),getMMHora(Hora,MM),getSSHora(Hora,SS),
    SegundosTotal is ((HH*3600) + (MM*60) + SS).


%diferencia entre una dos TDAs horas en segundos
diferenciaDeHorasEnSS(Hora1, Hora2, SegundosTotal):-
    horaASegundos(Hora1, SegundosHora1), horaASegundos(Hora2, SegundosHora2),
    SegundosHora1 =< SegundosHora2, SegundosTotal is SegundosHora2 - SegundosHora1.
diferenciaDeHorasEnSS(Hora1, Hora2, SegundosTotal):-
    horaASegundos(Hora1, SegundosHora1), horaASegundos(Hora2, SegundosHora2),
    SegundosHora1 > SegundosHora2, SegundosTotal is SegundosHora1 - SegundosHora2.


%conversor de un total de segundos a TDA hora
segundosAHora(Segundos, HoraString):-
    HoraNum is (Segundos//3600), MinutosNum is ((Segundos mod 3600)//60),
    SegundosNum is (Segundos mod 60),
    hora(HoraNum, MinutosNum, SegundosNum, HoraString).

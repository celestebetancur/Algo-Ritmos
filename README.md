###chucK 
=====
####Author : essteb (Esteban Betancur)

####For the course Algo-Ritmos 
=====

##Public class Looper documentation 


###drum (int beat, int div, int k[], int s[], int hh[])

###bass (int beat, int Scale, int key, int chords[])

###keyboard(float beat, string note[])

###guitar(float beat, float div, int notes[])



beat: divide el minuto en (beat) número de partes, por lo tanto, si es mas grande el número, la ejecución es mas rápida.

div: divide a beat, en  drum solo se permiten (1,2,4,8,16) representando las figuras musicales.

k[]: solo recibe 0 y 1 (apagado, encendido), es el bass drum o bombo.
s[]: solo recibe 0 y 1 (apagado, encendido), es el snare drum o redoblante.
hh[]; solo recibe 0 y 1 (apagado, encendido), es el hihat o charles(platillos).

scale: 0 a 15, diferentes relaciones entre las notas.
key: tonalidad 
chords[]: 0 a 6, representa la elección de acorde dentro de key (tonalidad).

note[]: string type (“ ”), nombre del acorde en español o ingles.

notes[]:0 a 127, array notas midi, 0 en este caso es silencio.


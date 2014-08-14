spork ~intro(8);

while(true) 1::second => now;

fun void intro(int conteo){

Gain master => dac;    
Blit s => master;
Blit t => master;
SinOsc b => master;
SinOsc v => master;

[8,8,8,8,6,6,5,5,6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6] @=> int scale[];
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] @=> int svoice[];
[13,13,13,13,13,13,8,8,6,6,6,6,6,6,8,8,10,10,10,10,10,10,10,10,6,6,6,6,6,6,6,6,6] @=> int bass[];
[3,3,3,3,1,1,1,1,3,3,3,3,1,1,1,1,3,3,3,3,1,1,1,1,3,3,3,3,1,1,1,1] @=> int violin[];
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32] @=> int in[];

0 => int i;
1 => int compas;
0 => int vg;
0 => int conteo;

while(conteo < 8)
{
    Std.mtof(73 + scale[i]) => s.freq;
    Std.mtof(49 + svoice[i]) => t.freq;
    Std.mtof(37 + bass[i]) => b.freq;
    Std.mtof(66 + violin[i]) => v.freq;
    2 => b.gain;
    1 => s.gain;
    .8 => t.gain;
    vg => v.gain;
    .2222::second => now;
    0 => s.gain;
    0 => t.gain;
    .2222::second => now;
    if(i < scale.cap() - 1)
    {
        i ++;
        if ( i == scale.cap() - 1)
        {
            compas ++;conteo ++;
        }
    }
    else
    {
        0 => i;
    }
    if(compas == 2)
    {
        1 => vg;
    }
    if(compas == 2 && in[i] == 31)
    {
        .4 => master.gain;
        spork ~melody();
        1::ms => now;
    }
    if(compas == 4 && in[i] == 1)
    {
        Machine.add(me.dir() + "/sequenzer.ck"); // needs BPM class and sequenzer.ck
    }
    if((compas == 5 || compas == 6) && (in[i] == 1))
    {
        spork ~rap();
    }
    if(compas == 7 && in [i] == 31)
    {
       .4 => master.gain;
        spork ~melody();
        1::ms => now; 
    }
    if(compas == 8)
    {
     Machine.remove(4);   
    } 
 }
}

fun void melody (){
    Blit m => JCRev r => dac;
    0 => int i;
    .15 => r.mix;
    
    [1,4,1,9,8,8,8,8,8,8,8,8,0,0,0,0,0,1,1,9,9,8,6,4,4,1,1,9,9,8,8,0,0,1,1,9,9,8,6,4,4,1,1,11,11,8,8,0,0,1,1,11,11,8,6,4,4,1,1,11,11,11,11,8,6,4,1,9,8,8,8,8,18,18,18,18,16,16,16,16,0,1,1,9,9,8,6,4,4,1,1,9,9,8,8,0,0,1,1,9,9,8,6,4,4,1,1,11,11,8,8,0,0,1,1,11,11,8,6,4,4,1,1,11,11,11,11,8,6,4,0,0] @=> int voz[];
    
    while(1){
        if(voz[i] != 0){
        Std.mtof(75 + voz[i]) => m.freq;
        3 => m.gain;
        .1111::second => now;
        0 => m.gain;
        .1111::second => now;
        }
        if(voz[i] == 0)
        {
        0 => m.gain;
        .1111::second => now;
        0 => m.gain;
        .1111::second => now; 
        } 
    if(i < 133)
    {
        i ++;
    }
}
}
fun void rap(){
    Noise n => dac;
  
    while( true )
    {
        0 => n.gain;
        .200::second => now;
        1 => n.gain;
        .085::second=> now;
                0 => n.gain;
        .137::second => now;
        1 => n.gain;
        .085::second=> now;
                0 => n.gain;
        .137::second => now;
        1 => n.gain;
        .085::second=> now;
                0 => n.gain;
        .137::second => now;
        1 => n.gain;
        .086::second=> now;
                0 => n.gain;
        .825::second => now;
    }
}

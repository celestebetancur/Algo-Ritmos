Looper band;

SinOsc keyboard[3];

for (0 => int i; i < keyboard.cap(); i++)
{
keyboard[i] => dac;
}

[ [60,64,67],[62,67,71],[60,64,69],[60,65,69] ] @=> int harmony[][];

fun void play(float tempo)
{
    for(0 => int i; i < harmony.cap(); i++)
    {
        Std.mtof(harmony[i][0]) => keyboard[0].freq;
        Std.mtof(harmony[i][1]) => keyboard[1].freq;
        Std.mtof(harmony[i][2]) => keyboard[2].freq;
    
        (tempo/60)::second => now;
    }
}

spork~ band.bass(120,1,[1,4,5,6]);
spork~ band.drum(120,8,[1,0,0,0],[0,0,1,0],[1,1,1,1]);

while(true)
{
    play(120);
} 


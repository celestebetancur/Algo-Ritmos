SinOsc sen => dac;
SawOsc saw => dac;
TriOsc tri => dac;
SqrOsc sqr => dac;

Noise noiseH => HPF hpf => dac; 
Noise noiseL => LPF lpf => dac;

440 => sen.freq; // same note for all oscillator
440 => saw.freq;
440 => tri.freq;
440 => sqr.freq;

while(true)
{
    0 => noiseH.gain; 
    0 => noiseL.gain;
    1.7 => sen.gain; //sinusoidal
    0 => saw.gain;
    0 => tri.gain;
    0 => sqr.gain;
    5::second => now;
    0 => sen.gain; 
    .4 => saw.gain; //saw
    0 => tri.gain;
    0 => sqr.gain;
    5::second => now;
    0 => sen.gain; 
    0 => saw.gain;
    1 => tri.gain; //triangle
    0 => sqr.gain;
    5::second => now;
    0 => sen.gain; 
    0 => saw.gain;
    0 => tri.gain;
    .4 => sqr.gain; //square
    5::second => now;
    0 => sen.gain; 
    0 => saw.gain;
    0 => tri.gain;
    0 => sqr.gain;
    break;
}    
for(.1 => float i;i < 300 ;i + .1 => i)
    {
        0 => sen.gain; 
        0 => saw.gain;
        0 => tri.gain;
        0 => sqr.gain;
        0 => noiseH.gain;
        3.5 => noiseL.gain; // noise with LPF
        (i,20) => lpf.set;
        10::ms => now;
    }
for(3000 => float i;i < 20000;i + .6 => i)
    {
        0 => sen.gain; 
        0 => saw.gain;
        0 => tri.gain;
        0 => sqr.gain;
        0 => noiseL.gain;
        1 => noiseH.gain; //noise with HPF
        (i,20) => hpf.set;
        1::ms => now;
    } 
    

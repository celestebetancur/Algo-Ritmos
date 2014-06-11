//aFuckinVirus.ck

SinOsc s => dac;
SinOsc lfo => blackhole;

5 => lfo.freq;
1 => int i;

while (17::ms => now){

      if (i  > 0 && i < 1000)
        {
        ( lfo.last() * i ) + 440 => s.freq;
        i + 1 => i; 
        }
        
    if (i > 999 && i < 5000)
        { 
        ( lfo.last() * i ) + 440 => s.freq;
        i + 10 => i;   
        }
        
    if (i > 4989 && i < 100000) {
        ( lfo.last() * i ) + 440 => s.freq;
        i + 1000 => i;   
        }
}
   

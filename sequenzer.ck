Gain master => dac; //Gain 

//Sound chain - Electronic kit
SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => NRev rev => master;

//.wav files
me.dir() + "/Kick.wav" => kick.read; 
me.dir() + "/HH.wav" => hihat.read;
me.dir() + "/Snare-Clap.wav" => snare.read;

//inicio 
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

// define tempo
BPM tempo;
135.0 => float beat;
tempo.tempo(beat);

// Drums 
[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0] @=> int k[];
[0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0] @=> int sn[];
[0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0] @=> int hh[];

//set general mix gain
1.3 => masterE.gain;

//set indivudual mix gain
1.6 => kick.gain;
1 => snare.gain;
.2 => hihat.gain;

0.1 => rev.mix; //hh reverb


while(true)
{
    for(0 => int i; i < k.cap(); i++)
    {
        if (k[i] == 1)
        {
            0 => kick.pos;
        }
        if (sn[i] == 1)
        {
            0 => snare.pos;
        }
        if (hh[i] == 1)
        {
            0 => hihat.pos;
        }
               tempo.sixteenth => now;
    }
}

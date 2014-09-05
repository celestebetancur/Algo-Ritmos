public class Looper
{
    static dur whole, dHalf, half, dQuarter, quarter, tQuarter, dEighth, eighth, tEighth, sixteenth, thirtysecond;
    static dur pulse;
    
    fun void BPM (float beat)  //traditional notation
    {
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => quarter;
        quarter*6 => dHalf;
        quarter*4 => whole;
        quarter*2 => half;
        half*0.333 => tQuarter;
        quarter*1.5 => dQuarter;
        quarter*0.75 => dEighth;
        quarter*0.5 => eighth;
        quarter*0.333 => tEighth;
        eighth*0.5 => sixteenth;
        sixteenth*0.5 => thirtysecond;
    }
    fun dur tempo (float beat)   // more time based notation
    {
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => pulse;
        return pulse;
    }

    int notes[];
    
    fun int[] Modes (int input)
    {
        if( input == 1 )
        {
            [0, 2, 4, 5, 7, 9, 11] @=> int maj[]; //major scale
            maj @=> notes;
            return notes;
        }
        if( input == 2 )
        {
            [0, 2, 3, 5, 7, 9, 10] @=> int dor[]; //dorian
            dor @=> notes;
            return notes;
        }
        if( input == 3 )
        {
            [0, 1, 3, 5, 7, 8, 10] @=> int phg[]; //phrygian 
            phg @=> notes;
            return notes;  
        }
        if( input == 4 )
        {
            [0, 2, 4, 6, 7, 9, 11] @=> int lyd[]; //lydian
            lyd @=> notes;
            return notes;
        }
        if( input == 5 )
        {
            [0, 2, 4, 5, 7, 8, 10] @=> int mix[]; //mixolydian
            mix @=> notes;
            return notes;
        }
        if( input == 6 )
        {
            [0, 2, 3, 5, 7, 8, 10] @=> int min[]; //aeolyan - minor
            min @=> notes;
            return notes;
        }
        if( input == 7 )
        {
            [0, 1, 3, 5, 6, 8, 10] @=> int loc[]; //locyan
            loc @=> notes;
            return notes;
        }
        if( input == 8 )
        {
            [0, 2, 4, 7, 9] @=> int pent[]; //major pentatonic
            pent @=> notes;
            return notes;
        }
        if( input == 9 )
        {
            [0, 2, 3, 5, 7, 8, 11] @=> int har[]; //harmonic minor
            har @=> notes;
            return notes;
        }
        if( input == 10 )
        {
            [0, 2, 3, 5, 7, 9, 11] @=> int asc[]; //ascending melodic minor
            asc @=> notes;
            return notes;
        }
        if( input == 11 )
        {
            [0, 1, 4, 5, 7, 8, 10] @=> 
            int jewish[]; //phrygian dominant-jewish
            jewish @=> notes;
            return notes;
        }
        if( input == 12 )
        {
            [0, 2, 3, 6, 7, 8, 11] @=> int gypsy[]; //hungarian-gypsy
            gypsy @=> notes;
            return notes;
        }
        if( input == 13 )
        {
            [0, 1, 4, 5, 7, 8, 11] @=> int arabic[]; //arabic
            arabic @=> notes;
            return notes;
        }
        if( input == 13 )
        {
            [0, 2, 4, 6, 8, 10] @=> int wt[]; //whole tone
            wt @=> notes;
            return notes;
        }
        if( input == 14 )
        {
            [0, 2, 3, 5, 6, 8, 9, 11] @=> int dim[]; //diminished
            dim @=> notes;
            return notes;
        }
        if( input == 15 )
        {
            [0, 2, 4, 6, 7, 9, 10] @=> int ind[];//psuedo indian lydian
            ind @=> notes;
            return notes;
        }
        else
        {
            <<<"Number between 1 and 15">>>;
        }
        
    }

    Gain master => dac; //Gain 
    
    //Sound chain - Electronic kit
    SndBuf bassdrum => master;
    SndBuf snaredrum => master;
    SndBuf hihatcymbal => NRev rev => master;   
    
    .8 => master.gain;
    .065 => rev.mix; 
    
    //.wav files
    me.dir() + "/Kick.wav" => bassdrum.read; 
    me.dir() + "/Snare-Clap.wav" => snaredrum.read;
    me.dir() + "/HH.wav" => hihatcymbal.read;
    
    //inicio 
    bassdrum.samples() => bassdrum.pos;
    snaredrum.samples() => snaredrum.pos;
    hihatcymbal.samples() => hihatcymbal.pos;
    
    fun void drum (int beat, int div, int k[], int s[], int hh[])
    {   
        BPM(beat);
        
        while(true)
        {
            for(0 => int i; i < k.cap() && i < s.cap() && i < hh.cap(); i++)
            {
                if (k[i] == 1)
                {
                    0 => bassdrum.pos;
                }
                if (s[i] == 1)
                {
                    0 => snaredrum.pos;
                }
                if (hh[i] == 1)
                {
                    0 => hihatcymbal.pos;
                } 
                if( div == 1 )
                {
                    whole => now;
                }
                if( div == 2 )
                {
                    half => now;
                }
                if( div == 3 )
                {
                    tEighth => now;
                }
                if( div == 4 )
                {
                    quarter => now;
                }
                if( div == 8 )
                {
                    eighth => now;
                }
                if( div == 16 )
                {
                    sixteenth => now;
                }
                if( div == 32 )
                {
                    thirtysecond => now;
                }
                else
                {
                    <<<"Not supported time division">>>;
                }
            }
        }
    }

    TriOsc Bass => ADSR e => NRev revbass => dac;
    
    e.set(10::ms, 8::ms, .5, 5::ms);
    .07 => revbass.mix;
    1 => Bass.gain;
    
    36 => int octave;
    int basspatern[5];
    
    fun void bass (int beat, int Scale, int chords[])
    {
        tempo(beat) => dur puls;
        
        Modes(Scale) @=> int scale[];
        
        if (Scale < 7) Scale + 36 => int octave;
        else Scale + 24 => octave;
        
        while(true)
        {
            for(0 => int i;i < chords.cap(); i++)
            { 
                scale[chords[i]] + octave @=> basspatern[0];
                scale[chords[i]] + octave @=> basspatern[1];
                scale[chords[i]] + octave @=> basspatern[2];
                scale[Math.random2(0,scale.cap() -1 )] + octave @=> basspatern[3];
                scale[Math.random2(0,scale.cap() -1 )] + octave @=> basspatern[4];
                
                for(0 => int ii; ii < basspatern.cap(); ii++)
                {
                    Std.mtof(basspatern[ii]) => Bass.freq; 
                    e.keyOn();
                    [(puls - 10::ms),(puls - 10::ms),(puls - 10::ms),((puls / 2) - 10::ms),((puls / 2) - 10::ms)] @=> dur rithym[];
                    rithym[ii] => now;
                    e.keyOff();
                    10::ms => now;      
                }
            }
        }
    }
}   


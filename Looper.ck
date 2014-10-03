// Author: essteb (Esteban Betancur)

//Chuck class for the course Algo-Ritmos


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
        fun int[] harmony(string note)
        {
            int chords[];
            
            if(note == "A" || note == "a" || note == "la" || note == "La")
            {
                [61,69,64,68] @=> int chords[];
                return chords;
            }  
            if(note == "A#" || note == "a#" || note == "la#" || note == "La#" || note == "Bb" || note == "bb" || note == "sib" || note == "Sib")
            {
                [62,70,65,69] @=> int chords[];
                return chords;
            }   
            if(note == "B" || note == "b" || note == "si" || note == "Si")
            {
                [63,71,66,70] @=> int chords[];
                return chords;
            }   
            if(note == "C" || note == "c" || note == "do" || note == "Do")
            {
                [60,67,64,71] @=> int chords[];
                return chords;
            } 
            if(note == "C#" || note == "c#" || note == "do#" || note == "Do#" || note == "Db" || note == "db" || note == "reb" || note == "Reb")
            {
                [61,68,65,72] @=> int chords[];
                return chords;
            } 
            if(note == "D" || note == "d" || note == "re" || note == "Re")
            {
                [62,69,66,73] @=> int chords[];
                return chords;
            } 
            if(note == "D#" || note == "d#" || note == "re#" || note == "Re#" || note == "Eb" || note == "eb" || note == "mib" || note == "Mib")
            {
                [63,70,67,62] @=> int chords[];
                return chords;
            } 
            if(note == "E" || note == "e" || note == "mi" || note == "Mi")
            {
                [64,71,68,63] @=> int chords[];
                return chords;
            } 
            if(note == "F" || note == "f" || note == "fa" || note == "Fa")
            {
                [65,72,69,64] @=> int chords[];
                return chords;
            } 
            if(note == "F#" || note == "f#" || note == "fa#" || note == "Fa#" || note == "Gb" || note == "gb" || note == "solb" || note == "Solb")
            {
                [66,73,70,65] @=> int chords[];
                return chords;
            } 
            if(note == "G" || note == "g" || note == "sol" || note == "Sol")
            {
                [67,71,62,66] @=> int chords[];
                return chords;
            } 
            if(note == "G#" || note == "g#" || note == "sol#" || note == "Sol#" || note == "Ab" || note == "ab" || note == "lab" || note == "Lab")
            {
                [68,72,63,67] @=> int chords[];
                return chords;
            } 
            if(note == "Am" || note == "am" || note == "lam" || note == "Lam")
            {
                [60,69,64,67] @=> int chords[];
                return chords;
            }  
            if(note == "A#m" || note == "a#m" || note == "la#m" || note == "La#m" || note == "Bbm" || note == "bbm" || note == "sibm" || note == "Sibm")
            {
                [61,70,65,68] @=> int chords[];
                return chords;
            }   
            if(note == "Bm" || note == "bm" || note == "sim" || note == "Sim")
            {
                [62,71,66,69] @=> int chords[];
                return chords;
            }   
            if(note == "Cm" || note == "cm" || note == "dom" || note == "Dom")
            {
                [60,67,63,70] @=> int chords[];
                return chords;
            } 
            if(note == "C#m" || note == "c#m" || note == "do#m" || note == "Do#m" || note == "Dbm" || note == "dbm" || note == "rebm" || note == "Rebm")
            {
                [61,68,64,71] @=> int chords[];
                return chords;
            } 
            if(note == "Dm" || note == "dm" || note == "rem" || note == "Rem")
            {
                [62,69,65,72] @=> int chords[];
                return chords;
            } 
            if(note == "D#m" || note == "d#m" || note == "re#m" || note == "Re#m" || note == "Ebm" || note == "ebm" || note == "mibm" || note == "Mibm")
            {
                [64,70,66,73] @=> int chords[];
                return chords;
            } 
            if(note == "Em" || note == "em" || note == "mim" || note == "Mim")
            {
                [64,71,67,62] @=> int chords[];
                return chords;
            } 
            if(note == "Fm" || note == "fm" || note == "fam" || note == "Fam")
            {
                [65,72,68,63] @=> int chords[];
                return chords;
            } 
            if(note == "F#m" || note == "f#m" || note == "fa#m" || note == "Fa#m" || note == "Gbm" || note == "gbm" || note == "solbm" || note == "Solbm")
            {
                [66,73,69,64] @=> int chords[];
                return chords;
            } 
            if(note == "Gm" || note == "gm" || note == "solm" || note == "Solm")
            {
                [67,70,62,65] @=> int chords[];
                return chords;
            } 
            if(note == "G#m" || note == "g#m" || note == "sol#m" || note == "Sol#m" || note == "Abm" || note == "abm" || note == "labm" || note == "Labm")
            {
                [68,71,63,66] @=> int chords[];
                return chords;
            } 
        }
    
    
    Gain master => dac; //Gain 
    
    //Sound chain - Electronic kit
    SndBuf bassdrum => master;
    SndBuf snaredrum => master;
    SndBuf hihatcymbal => NRev rev => master;   
    
    .8 => master.gain;
    .055 => rev.mix; 
    
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
    
    fun void bass (int beat, int Scale, int key, int chords[])
    {
        tempo(beat) => dur puls;
        
        Modes(Scale) @=> int scale[];
        
        if (Scale < 7) Scale + 36 => int octave;
        else Scale + 24 => octave;
        
        while(true)
        {
            for(0 => int i;i < chords.cap(); i++)
            { 
                scale[chords[i]] + (octave + key) @=> basspatern[0];
                scale[chords[i]] + (octave + key) @=> basspatern[1];
                scale[chords[i]] + (octave + key) @=> basspatern[2];
                scale[Math.random2(0,scale.cap() -1 )] + (octave + key) @=> basspatern[3];
                scale[Math.random2(0,scale.cap() -1 )] + (octave + key) @=> basspatern[4];
                
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
    fun void keyboard(float tempo,string note[])
    {
        SinOsc polyphony[3];
        for (0 => int i; i < polyphony.cap(); i++)
        {
            polyphony[i] => dac;
            0.2 => polyphony[i].gain;
        }  
        
        while(true)
        {
            for (0 => int i; i < note.cap(); i++)
            {
                harmony(note[i]) @=> int harmony[];
                
                for(0 => int i; i < polyphony.cap(); i++)
                {
                    Std.mtof(harmony[i]) => polyphony[i].freq;                
                }
                (240/tempo)::second => now;  
            }
        }
    }
    public void guitar(float beat,float div,int notes[])
    {
        Mandolin mandolin => dac;
        0.6 => mandolin.gain;
        240.0/beat => float tempo;
        
        while(true)
        {
            for(0 => int i; i < notes.cap(); i++)
            {
                if(notes[i] == 0)
                {
                    mandolin.noteOff;
                    (tempo/div)::second => now;
                }
                else
                {
                    Std.mtof(notes[i]) => mandolin.freq;
                    1 => mandolin.noteOn;
                    mandolin.noteOn;
                    (tempo/div)::second => now;
                    mandolin.noteOff;
                }
            }          
        }
    }
}   


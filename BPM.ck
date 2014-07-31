public class BPM
{
    dur duration[4];
    //d for dotted
    //t for triplet
    static dur whole, dHalf, half, dQuarter, quarter, tQuarter, dEighth, eighth, tEighth, sixteenth, thirtysecond;
    
    fun void tempo(float beat)  {
        
        //traditional notation
        
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
        
        [whole, dHalf, half, dQuarter, quarter, tQuarter, dEighth, eighth, tEighth, sixteenth, thirtysecond] @=> duration;

        // more time based notation
        
        quarter => dur pulse;
        
        }
}

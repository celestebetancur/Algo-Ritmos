public class BPM
{
    static dur whole, dHalf, half, dQuarter, quarter, tQuarter, dEighth, eighth, tEighth, sixteenth, thirtysecond;
    static dur pulse;
    
    fun void tTempo(float beat)  //traditional notation
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
    fun dur tempo(float beat)   // more time based notation
    {
            60.0/(beat) => float SPB; // seconds per beat
            SPB :: second => pulse;
            return pulse;
    }
}

package kmrd.dn.model;

public class kmrd_Time {

    private int hh;
    private int mm;

    public int getHh() { return hh;}
    public void setHh(int hh) { this.hh = hh; }

    public int getMm() { return mm; }
    public void setMm(int mm) { this.mm = mm; }

    public kmrd_Time(){ setHh(0); setMm(0); }

    public kmrd_Time(int _hh, int _mm){ setHh(_hh); setMm(_mm);}

    public int convTimeToMin(){
        int min = getHh()*60 + getMm();
        return min;
    }

    public void reformatTime(){
        int _hh = getHh();
        int _mm = getMm();
        int temp = _mm % 60;
        if(temp == 0){
            setHh(_hh + (_mm / 60));
            setMm(0);
        }
        else{
            int temp2 = _mm - temp;
            setHh(_hh + (temp2 / 60));
            setMm(temp);
        }
    }

    public kmrd_Time getTimeDif(kmrd_Time t1, kmrd_Time t2){
        kmrd_Time ret = new kmrd_Time();
        int t1_min = t1.convTimeToMin();
        int t2_min = t2.convTimeToMin();
        int temp = t2_min - t1_min;
        ret.setHh(0);
        ret.setMm(temp);
        ret.reformatTime();
        return ret;
    }

    public kmrd_Time addTime(kmrd_Time t2){
        kmrd_Time ret = new kmrd_Time();
        int t1_min = this.convTimeToMin();
        int t2_min = t2.convTimeToMin();
        int temp = t1_min + t2_min;
        ret.setMm(temp);
        ret.reformatTime();
        return ret;
    }

    public static kmrd_Time toKmrd(String str){
        kmrd_Time newKmrd = new kmrd_Time();
        String[] temp = str.split(":");
        newKmrd.setHh(Integer.parseInt(temp[0]));
        newKmrd.setMm(Integer.parseInt(temp[1]));
        return newKmrd;
    }

    @Override
    public String toString(){
        reformatTime();
        String out = "";
        if(hh<10) out = out + "0";
        out = out + hh;
        out = out + ":";
        if(mm<10) out = out + "0";
        out = out + mm;
        return out;
    }
}
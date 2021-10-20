package kmrd.dn.model;

import java.util.ArrayList;
import java.util.HashMap;

public class Day {
    private String      today;      // Дата
    private int         taskCount;  // Число задач в день
    private int[]       Vmin = new int[96];       // Минуты дня (96 блоков по 15 минут)
    private HashMap<String, Integer> popMasters = new HashMap<>();
    private HashMap<String, Integer> popTypes = new HashMap<>();
    private HashMap<String, Integer> popLocations = new HashMap<>();

    public String getToday() { return today; }
    public void setToday(String today) { this.today = today;}

    public int[] getVmin() { return Vmin;}

    public String printPopularTime(){
        String temp = "<table class='popT'>" + "<tr>"+"<td>00:00 - ";
        kmrd_Time kmrd = new kmrd_Time();
        int last = Vmin[0];
        for(int i=1; i<Vmin.length; i++){
            if(last != Vmin[i]){
                kmrd.setHh(0);
                kmrd.setMm(i*15);
                temp = temp + kmrd.toString()+"</td><td>" + last + "</td></tr>";
                temp = temp + "<tr><td>" + kmrd.toString() + " - ";
                last = Vmin[i];
            }
        }
        if(last == Vmin[95]){
            temp = temp + "00:00</td><td>" + last + "</td></tr>";
        }
        temp = temp + "</table>";
        return temp;
    }

    public String printPopularTitle(){
        String temp = "00:00 - ";
        kmrd_Time kmrd = new kmrd_Time();
        int last = Vmin[0];
        for(int i=1; i<Vmin.length; i++){
            if(last != Vmin[i]){
                kmrd.setHh(0);
                kmrd.setMm(i*15);
                temp = temp + kmrd.toString()+" -- " + last + "&#013;";
                temp = temp + kmrd.toString() + " - ";
                last = Vmin[i];
            }
        }
        if(last == Vmin[95]){
            temp = temp + "00:00 -- " + last;
        }
        return temp;
    }

    public String printPopularMap(HashMap<String, Integer> map, String className){
        ArrayList<String> strings = new ArrayList<>();
        ArrayList<Integer> ints = new ArrayList<>();

        for (HashMap.Entry<String, Integer> e : map.entrySet()) {
            int value = e.getValue();
            boolean isAdded = false;
            for (int i = 0; i < ints.size(); i++) {
                if (value > ints.get(i)) {
                    ints.add(i, value);
                    strings.add(i, e.getKey());
                    isAdded = true;
                    break;
                }
            }
            if (!isAdded) {
                ints.add(value);
                strings.add(e.getKey());
            }
        }

        String temp = "<table class='"+ className + "'>";
        for(int i = 0; i < ints.size(); i++){
            temp = temp +"<tr><td>"+ strings.get(i) + "</td><td>" + ints.get(i) + "</td></tr>";
        }
        temp = temp + "</table>";
        return temp;
    }

    public void setVmin(int[] Vmin) { this.Vmin = Vmin;}

    public void addVmin(int start, int dur){
        int Vstart = (int)Math.floor(start/15);
        double Vend = (start + dur)/15;
        if(Vend>95) Vend = 95;
        for(int i = Vstart; i<Vend; i++){
            if(this.Vmin[i]>=0){
                this.Vmin[i]++;
            }
            else{
                this.Vmin[i]=1;
            }
        }
    }

    public int getTaskCount() {  return taskCount;}
    public void setTaskCount(int taskCount) {
        this.taskCount = taskCount;
    }

    public void addCount(int c) {
        if(this.taskCount>0){
            this.taskCount = this.taskCount+c;
        }
        else{
            this.taskCount=c;
        }
    }

    public void setAll(String day, int tc, int[] vm){
        this.setToday(day);
        this.setTaskCount(tc);
        this.setVmin(vm);
    }

    public void resetCountAndArr(){
        this.taskCount = 0;
        for(int i = 0; i<this.Vmin.length; i++){
            this.Vmin[i]=0;
        }
    }

    public void copyDay(Day day2){
        this.setToday(day2.getToday());
        this.setTaskCount(day2.getTaskCount());
        this.setVmin(day2.getVmin());
        this.setPopMasters(day2.getPopMasters());
        this.setPopTypes(day2.getPopTypes());
        this.setPopLocations(day2.getPopLocations());
    }

    public HashMap<String, Integer> getPopMasters() {  return popMasters; }
    public void setPopMasters(HashMap<String, Integer> popMasters) {
        this.popMasters = popMasters;
    }
    public void addPopMaster(Task task){
        String masterName = task.getMaster().toUpperCase();
        if (popMasters.containsKey(masterName)) {
            popMasters.put(masterName, popMasters.get(masterName) + 1);
        } else {
            popMasters.put(masterName, 1);
        }
    }
    public String printMasters(){
        return printPopularMap(this.popMasters, "popMasters");
    }

    public HashMap<String, Integer> getPopTypes() { return popTypes; }
    public void setPopTypes(HashMap<String, Integer> popTypes) {
        this.popTypes = popTypes;
    }
    public void addPopType(Task task){
        String taskName = task.getName().toUpperCase();
        if (popTypes.containsKey(taskName)) {
            popTypes.put(taskName, popTypes.get(taskName) + 1);
        } else {
            popTypes.put(taskName, 1);
        }
    }
    public String printTypes(){
        return printPopularMap(this.popTypes, "popTypes");
    }

    public HashMap<String, Integer> getPopLocations() {  return popLocations; }
    public void setPopLocations(HashMap<String, Integer> popLocations) {
        this.popLocations = popLocations;
    }
    public void addPopLocation(Task task){
        String locName = task.getLocation().toUpperCase();
        if (popLocations.containsKey(locName)) {
            popLocations.put(locName, popLocations.get(locName) + 1);
        } else {
            popLocations.put(locName, 1);
        }
    }
    public String printLocations(){
        return printPopularMap(this.popLocations, "popLocations");
    }
}

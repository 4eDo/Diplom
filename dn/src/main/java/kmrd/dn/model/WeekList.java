package kmrd.dn.model;

import java.util.List;

public class WeekList {
    private String date;
    private List<Task> tasks;
    private String emptyDay = "";

    public String getDate() {return date;}
    public void setDate(String date) { this.date = date;}

    public List<Task> getTasks() { return tasks;}
    public void setTasks(List<Task> tasks) { this.tasks = tasks;}

    public String getEmptyDay() { return emptyDay; }
    public void setEmptyDay(String emptyDay) { this.emptyDay = emptyDay;}
}

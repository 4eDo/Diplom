package kmrd.dn.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="tasks")
public class Task {

    private int id;
    private int ownerId;    // Владелец задачи
    private String name;       // Название задачи
    private kmrd_Time duration;   // Протяжённость задачи
    private int duration_hh;   // Протяжённость задачи
    private int duration_mm;   // Протяжённость задачи
    private kmrd_Time t_start;    // Время начала задачи
    private int t_start_hh;    // Время начала задачи
    private int t_start_mm;    // Время начала задачи
    private kmrd_Time t_end;      // Время завершения задачи
    private int t_end_hh;   // -//-
    private int t_end_mm;   // -//-
    private String repeat;     // Повтор (РАЗОБРАТЬСЯ С ТИПОМ)
    private String master;     // Мастер (исполнитель)
    private String client;     // Клиент
    private String location;   // Местоположение
    private double price;      // Стоимость
    private String description;// Описание
    private String startDate;
    private String endDate;

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Column(name="ownerId")
    public int getOwnerId() {
        return ownerId;
    }
    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    @Column(name="name")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Transient
    public kmrd_Time getDuration() {
        setDuration();
        return duration;
    }
    @Transient
    public String getDurationS() {
        setDuration();
        return getDuration_hh() + ":" + getDuration_mm();
    }
    @Transient
    public void setDuration() {
        this.duration = new kmrd_Time(this.getDuration_hh(), this.getDuration_mm());
    }
    @Transient
    public void setDuration(int hh, int mm) {
        this.setDuration_hh(hh);
        this.setDuration_mm(mm);
        setDuration();
    }

    @Column(name="duration_hh")
    public int getDuration_hh() {
        return duration_hh;
    }
    public void setDuration_hh(int duration_hh) {
        this.duration_hh = duration_hh;
    }

    @Column(name="duration_mm")
    public int getDuration_mm() {
        return duration_mm;
    }
    public void setDuration_mm(int duration_mm) {
        this.duration_mm = duration_mm;
    }

    @Transient
    public kmrd_Time getT_start() {
        setT_start();
        return t_start;
    }
    @Transient
    public void setT_start() {
        this.t_start = new kmrd_Time(this.getT_start_hh(), this.getT_start_mm());
    }
    @Transient
    public void setT_start(int hh, int mm) {
        this.setT_start_hh(hh);
        this.setT_start_mm(mm);
        setT_start();
    }

    @Column(name="t_start_hh")
    public int getT_start_hh() {
        return t_start_hh;
    }
    public void setT_start_hh(int t_start_hh) {
        this.t_start_hh = t_start_hh;
    }

    @Column(name="t_start_mm")
    public int getT_start_mm() {
        return t_start_mm;
    }

    public void setT_start_mm(int t_start_mm) {
        this.t_start_mm = t_start_mm;
    }
    @Transient
    public kmrd_Time getT_end() {
        setT_end(getT_start(), getDuration());
        return t_end;
    }
    @Transient
    public void setT_end(kmrd_Time t_start, kmrd_Time duration) {
        this.t_end = t_start.addTime(duration);
        this.t_end_mm = this.t_end.getMm();
        this.t_end_hh = this.t_end.getHh();
    }
    @Transient
    public int getT_end_hh() {
        return this.t_end.getHh();
    }
    @Transient
    public void setT_end_hh(int t_end_hh) {
        this.t_end_hh = this.t_end.getHh();
    }
    @Transient
    public int getT_end_mm() {
        return this.t_end.getMm();
    }
    @Transient
    public void setT_end_mm(int t_end_mm) {
        this.t_end_mm = this.t_end.getMm();
    }

    @Column(name= "repeatTask")
    public String getRepeat() {
        return repeat;
    }
    public void setRepeat(String repeat) {
        this.repeat = repeat;
    }

    @Column(name="master")
    public String getMaster() {
        return master;
    }
    public void setMaster(String master) {
        this.master = master;
    }

    @Column(name="client")
    public String getClient() {
        return client;
    }
    public void setClient(String client) {
        this.client = client;
    }

    @Column(name="location")
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    @Column(name="price")
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    @Column(name="description")
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    @Transient
    public void CopyTask(Task newTask, Task task){
        newTask.setOwnerId(task.getOwnerId());
        newTask.setName(task.getName());
        newTask.setDuration(task.getDuration().getHh(), task.getDuration().getMm());
        newTask.setT_start(task.getT_start().getHh(), task.getT_start().getMm());
        newTask.setT_end(newTask.getT_start(), newTask.getDuration());
        newTask.setMaster(task.getMaster());
        newTask.setClient(task.getClient());
        newTask.setLocation(task.getLocation());
        newTask.setPrice(task.getPrice());
        newTask.setRepeat(task.getRepeat());
        newTask.setDescription(task.getDescription());
    }
    public Task() {
        setName("Название");
        setDuration_hh(0);
        setDuration_mm(0);
        setT_start(0, 0);
        setT_end(getT_start(), getDuration());
        setRepeat("0");
        setMaster("master");
        setClient("client");
        setLocation("locat");
        setPrice(0.00);
        setDescription("Text text text text");
    }

    @Override
    public String toString() {
        return "Task #" + id
                + " " + name + " Duration: " + duration.toString()
                + " start: " + t_start.toString() + " end: " + t_end.toString()
                + " repeat: " + repeat + "\n Master " + master + " Client "
                + client + " Location " + location + " price " + price + " description " + description;
    }

    @Column(name="startDate")
    public String getStartDate() {
        if (startDate != null) {
            return startDate;
        } else {
            return LocalDate.now().toString();
        }
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    @Column(name="endDate")
    public String getEndDate() {
        if (endDate != null) {
            return endDate;
        } else {
            return "0";
        }
    }
    public void setEndDate(String startDate) {
        this.endDate = startDate;
    }

}

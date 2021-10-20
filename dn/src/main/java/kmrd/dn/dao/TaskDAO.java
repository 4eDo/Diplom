package kmrd.dn.dao;

import kmrd.dn.model.Task;
import java.util.List;
import kmrd.dn.model.*;

public interface TaskDAO {
    List<Task> allTasks();
    void add(Task task);
    void delete(Task task);
    void deleteOne(Task task, String day);
    void deleteAfter(Task task, String day);
    void edit(Task task);
    void editOne(Task oldTask, Task task, String day);
    void editAfter(Task oldTask, Task task, String day);
    Task getById(int id);
    List<Task> allByDay(String day, int ownerId);
    List<Task> allByOwner(int ownerId);
    List<Task> actualByOwner(int owner);
    List<Task> archiveByOwner(int owner);
    List<Day> statByYear(int ownerId);
    List<Day> statByMonth(String startDay, int ownerId);
    List<WeekList> dwnldWeek(int ownerId, int wOrM);
}

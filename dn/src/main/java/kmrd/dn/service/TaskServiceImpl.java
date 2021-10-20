package kmrd.dn.service;

import kmrd.dn.dao.TaskDAO;
import kmrd.dn.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    private TaskDAO taskDAO;

    @Autowired
    public void setTaskDAO(TaskDAO tDAO){
        this.taskDAO = tDAO;
    }

    @Override
    @Transactional
    public List<Task> allTasks() {
        return taskDAO.allTasks();
    }

    @Override
    @Transactional
    public void add(Task task) {
        taskDAO.add(task);
    }

    @Override
    @Transactional
    public void delete(Task task) {
        taskDAO.delete(task);
    }

    @Override
    @Transactional
    public void deleteOne(Task task, String day) {
        taskDAO.deleteOne(task, day);
    }

    @Override
    @Transactional
    public void deleteAfter(Task task, String day) {
        taskDAO.deleteAfter(task, day);
    }

    @Override
    @Transactional
    public void edit(Task task) {
        taskDAO.edit(task);
    }

    @Override
    @Transactional
    public void editOne(Task oldTask, Task task, String day) {
        taskDAO.editOne(oldTask, task, day);
    }

    @Override
    @Transactional
    public void editAfter(Task oldTask, Task task, String day) {
        taskDAO.editAfter(oldTask, task, day);
    }

    @Override
    @Transactional
    public Task getById(int id) {
        return taskDAO.getById(id);
    }

    @Override
    @Transactional
    public List<Task> allByDay(String ld, int ownerId) {
        return taskDAO.allByDay(ld, ownerId);
    }

    @Override
    @Transactional
    public List<Task> allByOwner(int owner) {
        return taskDAO.allByOwner(owner);
    }

    @Override
    @Transactional
    public List<Task> actualByOwner(int owner){
        return taskDAO.actualByOwner(owner);
    }

    @Override
    @Transactional
    public List<Task> archiveByOwner(int owner){
        return taskDAO.archiveByOwner(owner);
    }

    @Override
    @Transactional
    public List<Day> statByYear(int ownerId) {
        return taskDAO.statByYear(ownerId);
    }

    @Override
    @Transactional
    public List<Day> statByMonth(String string, int i) {
        return taskDAO.statByMonth(string, i);
    }

    @Override
    @Transactional
    public List<WeekList> dwnldWeek(int ownerId, int wOrM) {
        return taskDAO.dwnldWeek(ownerId, wOrM);
    }
}

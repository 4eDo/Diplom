package kmrd.dn.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import kmrd.dn.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;

@Repository("TaskDAO")
public class TaskDAOImpl implements TaskDAO {

    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Task> allTasks() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("from Task").list();
    }

    @Override
    public void add(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        if(task.getRepeat().equals("10000000")){
            task.setEndDate(LocalDate.now().toString());
        }
        session.save(task);
    }

    @Override
    public void delete(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(task);
    }

    @Override
    public void deleteOne(Task task, String day) {
        if (!task.getRepeat().equals("10000000")) {
            Task newTask = new Task();
            newTask.CopyTask(newTask, task);
            newTask.setStartDate(LocalDate.parse(day).plusDays(1).toString());
            newTask.setEndDate(task.getEndDate());
            add(newTask);
        }
        deleteAfter(task, day);
    }

    @Override
    public void deleteAfter(Task task, String day) {
        Session session = this.sessionFactory.getCurrentSession();
        task.setEndDate(LocalDate.parse(day).minusDays(1).toString());
        session.update(task);
    }

    @Override
    public void edit(Task task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(task);
    }

    @Override
    public void editOne(Task oldTask, Task task, String day) {
        if (!task.getRepeat().equals("10000000")) {
            deleteOne(oldTask, day);
            Task newTask = new Task();
            newTask.CopyTask(newTask, task);
            newTask.setStartDate(LocalDate.parse(day).toString());
            newTask.setEndDate(task.getEndDate());
            newTask.setRepeat("10000000");
            add(newTask);
        } else {
            edit(task);
        }
    }

    @Override
    public void editAfter(Task oldTask, Task task, String day) {
        if (!task.getRepeat().equals("10000000")) {
            deleteAfter(oldTask, day);
            Task newTask = new Task();
            newTask.CopyTask(newTask, task);
            newTask.setStartDate(LocalDate.parse(day).toString());
            newTask.setEndDate(task.getEndDate());
            add(newTask);
        } else {
            edit(task);
        }
    }

    @Override
    public Task getById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Task.class, id);
    }

    @Override
    public List<Task> allByDay(String day, int ownerId) {
        List<Task> temp = new ArrayList();
        int isEx;
        switch (LocalDate.parse(day).getDayOfWeek()) {
            case MONDAY:
                isEx = 1;
                break;
            case TUESDAY:
                isEx = 2;
                break;
            case WEDNESDAY:
                isEx = 3;
                break;
            case THURSDAY:
                isEx = 4;
                break;
            case FRIDAY:
                isEx = 5;
                break;
            case SATURDAY:
                isEx = 6;
                break;
            case SUNDAY:
                isEx = 7;
                break;
            default:
                isEx = 0;
        }
        List<Task> tasks = allByOwner(ownerId);
        for (Task task : tasks) {
            if ((task.getStartDate() != null)
                    && (LocalDate.parse(task.getStartDate()).isBefore(LocalDate.parse(day)) || task.getStartDate().equals(day))
                    && ((task.getStartDate().equals(day)) || (task.getRepeat().charAt(isEx) == '1'))) {
                if (task.getEndDate().equals("0")) {
                    temp.add(task);
                } else if (LocalDate.parse(task.getEndDate()).isAfter(LocalDate.parse(day)) || task.getEndDate().equals(day)) {
                    temp.add(task);
                }
            }
        }
        return temp;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Task> allByOwner(int owner) {

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Task where ownerId = :ownerID");
        query.setParameter("ownerID", owner);
        return ((org.hibernate.query.Query) query).list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Task> actualByOwner(int owner) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Task where ownerId = :ownerID");
        query.setParameter("ownerID", owner);
        List <Task> task = ((org.hibernate.query.Query) query).list();
        List<Task> result = new ArrayList<>();
        for(Task t: task){
            if(t.getEndDate().equals("0")) {
                result.add(t);
            } else if (!LocalDate.parse(t.getEndDate()).isBefore(LocalDate.now())) {
                result.add(t);
            }
        }
        return result;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Task> archiveByOwner(int owner) {

        List <Task> task = allByOwner(owner);
        List<Task> result = new ArrayList<>();
        for(Task t: task){
            System.out.println("===============================================" + t.getEndDate());
            if(!t.getEndDate().equals("0")) {
                if (LocalDate.parse(t.getEndDate()).isBefore(LocalDate.now())) {
                    result.add(t);
                    System.out.println("=== ADD");
                }
            }
        }
        return result;
    }

    @Override
    public List<Day> statByYear(int ownerId) {
        List<Task> tasks;
        List<Day> days = new ArrayList<>();
        int[] Vmin = new int[96];
        for (int i = 0; i < 95; i++) { Vmin[i] = 0; }
        int Vstart;
        int Vend;
        int j = 0;
        Day first = new Day();
        first.setAll(LocalDate.now().minusDays(365).toString(), 0, Vmin);
        days.add(j, first);
        for (int i = 364; i > 0; i--) {
            Day temp = new Day();
            tasks = allByDay(LocalDate.now().minusDays(i).toString(), ownerId);
            if ((LocalDate.now().minusDays(i).getMonthValue() == LocalDate.parse(days.get(j).getToday()).getMonthValue())
                    && (LocalDate.now().minusDays(i).getYear() == LocalDate.parse(days.get(j).getToday()).getYear())) {
                temp = days.get(j);
                if ((!tasks.isEmpty()) && tasks.size() > 0) {
                    temp.addCount(tasks.size());
                    for (Task task : tasks) {
                        Vstart = task.getT_start().convTimeToMin();
                        Vend = task.getDuration().convTimeToMin();
                        temp.addVmin(Vstart, Vend);
                        temp.addPopMaster(task);
                        temp.addPopType(task);
                        temp.addPopLocation(task);
                    }
                } else {
                    temp.addCount(0);
                }
                days.set(j, temp);
            } else {
                temp.setToday(LocalDate.now().minusDays(i).toString());
                calc_TC(tasks, days, temp);
                j++;
            }
            tasks.clear();
        }
        return days;
    }

    @Override
    public List<Day> statByMonth(String startDay, int ownerId) {
        List<Task> tasks;
        List<Day> days = new ArrayList<>();
        int[] Vmin = new int[96];
        for (int i = 0; i < 95; i++) {
            Vmin[i] = 0;
        }
        int calcMonth = LocalDate.parse(startDay).lengthOfMonth();
        if (LocalDate.parse(startDay).plusDays(calcMonth).isAfter(LocalDate.now())) {
            calcMonth = LocalDate.now().getDayOfMonth() - 1;
        }
        for (int i = 0; i < calcMonth; i++) {
            Day temp = new Day();
            tasks = allByDay(LocalDate.parse(startDay).plusDays(i).toString(), ownerId);

            temp.setToday(LocalDate.parse(startDay).plusDays(i).toString());
            calc_TC(tasks, days, temp);
            tasks.clear();
        }
        return days;
    }

    private void calc_TC(List<Task> tasks, List<Day> days, Day temp) {
        int Vstart;
        int Vend;
        if ((!tasks.isEmpty()) && tasks.size() > 0) {
            temp.setTaskCount(tasks.size());
            for (Task task : tasks) {
                Vstart = task.getT_start().convTimeToMin();
                Vend = task.getDuration().convTimeToMin();
                temp.addVmin(Vstart, Vend);
                temp.addPopMaster(task);
                temp.addPopType(task);
                temp.addPopLocation(task);
            }
        } else {
            temp.setTaskCount(0);
        }
        days.add(temp);
    }

    @Override
    public List<WeekList> dwnldWeek(int owId, int wOrM) {
        List<WeekList> outList = new ArrayList<>();
        String date;
        LocalDate temp;
        for (int i = 0; i < wOrM; i++) {
            WeekList w = new WeekList();
            temp = LocalDate.now().plusDays(i);
            date = "";
            date += temp.getDayOfMonth();
            switch (temp.getMonthValue()) {
                case 1:
                    date += " января ";
                    break;
                case 2:
                    date += " февраля ";
                    break;
                case 3:
                    date += " марта ";
                    break;
                case 4:
                    date += " апреля ";
                    break;
                case 5:
                    date += " мая ";
                    break;
                case 6:
                    date += " июня ";
                    break;
                case 7:
                    date += " июля ";
                    break;
                case 8:
                    date += " августа ";
                    break;
                case 9:
                    date += " сентября ";
                    break;
                case 10:
                    date += " октября ";
                    break;
                case 11:
                    date += " ноября ";
                    break;
                case 12:
                    date += " декабря ";
                    break;
            }
            date += temp.getYear();
            switch (temp.getDayOfWeek()) {
                case MONDAY:
                    date += " (Пн)";
                    break;
                case TUESDAY:
                    date += " (Вт) ";
                    break;
                case WEDNESDAY:
                    date += " (Ср) ";
                    break;
                case THURSDAY:
                    date += " (Чт) ";
                    break;
                case FRIDAY:
                    date += " (Пт) ";
                    break;
                case SATURDAY:
                    date += " (Сб) ";
                    break;
                case SUNDAY:
                    date += " (Вс) ";
                    break;
            }
            w.setDate(date);
            List<Task> tempTL = sortBB(allByDay(temp.toString(), owId));
            if(tempTL.isEmpty()||tempTL.size()<1){w.setEmptyDay("<tr><td colspan=\"7\">--</td></tr>");}
            w.setTasks(tempTL);
            outList.add(w);
        }
        return outList;
    }

    public static List<Task> sortBB(List<Task> data) {
        int dataLength = data.size();
        Task swap;
        boolean sorted;

        for (int i = 0; i < dataLength; i++) {
            sorted = true;
            for (int j = 1; j < (dataLength - i); j++) {
                if (data.get(j - 1).getT_start().convTimeToMin() > data.get(j).getT_start().convTimeToMin()) {
                    swap = data.get(j - 1);
                    data.set(j - 1, data.get(j));
                    data.set(j, swap);
                    sorted = false;
                }
            }
            if (sorted) {
                break;
            }
        }
        return data;
    }
}

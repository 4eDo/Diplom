package kmrd.dn.controller;

import java.time.LocalDate;
import java.util.List;

import kmrd.dn.model.*;
import kmrd.dn.service.TaskService;
import kmrd.dn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes(value = "userData")
public class MainController {

    private UserService userService;
    private TaskService taskService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setTaskService(TaskService tService) {
        this.taskService = tService;
    }

    public ModelAndView noUser(LoginData udata) {
        if (udata.getUserID() < 1) {
            ModelAndView modelAndView = new ModelAndView();
            udata.clearData();
            modelAndView.addObject("userData", udata);
            modelAndView.setViewName("redirect:/loginPage");
            return modelAndView;
        } else {
            return null;
        }
    }
// ====================================================================================================================
// === З А Д А Ч И
// ====================================================================================================================

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView allTasks(@ModelAttribute("userData") LoginData udata) {
        List<Task> tasks = taskService.allByDay(LocalDate.now().toString(), udata.getUserID());
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("tasks");
            modelAndView.addObject("TaskDate", LocalDate.now());
            modelAndView.addObject("tasksList", tasks);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/{day}", method = RequestMethod.GET)
    public ModelAndView dayTasks(
            @PathVariable("day") String day,
            @ModelAttribute("userData") LoginData udata
    ) {
        List<Task> tasks = taskService.allByDay(day, udata.getUserID());
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("tasks");
            modelAndView.addObject("TaskDate", LocalDate.parse(day));
            modelAndView.addObject("tasksList", tasks);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public ModelAndView all(@ModelAttribute("userData") LoginData udata) {
        List<Task> tasks = taskService.actualByOwner(udata.getUserID());
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("allTasks");
            modelAndView.addObject("tasksList", tasks);
            modelAndView.addObject("TaskDate", LocalDate.now());
            modelAndView.addObject("type", "cur");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/all/archive", method = RequestMethod.GET)
    public ModelAndView archive(@ModelAttribute("userData") LoginData udata) {
        List<Task> archive = taskService.archiveByOwner(udata.getUserID());
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("allTasks");
            modelAndView.addObject("tasksList", archive);
            modelAndView.addObject("TaskDate", LocalDate.now());
            modelAndView.addObject("type", "arc");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/edit/{id}/{day}", method = RequestMethod.GET)
    public ModelAndView editPage(
            @PathVariable("id") int id,
            @PathVariable("day") String day,
            @ModelAttribute("userData") LoginData udata
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("editPage");
            modelAndView.addObject("task", taskService.getById(id));
            modelAndView.addObject("TaskDate", LocalDate.parse(day));
        }
        return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView editTask(
            @RequestParam("task.id") int id,
            @ModelAttribute("task") Task task,
            @ModelAttribute("userData") LoginData udata,
            BindingResult result
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            task.setId(id);
            task.setOwnerId(udata.getUserID());
            taskService.edit(task);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/editOne", method = RequestMethod.POST)
    public ModelAndView editTaskOne(
            @RequestParam("task.id") int id,
            @RequestParam("startDate") String day,
            @ModelAttribute("task") Task task,
            @ModelAttribute("userData") LoginData udata,
            BindingResult result
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            task.setOwnerId(udata.getUserID());
            taskService.editOne(taskService.getById(id), task, day);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/editAfter", method = RequestMethod.POST)
    public ModelAndView editTaskAfter(
            @RequestParam("task.id") int id,
            @RequestParam("startDate") String day,
            @ModelAttribute("task") Task task,
            @ModelAttribute("userData") LoginData udata,
            BindingResult result
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            task.setOwnerId(udata.getUserID());
            taskService.editAfter(taskService.getById(id), task, day);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPage(@ModelAttribute("userData") LoginData udata) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("editPage");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/add/{day}", method = RequestMethod.GET)
    public ModelAndView addOnDay(
            @PathVariable("day") String day,
            @ModelAttribute("userData") LoginData udata
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.addObject("TaskDate", day);
            modelAndView.setViewName("editPage");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addTask(
            @ModelAttribute("task") Task task,
            @ModelAttribute("userData") LoginData udata,
            BindingResult result
    ) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/");
        task.setOwnerId(udata.getUserID());
        taskService.add(task);
        return modelAndView;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteTask(
            @PathVariable("id") int id,
            @ModelAttribute("userData") LoginData udata
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            Task task = taskService.getById(id);
            taskService.delete(task);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteOne/{id}/{day}", method = RequestMethod.GET)
    public ModelAndView deleteTaskOne(
            @PathVariable("id") int id,
            @ModelAttribute("userData") LoginData udata,
            @PathVariable("day") String day
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            Task task = taskService.getById(id);
            taskService.deleteOne(task, day);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteAfter/{id}/{day}", method = RequestMethod.GET)
    public ModelAndView deleteTaskAfter(
            @PathVariable("id") int id,
            @PathVariable("day") String day,
            @ModelAttribute("userData") LoginData udata
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            Task task = taskService.getById(id);
            taskService.deleteAfter(task, day);
        }
        return modelAndView;
    }

    // ====================================================================================================================
// === П О Л Ь З О В А Т Е Л И
// ====================================================================================================================
    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public ModelAndView allUsers(@ModelAttribute("userData") LoginData udata) {
        List<User> users = userService.allUsers();
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("account");
            modelAndView.addObject("usersList", users);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/allUsers", method = RequestMethod.GET)
    public ModelAndView admAllUsers(@ModelAttribute("userData") LoginData udata) {
        List<User> users = userService.allUsers();
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("/allUsers");
            modelAndView.addObject("usersList", users);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/account/{id}", method = RequestMethod.GET)
    public ModelAndView viewUser(
            @PathVariable("id") int id,
            @ModelAttribute("userData") LoginData udata
    ) {
        User user = userService.getById(id);
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("account");
            modelAndView.addObject("user", user);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/account/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editAccount(
            @PathVariable("id") int id,
            @ModelAttribute("userData") LoginData udata
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("editAccount");
            modelAndView.addObject("user", userService.getById(id));
        }
        return modelAndView;
    }

    @RequestMapping(value = "/account/edit", method = RequestMethod.POST)
    public ModelAndView editUser(
            @ModelAttribute("user") User user,
            @ModelAttribute("userData") LoginData udata,
            BindingResult result
    ) {
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/");
            userService.edit(user);
            udata.setCustom(user);
            udata.setNameUser(user.getNameU());
            udata.setDefTTypes(user.getTaskTypes());
        }
        return modelAndView;
    }

    // ====================================================================================================================
// === Л О Г И Н
// ====================================================================================================================
    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public ModelAndView login(@ModelAttribute("userData") LoginData udata) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userData", new LoginData());
        modelAndView.setViewName("loginPage");
        return modelAndView;
    }

    @ModelAttribute("userData")
    public LoginData createLoginData() {
        return new LoginData();
    }

    @RequestMapping(value = "/loginPage/check-user")
    public ModelAndView checkUser(@ModelAttribute("userData") LoginData udata) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.findUser(udata.getMail(), udata.getPass());
        if (user == null) {
            modelAndView.setViewName("redirect:/loginPage");
            modelAndView.addObject("errMsg", "1");
        } else {
            modelAndView.setViewName("redirect:/");
            udata.setUserID(user.getId());
            udata.setNameUser(user.getNameU());
            udata.setCustom(user);
            udata.setDefTTypes(user.getTaskTypes());
            modelAndView.addObject("userData", udata);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(@ModelAttribute("userData") LoginData udata) {
        ModelAndView modelAndView = new ModelAndView();
        udata.clearData();
        modelAndView.addObject("userData", udata);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    // ====================================================================================================================
// === Р Е Г И С Т Р А Ц И Я
// ====================================================================================================================
    @RequestMapping(value = "/createAcc", method = RequestMethod.GET)
    public ModelAndView setUser() {
        List<User> users = userService.allUsers();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("createAcc");
        modelAndView.addObject("usersList", users);
        return modelAndView;
    }

    @RequestMapping(value = "/createAcc/new", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") User user, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView();
        userService.add(user);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    // ====================================================================================================================
// === С Т А Т И С Т И К А
// ====================================================================================================================
    @RequestMapping(value = "/statistics", method = RequestMethod.GET)
    public ModelAndView stat(@ModelAttribute("userData") LoginData udata) {

        List<Day> days = taskService.statByYear(udata.getUserID());

        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("statYear");
            modelAndView.addObject("TaskDate", LocalDate.now());
            modelAndView.addObject("daysList", days);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/statistics/{period}", method = RequestMethod.GET)
    public ModelAndView statYear(
            @PathVariable("period") String period,
            @ModelAttribute("userData") LoginData udata
    ) {

        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            if (period.equals("year")) {
                modelAndView.setViewName("statYear");
                List<Day> days = taskService.statByYear(udata.getUserID());
                modelAndView.addObject("daysList", days);
                period = "последний год";
            } else if (period.equals("month")) {
                modelAndView.setViewName("statMonth");
                List<Day> days = taskService.statByMonth(LocalDate.now().withDayOfMonth(1).toString(), udata.getUserID());
                modelAndView.addObject("daysList", days);
                period = "последний месяц";
            } else if (period.equals("week")) {
                modelAndView.setViewName("statWeek");
                List<Day> days = taskService.statByYear(udata.getUserID());
                modelAndView.addObject("daysList", days);
            } else {
                modelAndView.setViewName("statMonth");
                List<Day> days = taskService.statByMonth(LocalDate.parse(period).withDayOfMonth(1).toString(), udata.getUserID());
                modelAndView.addObject("daysList", days);
            }

            modelAndView.addObject("period", period);
        }
        return modelAndView;
    }

    // ====================================================================================================================
// === С К А Ч А Т Ь   Н А    Н Е Д Е Л Ю
// ====================================================================================================================
    @RequestMapping(value = "/download/{period}", method = RequestMethod.GET)
    public ModelAndView dwnld(
            @PathVariable("period") int period,
            @ModelAttribute("userData") LoginData udata
    ) {
        List<WeekList> weekList = taskService.dwnldWeek(udata.getUserID(), period);
        ModelAndView modelAndView = noUser(udata);
        if (modelAndView == null) {
            modelAndView = new ModelAndView();
            modelAndView.setViewName("download");
            modelAndView.addObject("weekList", weekList);
            modelAndView.addObject("endW", LocalDate.now().plusDays(period - 1).toString());
        }
        return modelAndView;
    }
}

package raider.project.ATM.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import raider.project.ATM.model.User;
import raider.project.ATM.model.UserProfile;
import raider.project.ATM.service.UserProfileService;
import raider.project.ATM.service.UserService;


@Controller
public class HelloWorldController {

    @Autowired
    UserProfileService userProfileService;

    @Autowired
    UserService userService;

    @RequestMapping(value = { "/","/login"}, method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }
    
    @RequestMapping(value =  "/home" , method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        model.addAttribute("greeting", "Hi, Welcome to mysite");
        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "admin";
    }

    @RequestMapping(value = "/db", method = RequestMethod.GET)
    public String dbaPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "dba";
    }

    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String newRegistration(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    /*
     * This method will be called on form submission, handling POST request It
     * also validates the user input
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveRegistration(@Valid User user,
                                   BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            System.out.println("There are errors");
            return "register";
        }
        UserProfile pro = new UserProfile();
        pro.setId(1);
        pro.setType("USER");
        Set<UserProfile> profile = new HashSet<>();
        profile.add(pro);
        user.setUserProfiles(profile);
        userService.save(user);

        System.out.println("First Name : " + user.getFirstName());
        System.out.println("Last Name : " + user.getLastName());
        System.out.println("SSO ID : " + user.getSsoId());
        System.out.println("Password : " + user.getPassword());
        System.out.println("Email : " + user.getEmail());
        System.out.println("Checking UsrProfiles....");

        System.out.println("Email : " + user.getUserProfiles());


        model.addAttribute("success", "User " + user.getFirstName() + " has been registered successfully");
        return "registrationsuccess";
    }




    private String getPrincipal(){
        String userName;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }


}
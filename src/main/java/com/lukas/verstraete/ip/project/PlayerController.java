package com.lukas.verstraete.ip.project;

import domain.Player;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import services.Service;


@Controller
@RequestMapping(value="/players")
@SessionAttributes("updatePlayer")
public class PlayerController {
    
    @Autowired
    private Service playerService;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getPlayers()
    {
        return new ModelAndView("players", "players", playerService.getAll());
    }
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView getNewForm()
    {
        return new ModelAndView("playerCreateForm", "player", new Player());
    }
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public String create(@ModelAttribute ("player") Player player, BindingResult result)
    {
//        try 
//        {
            playerService.add(player);
//        }
//        catch(Exception e)
//        {
//            result.addError(new ObjectError("username", e.getMessage()));
//        }
        if(result.hasErrors()) {
            for(ObjectError e : result.getAllErrors())
            {
                System.out.println(e.getCode());
            }
            return "playerCreateForm";
        }
        return "redirect:/players.htm";
    }
    
    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public ModelAndView getEditForm(@PathVariable String username)
    {
        return new ModelAndView("playerEditForm", "updatePlayer", playerService.get(username));
    }
    
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String update(@ModelAttribute ("updatePlayer") Player player, BindingResult result)
    {
        if(result.hasErrors())
            return "playerEditForm";
        playerService.update(player);
        return "redirect:/players.htm";
    }
}

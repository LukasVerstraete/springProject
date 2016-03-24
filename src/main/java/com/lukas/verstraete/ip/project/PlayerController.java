package com.lukas.verstraete.ip.project;

import domain.Player;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import services.Service;


@Controller
@RequestMapping(value="/players")
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
        return new ModelAndView("playerCreateForm", "player", new Player("Leen", "Leen", "Peeters"));
    }
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public String create(@ModelAttribute ("player") Player player)
    {
        playerService.add(player);
        return "redirect:/players.htm";
    }
    
    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public ModelAndView getEditForm(@PathVariable String username)
    {
        return new ModelAndView("playerEditForm", "player", playerService.get(username));
    }
    
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String update(@ModelAttribute ("player") Player player)
    {
        playerService.update(player);
        return "redirect:/players.htm";
    }
}

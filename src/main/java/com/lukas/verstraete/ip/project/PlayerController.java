package com.lukas.verstraete.ip.project;

import domain.Player;
import domain.PlayerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/players")
public class PlayerController {
    
    @Autowired
    private PlayerService service;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getPlayers()
    {
        return new ModelAndView("players", "players", service.getAllPlayers());
    }
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView getNewForm()
    {
        return new ModelAndView("playerForm", "player", new Player("Leen", "Leen", "Peeters"));
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String save(@ModelAttribute ("player") Player player)
    {
        service.addPlayer(player);
        return "redirect:/players.htm";
    }
    
    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public ModelAndView getEditForm(@PathVariable String username)
    {
        return new ModelAndView("playerForm", "player", service.getPlayer(username));
    }
}

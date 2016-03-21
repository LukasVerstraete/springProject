package com.lukas.verstraete.ip.project;

import domain.Player;
import domain.PlayerService;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
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
}

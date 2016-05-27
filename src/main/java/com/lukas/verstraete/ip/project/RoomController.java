package com.lukas.verstraete.ip.project;

import domain.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import services.room.RoomService;


@Controller
@RequestMapping("/rooms")
@SessionAttributes("updateRoom")
public class RoomController {
    
    @Autowired
    public RoomService roomService;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getRooms()
    {
        return new ModelAndView("rooms", "rooms", roomService.getAll());
    }
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView getNewForm()
    {
        return new ModelAndView("roomCreateForm", "room", new Room());
    }
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public String create(@Validated @ModelAttribute ("room") Room room, BindingResult result)
    {
        try 
        {
            roomService.add(room);
        }
        catch(Exception e)
        {
            System.err.println(e.getMessage());
        }
        if(result.hasErrors())
            return "roomCreateForm";
        return "redirect:/rooms.htm";
    }
    
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public ModelAndView getEditForm(@PathVariable String name)
    {
        return new ModelAndView("roomEditForm", "updateRoom", roomService.get(name));
    }
    
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String update(@Validated @ModelAttribute ("updateRoom") Room room, BindingResult result)
    {
        if(result.hasErrors())
            return "roomEditForm";
        roomService.update(room);
        return "redirect:/rooms.htm";
    }
    
    @RequestMapping(value="/delete/{name}", method=RequestMethod.POST)
    public String delete(@PathVariable String name)
    {
        roomService.delete(roomService.get(name));
        return "redirect:/rooms.htm";
    }
}

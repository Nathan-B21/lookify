package com.bludworth.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bludworth.lookify.models.Track;
import com.bludworth.lookify.services.TrackService;

@Controller
public class MainController {
	private final TrackService trackService;
	
	public MainController(TrackService trackService) {
		this.trackService = trackService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Track> tracks = trackService.allTracks();
		model.addAttribute("tracks", tracks);
		model.addAttribute("artist", new Track());
		return "dashboard.jsp";
	}

	
	//render add a song page
	@RequestMapping("/songs/new")
	public String newPage(@ModelAttribute("track") Track track) {
		return "new.jsp";
	}
	@RequestMapping(value="/addtrack", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("track") Track track, BindingResult result) {
		if (result.hasErrors()) {
			return "new.jsp";
		}else {
			trackService.createTrack(track);
			return "redirect:/dashboard";
		}
	}
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		trackService.deleteTrack(id);
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/songs/{id}")
	public String trackDetails(@PathVariable("id") Long id, Model model) {
		Track track = trackService.findTrack(id);
		
//		if(language!=null) {
		model.addAttribute("track", track);	
//		}
		return "/details.jsp";
	}
	
	@RequestMapping("/search/artist")
	public String searchbyArtist(@RequestParam("artist") String artist, Model model) {
		List<Track> tracks = trackService.searchByArtist(artist);
		model.addAttribute("tracks", tracks);
		String newString = displayArtist(artist); // USING THE HELPER METHOD TO DISPLAY THE ARTIST AS A STRING
		model.addAttribute("artist", newString);
		
		return "search.jsp";
	}
	
	//HELPER METHOD TO DISPLAY ARTIST AS A STRING
	public String displayArtist(@Valid @ModelAttribute("artist") String artist) {
		String thisartist = artist.toString();
		return thisartist;
	}
	
	
	@RequestMapping("/search/topTen")
		public String topTen(Model model) {
			List<Track> tracks = trackService.topTenSongs();
			model.addAttribute("tracks", tracks);
			return "topTen.jsp";
		}
	
	
	
	
}

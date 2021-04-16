package com.bludworth.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.bludworth.lookify.models.Track;
import com.bludworth.lookify.repositories.TrackRepository;

@Service
public class TrackService {
	private final TrackRepository trackRepository;
	
	public TrackService(TrackRepository trackRepository) {
		this.trackRepository = trackRepository;
	}
	 // returns all the tracks
    public List<Track> allTracks() {
        return trackRepository.findAll();
    }
    // creates a track
    public Track createTrack(Track t) {
        return trackRepository.save(t);
    }
    // retrieves a track
    public Track findTrack(Long id) {
        Optional<Track> optionalTrack = trackRepository.findById(id);
        if(optionalTrack.isPresent()) {
            return optionalTrack.get();
        } else {
            return null;
        }
    }
    public void deleteTrack(Long id) {
    	trackRepository.deleteById(id);
    }
    
    public List<Track> searchByArtist(String artist){
    	return trackRepository.findByArtistContaining(artist);
    }
    
    public List<Track> topTenSongs(){
    	return trackRepository.findTop10ByOrderByRatingDesc();
    }
    

}

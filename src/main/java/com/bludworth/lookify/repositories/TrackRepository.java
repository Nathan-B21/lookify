package com.bludworth.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bludworth.lookify.models.Track;

@Repository 
public interface TrackRepository extends CrudRepository<Track, Long>{
	List<Track> findAll();
	
	List<Track> findByArtistContaining(String artist);
	List<Track> findTop10ByOrderByRatingDesc();
	
	
}

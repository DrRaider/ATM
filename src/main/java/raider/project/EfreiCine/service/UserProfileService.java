package raider.project.EfreiCine.service;

import java.util.List;

import raider.project.EfreiCine.model.UserProfile;


public interface UserProfileService {

    List<UserProfile> findAll();

    UserProfile findByType(String type);

    UserProfile findById(int id);
}
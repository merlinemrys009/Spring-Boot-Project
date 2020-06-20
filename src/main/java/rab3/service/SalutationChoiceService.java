package rab3.service;

import java.util.List;

public interface SalutationChoiceService {
	
	List<String> findDifferentChoices();
	public List<String> findSalutationsByChoice(String choice);

}

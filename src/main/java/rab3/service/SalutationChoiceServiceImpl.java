package rab3.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rab3.dao.SalutationChoiceRepository;



@Service
public class SalutationChoiceServiceImpl implements SalutationChoiceService {
	
	@Autowired
	private SalutationChoiceRepository choiceRepository;

	@Override
	public List<String> findDifferentChoices(){
		return choiceRepository.findDifferentChoices();
	}


	@Override
	public List<String> findSalutationsByChoice(String choice){
		return choiceRepository.findDistinctByChoice(choice);
	}

}

package rab3.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import rab3.dao.entity.SalutationChoiceEntity;

public interface SalutationChoiceRepository extends JpaRepository<SalutationChoiceEntity,Integer> {
	
	@Query("SELECT DISTINCT p.salutation FROM SalutationChoiceEntity p  where p.choice =?1")
	public List<String> findDistinctByChoice(String choice);

	@Query("SELECT DISTINCT choice FROM SalutationChoiceEntity")
	public List<String> findDifferentChoices();

}

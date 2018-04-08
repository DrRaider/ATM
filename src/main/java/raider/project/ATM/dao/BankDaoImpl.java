package raider.project.ATM.dao;

import org.springframework.stereotype.Repository;
import raider.project.ATM.model.Bank;

@Repository("bankDao")
public class BankDaoImpl extends AbstractDao<Integer, Bank> implements BankDao{

    public void save(Bank bank) {
        persist(bank);
    }

    public Bank findById(int id) {
        return getByKey(id);
    }
}

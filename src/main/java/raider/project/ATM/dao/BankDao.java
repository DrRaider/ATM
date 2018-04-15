package raider.project.ATM.dao;

import raider.project.ATM.model.Bank;

public interface BankDao {
    void save(Bank bank);

    Bank findById(int id);
}

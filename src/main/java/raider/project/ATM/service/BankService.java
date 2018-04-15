package raider.project.ATM.service;

import raider.project.ATM.model.Bank;

public interface BankService {
    void save(Bank bank);

    Bank findById(int id);

}

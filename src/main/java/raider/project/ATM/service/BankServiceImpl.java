package raider.project.ATM.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import raider.project.ATM.dao.BankDao;
import raider.project.ATM.model.Bank;

@Service("bankService")
@Transactional
public class BankServiceImpl implements BankService {

    @Autowired
    BankDao dao;


    @Override
    public void save(Bank bank) {
        dao.save(bank);
    }

    @Override
    public Bank findById(int id) {
        return dao.findById(id);
    }
}

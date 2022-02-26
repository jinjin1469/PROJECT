package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    // 아이디 중복 체크
    @Override
    public int idCheck(String id) {
        int cnt = userRepository.idCheck(id);
        return cnt;
    }
}
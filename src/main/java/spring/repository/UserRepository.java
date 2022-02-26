package spring.repository;

public interface UserRepository {
    // 아이디 중복 체크
    public int idCheck(String id);
}

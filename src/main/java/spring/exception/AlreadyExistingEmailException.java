package spring.exception;

public class AlreadyExistingEmailException extends RuntimeException {

	public AlreadyExistingEmailException(String msg) {
		super(msg);
	}

}

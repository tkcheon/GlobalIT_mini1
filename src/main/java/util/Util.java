package util;

import java.util.Properties;
import java.util.Random;

import jakarta.mail.Authenticator;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vo.MemberVo;

public class Util {

	// 입력된 문자를 MD5형식의 해시 코드로 변환, 보안성 높이는 용도
	// MD5형식은 보안이 다른 것보다 취약하나 미니프로젝트이기때문에 암호화했다는 것만 담기 위해 사용
	// 대체로 보안성 좋은 SHA3-?을 사용하거나 랜덤으로 salt를 붙여 사용하거나 pepper를 사용하거나 bcrypt,argon2를
	// 사용가능(뒤로 갈수록 보안성 높음)
	public static String MD5(String md5) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException e) {
		}
		return null;
	}

	// HTML 이스케이프 처리
	public static String escapeHtml(String input) {
		if (input == null)
			return null;

		return input.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;")
				.replaceAll("'", "&#x27;").replaceAll("/", "&#x2F;");
	}

	// 로그인 확인 메서드
	public static boolean isLogIn(HttpServletRequest request) {
		// 새 세션을 만들지 않고 이미 있는 세션을 가져옴
		HttpSession session = request.getSession(false);
		return (session != null && session.getAttribute("member") != null);
	}

	// 관리자 확인 메서드
	public static boolean isAdmin(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			MemberVo mv = (MemberVo) session.getAttribute("member");
			return (mv != null && mv.getM_type() == 2);
		}
		return false;
	}

	// 임시 비밀번호 생성 메서드
	public static String generateTemporaryPassword() {
		char[] charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		StringBuilder tempPassword = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 8; i++) { // 임시 비밀번호 길이는 8자로 설정
			tempPassword.append(charSet[random.nextInt(charSet.length)]);
		}
		return tempPassword.toString();
	}

	
	// 이메일 전송 메서드
	public static void sendEmail(String to, String subject, String body) {
        String from = "tlswlsrhdtest@naver.com"; // 발신자 이메일 주소
        String host = "smtp.naver.com"; // 네이버 SMTP 서버 주소
        final String username = "tlswlsrhdtest@naver.com"; // SMTP 인증 사용자 이메일
        final String password = "xorhkd1234!@"; // SMTP 인증 비밀번호

        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "587"); // TLS 포트
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.put("mail.mime.charset", "UTF-8"); // 이메일 전송 시 UTF-8 인코딩 사용

        Session mailSession = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject, "UTF-8"); // 제목에 UTF-8 인코딩 설정
            message.setText(body, "UTF-8"); // 본문에 UTF-8 인코딩 설정

            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
    }
    
}


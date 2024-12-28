package org.dongthap.lietsi.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Value("${spring.mail.username}")
    private String from;


    @Async
    public void sendEmail(String recipient, String subject, String messageBody) {
        try {
            SimpleMailMessage mailMsg = new SimpleMailMessage();
            mailMsg.setFrom(from);
            mailMsg.setTo(recipient);
            mailMsg.setText(messageBody);
            mailMsg.setSubject(subject);
            javaMailSender.send(mailMsg);
            log.info("Mail sent to {} successfully", recipient);
        } catch (MailException exception) {
            log.debug("Failure occurred while sending email");
        }
    }

    public void sendVerifyCode(String email, String code) {
        String subject = "Nghĩa trang liệt sĩ tỉnh Đồng Tháp - Xác thực email";
        String body = String.format("Your verify code is: <h3>%s</h3>", code);
        sendEmail(email, subject, body);
    }

    public void sendPasswordResetCode(String email, String code) {
        String subject = "Nghĩa trang liệt sĩ tỉnh Đồng Tháp - Đặt lại mật khẩu";
        String body = String.format("""
            Mã xác thực đặt lại mật khẩu của bạn là: %s
            Mã này sẽ hết hạn sau 5 phút.
            Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.
            """, code);
        sendEmail(email, subject, body);
    }
}

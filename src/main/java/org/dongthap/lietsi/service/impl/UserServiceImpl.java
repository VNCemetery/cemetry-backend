package org.dongthap.lietsi.service.impl;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.entity.User;
import org.dongthap.lietsi.repository.UserRepository;
import org.dongthap.lietsi.service.UserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    @Override
    public void creatingTestingData() {
        if (userRepository.count() > 0) {
            return;
        }
        // Create testing data
        User user = User.builder()
                .username("admin")
                .email("locn562836@gmail.com")
                .password(new BCryptPasswordEncoder().encode("123456"))
                .build();

        userRepository.save(user);
    }
}

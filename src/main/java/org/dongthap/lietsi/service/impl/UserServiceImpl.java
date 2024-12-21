package org.dongthap.lietsi.service.impl;

import org.dongthap.lietsi.model.entity.User;
import org.dongthap.lietsi.repository.UserRepository;
import org.dongthap.lietsi.service.UserService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

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

    @Override
    public User getCurrentUser() {
        var username = SecurityContextHolder.getContext().getAuthentication().getName();
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
}

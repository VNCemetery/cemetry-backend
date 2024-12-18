package org.dongthap.lietsi.service;

import java.util.concurrent.CompletableFuture;

import org.dongthap.lietsi.model.entity.Log;
import org.dongthap.lietsi.model.entity.User;
import org.dongthap.lietsi.model.enums.LogAction;
import org.dongthap.lietsi.repository.LogRepository;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LogService {
    private final LogRepository logRepository;
    private final UserService userService;

    @Async
    public CompletableFuture<Void> log(LogAction action, String resource) {
        User currentUser = userService.getCurrentUser();
        Log log = Log.builder()
                .userId(currentUser.getId())
                .action(action)
                .resource(resource)
                .build();
        logRepository.save(log);
        return CompletableFuture.completedFuture(null);
    }

    @Async
    public CompletableFuture<Void> logAnonymous(LogAction action, String resource) {
        Log log = Log.builder()
                .action(action)
                .resource(resource)
                .build();
        logRepository.save(log);
        return CompletableFuture.completedFuture(null);
    }
}
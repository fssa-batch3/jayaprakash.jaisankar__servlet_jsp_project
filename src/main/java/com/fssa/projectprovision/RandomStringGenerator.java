package com.fssa.projectprovision;

import java.security.SecureRandom;

public class RandomStringGenerator {
    private static final String VALID_TODO_ID_PATTERN = "^[a-fA-F0-9]{32}$";
    private static final SecureRandom random = new SecureRandom();

    public static String generateRandomString(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int randomCharIndex = random.nextInt(16); // 16 characters in [0-9a-fA-F]
            char randomChar = "0123456789abcdefABCDEF".charAt(randomCharIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String randomTodoId = generateRandomString(32);
        System.out.println(randomTodoId);
        if (randomTodoId.matches(VALID_TODO_ID_PATTERN)) {
            System.out.println("Valid Todo ID");
        } else {
            System.out.println("Invalid Todo ID");
        }
    }
}

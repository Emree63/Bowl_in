package org.acme.api.mapper;

import org.acme.api.dto.UserDTO;
import org.acme.api.dto.UserTinyDTO;
import org.acme.hibernates.entities.UserEntity;
import java.security.MessageDigest;

public class UserMapper {

    private static final String HASH_ALGORITHM = "SHA-256";

    public static UserDTO toDto(UserEntity user) {
        return new UserDTO(user.id, user.getName(), user.getImage(), user.getMail(), UserStatsMapper.toDto(user.stats));
    }

    public static UserEntity toEntity(UserTinyDTO user) {
        try {
            MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
            byte[] hashedBytes = digest.digest(user.password.getBytes("UTF-8"));
            String hashedPassword = bytesToHex(hashedBytes);
            return new UserEntity(user.name.toLowerCase(), user.image, user.mail.toLowerCase(), hashedPassword);
        } catch (Exception ex) {
            throw new RuntimeException("Error hashing password", ex);
        }
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xFF & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}

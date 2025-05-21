package com.example.ecommerce.Utils;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.Common.LogObj;

import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.HexFormat;

public class CipherUtils {

    public static LogObj log = new LogObj(CipherUtils.class.getName());
    public static String RsaSignature = null;

    public static boolean verify(String hashCode, String signatureBase64, String publicKeyBase64) {
        log.info("Verifying...");

        if (signatureBase64 == null || signatureBase64.isEmpty() || publicKeyBase64 == null || publicKeyBase64.isEmpty()) {
            log.error("Signature or public key is null or empty");
            return false;
        }

        try {
            var originalText = hashCode;
            var publicKey = getPublicKeyFromString(publicKeyBase64);

            // Get an instance of Signature with SHA256withRSA algorithm
            Signature signature = Signature.getInstance("SHA256withRSA");

            // Initialize with the public key
            signature.initVerify(publicKey);

            // Update with the original text bytes
            signature.update(originalText.getBytes("UTF-8"));

            // Decode the signature from Base64
            byte[] signatureBytes = Base64.getDecoder().decode(signatureBase64);

            // Verify the signature
            var res = signature.verify(signatureBytes);
            log.info("Result: " + res);
            return res;
        } catch (Exception e) {
            log.error("Error verifying signature: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private static PublicKey getPublicKeyFromString(String publicKeyBase64) throws Exception{
        // Decode the Base64 encoded bytes
        byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyBase64);

        // Create X509EncodedKeySpec from the decoded bytes
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);

        // Get an RSA KeyFactory
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");

        // Generate PublicKey object
        return keyFactory.generatePublic(keySpec);
    }

    public static String hashText(String text) throws Exception {
//        log.info("Hashing text: " + text);

        // Định nghĩa thuật toán băm
        String typeSHA = "SHA-256";
        // Tạo đối tượng MessageDigest với thuật toán được chỉ định
        MessageDigest digest = MessageDigest.getInstance(typeSHA);

        // Băm chuỗi text
        byte[] hashedBytes = digest.digest(text.getBytes("UTF-8"));

        // Chuyển đổi mảng byte thành chuỗi hex
        return HexFormat.of().formatHex(hashedBytes);
    }

    public static void main(String[] args) throws Exception {

        Order o = new Order(1, 1, 1, ShippingStatus.Packaging, null, "1", "123123");
        OrderItem oi = new OrderItem(1, 1, 5);
        Product p = new Product(1, "Product 1", "Description", 100.0, "", null, 1, 1);
        oi.setProduct(p);
        o.getListOrderItem().add(oi);
        String hash = o.hashOrder();
        String oSignature = "C2CCqfKjjqBXrgZtF2KfjSCFGdN4pz3ldjHBFDF1XRbMx/ff0SGk82qEnl+0lYZ6TVwZyFYdB7lNdf/+gEuIwU2u8vrfHGsTPub9JdxsGYMDGteEQdTsh0bPlZ7fBYPVV8DRRx33MlaCETQjQHORdHuqaIE2pal81fVMTvdxle5JdWdimTZcm2d933I6mhbivuGd7V/ztbsz5raIYW8AXVtfhha0kj9kLrazknrY1MpnwJtqyHRYDiHt3H4wOiPMz4lrCiWiYnKp1BkBaIXpzCfXqUb8Th7xro3R6P/WZsVAmkxs4kM59CIRRHm5sg0y5SPcUG6glt468xIGW34=";
        o.setSignature(oSignature);

        String publicKey = "MIIBHjANBgkqhkiG9w0BAQEFAAOCAQsAMIIBBgKB/gg9vMhpl1+uuqshy4q8hfunHqC3//qtPiO4APZW+V3+YqkTSz3qbmKmwgkSIaXLspAONLZi6tVgulVcJ4/nZ+5E3Ynn6Vx9Y1Da+ScLZWBZBWieEATn1CVjr3QDSXikeDqqSrqVE0vtUuWyQ5piWLUsIdRe/Jxto9aEhstS7KGouq2v5hz1NSOrFDYl/cCOYWhuBlDESwyVQVsaxoD6swJIMFrzJ0ykYjyTTEuMZVnCleKvh3el9v1gVmtaIP2rpFken9yClpJ+BtGmhNmCEoP4Pt7WYUZyIlTqFbEZQ/TEmHs07QlghYiP1F7DinOHpL0L/vbqXnkkijY8YLrrAgMBAAE=";

        String signature = createSignature(hash);

        System.out.println("Verify: " + verify(hash, signature, publicKey));

    }

    public static String createSignature(String text) throws Exception{
        String privateKey = "MIIEqQIBADANBgkqhkiG9w0BAQEFAASCBJMwggSPAgEAAoH+CD28yGmXX666qyHLiryF+6ceoLf/+q0+I7gA9lb5Xf5iqRNLPepuYqbCCRIhpcuykA40tmLq1WC6VVwnj+dn7kTdiefpXH1jUNr5JwtlYFkFaJ4QBOfUJWOvdANJeKR4OqpKupUTS+1S5bJDmmJYtSwh1F78nG2j1oSGy1Lsoai6ra/mHPU1I6sUNiX9wI5haG4GUMRLDJVBWxrGgPqzAkgwWvMnTKRiPJNMS4xlWcKV4q+Hd6X2/WBWa1og/aukWR6f3IKWkn4G0aaE2YISg/g+3tZhRnIiVOoVsRlD9MSYezTtCWCFiI/UXsOKc4ekvQv+9upeeSSKNjxguusCAwEAAQKB/gLjEdPJfdB0pwsVWzceZPdsK6QU4VVBRHAB4UBq5o/BcnGVgznM+t+PWJER63yn18V0XI36KBcY/B20G13jrHqBYHSTrCINAPJNy5Ocf+aZOPZVzPnS9vQkME49aosbXsz6ZBRp7eke2fgCk4Eta7MII0/A+NCZ7hfTtF7dDW1SC5vu/zIWEM5v93cGYfxYpDqzskYu+ocbQvZiDsmT9itYzWMm+krgtUW5y4Nby2I31ZuHM3UlO5CdX21S6yfOS0OR9Kr6T6ilKY0+kBoHNaRPifc40RlUH0E1F+qucE0biuDJe/V4fkjVSsNgcFmSzW6QFlA55uGyPLDoVJV9An8zVZw4LPsZOWtWi45ny4rpk2lvAkm5ij5BZunP7JxnfDrmc7tgayUGg152yCH0TURSrEOhbSQzJbnNT/cBkb10n1JTGGtW10p6lL1ZUbjDpgqSTIENuQBwv7wgpNiKQUvna4zb8kzM/8ljO2nfjrIfk++nI2TgAClUApKLJtG/An8pGRD4ZL/gYLdVszvVzT6KXalcWJyDKmaYpsTutlOgUCjdpnqVLXUHhqaXj1mwSFImRUwQS0jAxMQRhEInR6lqVts9D7VKNBKcIMJk1cTU+UzG+zpmY7UDJWBpT3xpfS0CzDJBiFw92CVOjjBZQFNgcEfLHBKrv8nwj6H8a4nVAn8n3CnZVNQE2hkGsoZ5AgtzIwuTLuugLj/4+LhEwy0PDd+OYf709z1guVD4Wp5C3FxY9XnuNpkNPhXv3k+l4EyD6dI6w5NVcwZZ+HSujk4xXRSIVO9AgI5e/gJONrINaHZP06skfhg0dckiTFgBRwP4kR5dYZZKeNWebgDsG9BxAn8Yk2q4ftbWwD8hulpvkZpyd2vNUxfUv8g2RJPDA7iiRw0I7oKjLlmrNHPuccR6S+UECbBglgRdccylhOdiQdInSuUzcG9Cfj0aq+RTFBnuGV42JwlXLQyTYwhyMRv+oOIHqD/tPDOcr+IvRYvX80Voh/wGkzT/C2MgvWNqZIw5An8XVFEvISB8r/KYlySZVaENpp21P6GkTJ+dm8agLc7af/Jva4I4PkauRjxilcateSRM/bKetsv5YytuzhzlnLd6dgOFfC1PZx5uKMzazgyp3/b2c3Zk58iC5M7XHNgovLmaDw95h/fD8GxQiXeOD3p2M2PmdLFawWAZZevSOYHq";

        // Get an instance of Signature with SHA256withRSA algorithm
        Signature signature = Signature.getInstance("SHA256withRSA");

        // Initialize with the private key for signing
        signature.initSign(convertToPrivateKey(privateKey));

        // Update with the text bytes
        signature.update(text.getBytes("UTF-8"));

        // Generate the signature
        byte[] signatureBytes = signature.sign();

        log.info("Signature: " + Base64.getEncoder().encodeToString(signatureBytes));

        // Return Base64 encoded signature
        return Base64.getEncoder().encodeToString(signatureBytes);
    }

    public static PrivateKey convertToPrivateKey(String privateKeyBase64) throws Exception {
        // Decode the Base64 encoded bytes
        byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyBase64);

        // Create PKCS8EncodedKeySpec from the decoded bytes
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);

        // Get an RSA KeyFactory
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");

        // Generate PrivateKey object
        return keyFactory.generatePrivate(keySpec);
    }
}

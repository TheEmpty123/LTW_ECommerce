package com.example.ecommerce.Utils;

import com.example.ecommerce.Common.LogObj;

import java.security.MessageDigest;
import java.security.PublicKey;
import java.util.Base64;

public class CipherUtils {

    public static LogObj log = new LogObj(CipherUtils.class.getName());
    public static String RsaSignature = null;

    public static boolean verify(String hashCode, String signature, String publicKey) {
        log.info("Verifying signature with hashCode: \n" + hashCode + "\n, signature: \n" + signature + "\n, publicKey: \n" + publicKey);

        try {
            PublicKey pubKey = getPublicKeyFromString(publicKey);
            java.security.Signature sig = java.security.Signature.getInstance("SHA256withRSA");
            sig.initVerify(pubKey);
            sig.update(hashCode.getBytes());
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update(hashCode.getBytes());
            String fileHashBase64 = java.util.Base64.getEncoder().encodeToString(digest.digest());
            RsaSignature = fileHashBase64;
            return sig.verify(Base64.getDecoder().decode(signature));
        } catch (Exception e) {
            log.error("Error verifying signature: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private static PublicKey getPublicKeyFromString(String publicKey) {
        try {
            byte[] keyBytes = java.util.Base64.getDecoder().decode(publicKey);
            java.security.KeyFactory keyFactory = java.security.KeyFactory.getInstance("RSA");
            return keyFactory.generatePublic(new java.security.spec.X509EncodedKeySpec(keyBytes));
        } catch (Exception e) {
            log.error("Error converting string to public key: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public static String hashText(String text) throws Exception {
        String typeSHA = "SHA-256";
        MessageDigest messageDigest = MessageDigest.getInstance(typeSHA);
        byte[] hashBytes = messageDigest.digest(text.getBytes());
        return new String(Base64.getEncoder().encode(hashBytes));
    }

    public static void main(String[] args) {

    }
}

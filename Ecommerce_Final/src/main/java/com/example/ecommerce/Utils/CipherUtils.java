package com.example.ecommerce.Utils;

import com.example.ecommerce.Common.LogObj;

import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class CipherUtils {

    public static LogObj log = new LogObj(CipherUtils.class.getName());
    public static String RsaSignature = null;

    public static boolean verify(String hashCode, String signature, String publicKey) {
        log.info("Verifying signature with hashCode: \n" + hashCode + "\n, signature: \n" + signature + "\n, publicKey: \n" + publicKey);

        try {
            PublicKey pubKey = getPublicKeyFromString(publicKey);
            log.info("Public key: " + pubKey);
            java.security.Signature sig = java.security.Signature.getInstance("SHA256withRSA");
            sig.initVerify(pubKey);
            sig.update(hashCode.getBytes());
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update(hashCode.getBytes());
            String fileHashBase64 = java.util.Base64.getEncoder().encodeToString(digest.digest());
            RsaSignature = fileHashBase64;
            boolean res = sig.verify(Base64.getDecoder().decode(signature));
            log.info("Signature verification result: " + res);
            return res;
        } catch (Exception e) {
            log.error("Error verifying signature: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private static PublicKey getPublicKeyFromString(String key) throws Exception{
        // Remove any whitespace or newline characters
        key = key.replaceAll("\\s+", "");

        // Decode the Base64 encoded string
        byte[] keyBytes = Base64.getDecoder().decode(key);

        // Generate the public key
        X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(spec);
    }

    public static String hashText(String text) throws Exception {
        String typeSHA = "SHA-256";
        MessageDigest messageDigest = MessageDigest.getInstance(typeSHA);
        byte[] hashBytes = messageDigest.digest(text.getBytes());
        return new String(Base64.getEncoder().encode(hashBytes));
    }

    public static void main(String[] args) throws Exception {
        String publickey = "MIIBHjANBgkqhkiG9w0BAQEFAAOCAQsAMIIBBgKB/grUJ2edlwdoFEVZZYaWaJTSCwr+KUfUF8Od0WobAfnH4ojHp45Elj0H52gsVNCyiItzRca8xitN+EcHpV131pWzg+/ylSY1DELCgPIqfyHOz7rx1lLOCcC9e431fazPikxKNICUgsMHOksyH/KwozSb1YVK9kzc9FVPFftFMsUjyWxHkOG8LuuQ317Abkxd95Pb927CYZo3w0aEA3e6bg5/OckwelsbSUoRDyNpSTxmseacMJigNq4BV2IfimjbcQfNVdpDokoXSU901jBv1oNFP/HfZ6j2xw+KDB7p/0i6xGWwCRGGgcBT+1RPpKKwC2/28MoAjP+pe8NDASb/AgMBAAE=";
        var key = getPublicKeyFromString(publickey);

        System.out.println(key.toString());
    }
}

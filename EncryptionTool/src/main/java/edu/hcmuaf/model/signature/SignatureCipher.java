package edu.hcmuaf.model.signature;

import java.io.*;
import java.math.BigInteger;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class SignatureCipher {
    private static final String RSA_ALGORITHM = "RSA";
    private static final String DSA_ALGORITHM = "DSA";
    private static final String SIGN_ALGORITHM = "SHA256withRSA";
    private static final String SIGNDSA_ALGORITHM = "SHA1withDSA";
    private PublicKey publicKey;
    private PrivateKey privateKey;

    public KeyPair generateKeyPair(int size, String algorithm) throws NoSuchAlgorithmException {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance(algorithm);
        keyGen.initialize(size);
        KeyPair keyPair = keyGen.generateKeyPair();
        publicKey = keyPair.getPublic();
        privateKey = keyPair.getPrivate();
        return keyPair;
    }

    public String encodeKey(Key key) {
        return Base64.getEncoder().encodeToString(key.getEncoded());
    }

    //    public PrivateKey decodePrivateKey(String key) {
//        byte[] decodedKey = Base64.getDecoder().decode(key);
//
//    }
    public void saveKey(String encrypted, String file) throws Exception {
        try {
            DataOutputStream out = new DataOutputStream(new FileOutputStream(file));
            out.writeUTF(encrypted);
            System.out.println("Key saved to " + file);
        } catch (IOException e) {
            System.out.println("Error saving key: " + e.getMessage());
        }
    }

    public String loadKey(String file) throws Exception {
        try (DataInputStream in = new DataInputStream(new FileInputStream(file))) {
            String key = in.readUTF();
            System.out.println("Key loaded from " + file);
            return key;
        } catch (IOException e) {
            System.out.println("Error loading key: " + e.getMessage());
            return null;
        }
    }

    public String signData(String data, PrivateKey privateKey, String algorithm) throws NoSuchAlgorithmException, InvalidKeyException, UnsupportedEncodingException, SignatureException {
        Signature signature = Signature.getInstance(algorithm);
        signature.initSign(privateKey);
        signature.update(data.getBytes("UTF-8"));
        byte[] digitalSignature = signature.sign();
        return Base64.getEncoder().encodeToString(digitalSignature);
    }

    public boolean verifySignature(String data, String signature, PublicKey publicKey, String algorithm) throws NoSuchAlgorithmException, InvalidKeyException, SignatureException, UnsupportedEncodingException {
        Signature sign = Signature.getInstance(algorithm);
        sign.initVerify(publicKey);
        sign.update(data.getBytes("UTF-8"));
        byte[] digitalSignatureBytes = Base64.getDecoder().decode(signature);
//        System.out.println("Original Data:" + Base64.getDecoder().decode(digitalSignatureBytes));
        return sign.verify(digitalSignatureBytes);
    }

    public String verifySignature(String data, String signature, String publicKeyString, String algorithm) throws NoSuchAlgorithmException, InvalidKeyException, SignatureException, UnsupportedEncodingException, InvalidKeySpecException {
        byte[] decodedKey = Base64.getDecoder().decode(publicKeyString);
        KeyFactory keyFactory = KeyFactory.getInstance(RSA_ALGORITHM);
        PublicKey publicKey = keyFactory.generatePublic(new X509EncodedKeySpec(decodedKey));
        return verifySignature(data, signature, publicKey, algorithm) ? "Signature is valid" : "Signature is invalid";
    }

    public static void main(String[] args) {
        SignatureCipher signatureCipher = new SignatureCipher();
        try {
            KeyPair keyPair = signatureCipher.generateKeyPair(2048, RSA_ALGORITHM);
            String publicKeyString = Base64.getEncoder().encodeToString(keyPair.getPublic().getEncoded());
            String privateKeyString = Base64.getEncoder().encodeToString(keyPair.getPrivate().getEncoded());
            System.out.println("Public Key: " + publicKeyString);
            System.out.println("Private Key: " + privateKeyString);
            String data = "Hello,my name is Dang Tran Tan Luc";
            String signature = signatureCipher.signData(data, keyPair.getPrivate(), "SHA1withRSA");
            boolean isVerified = signatureCipher.verifySignature(data, signature, keyPair.getPublic(), "SHA1withRSA");

            System.out.println("Original Data: " + data);
            System.out.println("Signature: " + signature);
            System.out.println("Is Verified: " + isVerified);
            System.out.println("Verification Result: " + signatureCipher.verifySignature(data, signature, publicKeyString, "SHA1withRSA"));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
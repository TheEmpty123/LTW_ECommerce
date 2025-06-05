package edu.hcmuaf.controller;

import edu.hcmuaf.model.signature.SignatureCipher;
import edu.hcmuaf.view.SignatureUI;

import javax.swing.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.*;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;

public class SignatureController {
    private SignatureCipher signatureCipher;
    private SignatureUI signatureUI;
    private JComboBox<String> listAsymAlgorithmComboBox;
    private JComboBox<String> listSignAlgorithmComboBox;
    private JComboBox<Integer> listSizeComboBox;
    private String publicKey;
    private String privateKey;
    private KeyPair keyPair;

    public SignatureController(SignatureUI signatureUI) {
        this.signatureCipher = new SignatureCipher();
        this.signatureUI = signatureUI;
        this.listAsymAlgorithmComboBox = signatureUI.getAlgoAsymCombo();
        this.listSignAlgorithmComboBox = signatureUI.getAlgoSignCombo();
        this.listSizeComboBox = signatureUI.getSizeOfKey();
        initController();
    }

    public void initController() {
        signatureUI.setCreateKeyButtonListener(e -> createKeyListener());
        signatureUI.setSaveKeyButtonListener(e -> saveKeyListener());
        signatureUI.setSavePrivateKeyButtonListener(e -> savePrivateListener());
        signatureUI.setLoadKeyButtonListener(e -> loadKeyListener());
        signatureUI.setSignButtonListener(e -> signatureListener());
        signatureUI.setVerifyKeyButtonListener(e -> verifyListener());
        signatureUI.setResetButtonListener(e -> resetListener());
        listAsymAlgorithmComboBox.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == ItemEvent.SELECTED) {
                    updateComboBoxes();
                }
            }
        });

        updateComboBoxes();
    }


    private void updateComboBoxes() {
        String algoAsymSelected = listAsymAlgorithmComboBox.getSelectedItem().toString();
        listSizeComboBox.removeAllItems();
        listSignAlgorithmComboBox.removeAllItems();

        switch (algoAsymSelected) {
            case "RSA":
                this.addItems(listSignAlgorithmComboBox,  "SHA256withRSA");
                this.addItems(listSizeComboBox, 512, 1024, 2048, 3072, 4096);
                break;
            default:
                JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
        }
    }

    private void addItems(JComboBox<String> comboBox, String... items) {
        for (String item : items) {
            comboBox.addItem(item);
        }
    }

    private void addItems(JComboBox<Integer> comboBox, Integer... items) {
        for (Integer item : items) {
            comboBox.addItem(item);
        }
    }
//    private void updateComboBoxes() {
//        String algoAsymSelected = listAsymAlgorithmComboBox.getSelectedItem().toString();
//        listSizeComboBox.removeAllItems();
//        listSignAlgorithmComboBox.removeAllItems();
//
//        switch (algoAsymSelected) {
//            case "RSA":
//                this.addItems(listSignAlgorithmComboBox, "SHA1withRSA", "SHA256withRSA", "SHA384withRSA", "SHA512withRSA");
//                this.addItems(listSizeComboBox, 512, 1024, 2048, 3072, 4096);
//                break;
//            case "DSA":
//                this.addItems(listSignAlgorithmComboBox, "SHA1withDSA", "SHA256withDSA", "SHA384withDSA", "SHA512withDSA");
//                this.addItems(listSizeComboBox, 1024, 2048, 3072);
//                break;
//            case "ECDSA":
//                this.addItems(listSignAlgorithmComboBox, "SHA1withECDSA", "SHA256withECDSA", "SHA384withECDSA", "SHA512withECDSA");
//                this.addItems(listSizeComboBox, 256, 384, 521);
//                break;
//            default:
//                JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
//        }
//    }
//
//    private void addItems(JComboBox<String> comboBox, String... items) {
//        for (String item : items) {
//            comboBox.addItem(item);
//        }
//    }
//
//    private void addItems(JComboBox<Integer> comboBox, Integer... items) {
//        for (Integer item : items) {
//            comboBox.addItem(item);
//        }
//    }

    private void createKeyListener() {
        System.out.println("Creating key...");
        String algoAsymSelected = listAsymAlgorithmComboBox.getSelectedItem().toString();
        String algoSignSelected = listSignAlgorithmComboBox.getSelectedItem().toString();
        int size = (int) listSizeComboBox.getSelectedItem();

        if (algoSignSelected == null) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            return;
        }
        if (algoAsymSelected == null) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            return;
        }
        try {
            switch (algoAsymSelected) {
                case "RSA":
                    this.keyPair = signatureCipher.generateKeyPair(size, algoAsymSelected);
                    publicKey = signatureCipher.encodeKey(keyPair.getPublic());
                    privateKey = signatureCipher.encodeKey(keyPair.getPrivate());
                    signatureUI.getPublicKeyArea().setText(publicKey);
                    System.out.println("Public Key: " + publicKey);
                    signatureUI.getPrivateKeyArea().setText(privateKey);
                    System.out.println("Private Key: " + privateKey);
                    JOptionPane.showMessageDialog(signatureUI, "Keys generated successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
                    break;
                case "DSA":
                    signatureCipher.generateKeyPair(size, algoAsymSelected);
                    this.keyPair = signatureCipher.generateKeyPair(size, algoAsymSelected);
                    publicKey = signatureCipher.encodeKey(keyPair.getPublic());
                    privateKey = signatureCipher.encodeKey(keyPair.getPrivate());
                    signatureUI.getPublicKeyArea().setText(publicKey);
                    signatureUI.getPrivateKeyArea().setText(privateKey);
                    JOptionPane.showMessageDialog(signatureUI, "Keys generated successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
                    break;
                case "ECDSA":
                    signatureCipher.generateKeyPair(size, algoAsymSelected);
                    this.keyPair = signatureCipher.generateKeyPair(size, algoAsymSelected);
                    publicKey = signatureCipher.encodeKey(keyPair.getPublic());
                    privateKey = signatureCipher.encodeKey(keyPair.getPrivate());
                    signatureUI.getPublicKeyArea().setText(publicKey);
                    signatureUI.getPrivateKeyArea().setText(privateKey);
                    JOptionPane.showMessageDialog(signatureUI, "Keys generated successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
                    break;
                default:
                    JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            }
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }


    private void saveKeyListener() {
        String puclicKey = signatureUI.getPublicKeyArea().getText();
        if (puclicKey == null ) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Key Selected");
            return;
        }
        JFileChooser chooser = new JFileChooser();
        int choice = chooser.showOpenDialog(signatureUI);
        if (choice == JFileChooser.APPROVE_OPTION) {
            String filePath = chooser.getSelectedFile().getAbsolutePath();
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath + ".pub"))) {
                bw.write("Public Key: " + puclicKey);
                JOptionPane.showMessageDialog(signatureUI, "Keys saved successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(signatureUI, "Error saving keys: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private void savePrivateListener() {
        String privateKey = signatureUI.getPrivateKeyArea().getText();
        if (privateKey == null ) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Key Selected");
            return;
        }
        JFileChooser chooser = new JFileChooser();
        int choice = chooser.showOpenDialog(signatureUI);
        if (choice == JFileChooser.APPROVE_OPTION) {
            String filePath = chooser.getSelectedFile().getAbsolutePath();
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath + ".prk"))) {
                bw.write("Private Key: " + privateKey);
                JOptionPane.showMessageDialog(signatureUI, "Keys saved successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(signatureUI, "Error saving keys: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private void loadKeyListener() {
        JFileChooser chooser = new JFileChooser();
        int choice = chooser.showOpenDialog(signatureUI);
        if (choice == JFileChooser.APPROVE_OPTION) {
            File file = chooser.getSelectedFile();
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                if (file.getName().endsWith(".pub")) {
                    signatureUI.getPublicKeyArea().setText(reader.readLine());
                } else if (file.getName().endsWith(".prk")) {
                    signatureUI.getPrivateKeyArea().setText(reader.readLine());
                } else {
                    JOptionPane.showMessageDialog(signatureUI, "Invalid file type!", "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }
                JOptionPane.showMessageDialog(signatureUI, "Key loaded successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
            } catch (IOException e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(signatureUI, "Error saving key!", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }


    private void signatureListener() {
        String data = signatureUI.getSignatureBeforeText().getText();
        String algoSignSelected = listSignAlgorithmComboBox.getSelectedItem().toString();
        String algoAsymSelected = listAsymAlgorithmComboBox.getSelectedItem().toString();
        String privateKey = signatureUI.getPrivateKeyArea().getText();
        String publicKey = signatureUI.getPublicKeyArea().getText();
//        PrivateKey privateKey1 = signatureCipher.decodeKey(privateKey);
        if (algoSignSelected == null) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            return;
        }
        if (algoAsymSelected == null) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            return;
        }
        try {
            String signature = signatureCipher.signData(data, keyPair.getPrivate(), algoSignSelected);
            System.out.println("Private kasyasdasd" + privateKey);
            signatureUI.getSignatureAfterText().setText(signature);
            JOptionPane.showMessageDialog(signatureUI, "Signature generated successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(signatureUI, "Error generating signature: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    private void resetListener() {
        this.signatureUI.getPublicKeyArea().setText("");
        this.signatureUI.getPrivateKeyArea().setText("");
        this.signatureUI.getSignatureBeforeText().setText("");
        this.signatureUI.getSignatureAfterText().setText("");
    }

    private void verifyListener() {
        String data = signatureUI.getSignatureBeforeText().getText();
        String signature = signatureUI.getSignatureAfterText().getText();
        String algoSignSelected = listSignAlgorithmComboBox.getSelectedItem().toString();
        String algoAsymSelected = listAsymAlgorithmComboBox.getSelectedItem().toString();
        if (algoSignSelected == null) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            return;
        }
        if (algoAsymSelected == null) {
            JOptionPane.showMessageDialog(signatureUI, "Invalid Algo Selected");
            return;
        }
        try {
            boolean isVerified = signatureCipher.verifySignature(data, signature, keyPair.getPublic(), algoSignSelected);
            System.out.println("publickeyyyyyyyy" + keyPair.getPublic());
            if (isVerified) {
                JOptionPane.showMessageDialog(signatureUI, "Signature verified successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(signatureUI, "Signature verification failed!", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(signatureUI, "Error verifying signature: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

}

package edu.hcmuaf.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class SignatureUI extends JPanel {
    private JPanel p1, p2, p4, p5;
    private JComboBox<String> algoAsymCombo;
    private JComboBox<String> algoSignCombo;
    private JComboBox<Integer> sizeOfKey;
    private JTextArea publicKeyArea, privateKeyArea, signatureBeforeText, signatureAfterText;
    private JLabel publicKeyLabel, privateKeyLabel, signatureBeforeLabel, signatureAfterLabel;
    private JButton createKeyButton, verifyKeyButton, signButton, resetButton, saveKeyButton, loadKeyButton, savePrivateKeyButton;

    public SignatureUI() {
        init();
    }

    public void init() {
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
        setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.HORIZONTAL;

        p5 = new JPanel(new GridBagLayout());
        p5.setBorder(BorderFactory.createTitledBorder("Options"));

        JLabel algoLabel = new JLabel("Asymmetric Algorithm:");
        gbc.gridx = 0;
        gbc.gridy = 0;
        p5.add(algoLabel, gbc);

        String[] asymAlgo = {"RSA"};
//        String[] asymAlgo = {"RSA", "DSA", "ECDSA"};
        algoAsymCombo = new JComboBox<>(asymAlgo);
        gbc.gridx = 1;
        gbc.gridy = 0;
        p5.add(algoAsymCombo, gbc);

        JLabel keySizeLabel = new JLabel("Key Size:");
        gbc.gridx = 0;
        gbc.gridy = 1;
        p5.add(keySizeLabel, gbc);

        Integer[] listSize = {512, 1024, 2048, 4096};
        sizeOfKey = new JComboBox<>(listSize);
        sizeOfKey.setSelectedItem(2048);
        gbc.gridx = 1;
        gbc.gridy = 1;
        p5.add(sizeOfKey, gbc);

        JLabel signLabel = new JLabel("Signature Algorithm:");
        gbc.gridx = 0;
        gbc.gridy = 2;
        p5.add(signLabel, gbc);

        String[] signAlgo = {
                "SHA256withRSA"
        };
//        String[] signAlgo = {
//                "SHA256withRSA", "SHA512withRSA", "SHA1withRSA",
//                "SHA1withDSA", "SHA256withDSA", "SHA512withDSA",
//                "SHA1withECDSA", "SHA256withECDSA", "SHA512withECDSA"
//        };
        algoSignCombo = new JComboBox<>(signAlgo);
        gbc.gridx = 1;
        gbc.gridy = 2;
        p5.add(algoSignCombo, gbc);

        createKeyButton = new JButton("Generate Key Pair");
        gbc.gridx = 1;
        gbc.gridy = 3;
        gbc.anchor = GridBagConstraints.EAST;
        p5.add(createKeyButton, gbc);

        this.add(p5);

        p1 = new JPanel(new GridBagLayout());
        p1.setBorder(BorderFactory.createTitledBorder("Key Operator"));

        publicKeyLabel = new JLabel("Public Key:");
        gbc.gridx = 0;
        gbc.gridy = 0;
        p1.add(publicKeyLabel, gbc);

        publicKeyArea = new JTextArea(3, 50);
        publicKeyArea.setLineWrap(true);
        publicKeyArea.setWrapStyleWord(true);
        JScrollPane publicKeyScroll = new JScrollPane(publicKeyArea);
        gbc.gridx = 1;
        gbc.gridy = 0;
        p1.add(publicKeyScroll, gbc);

        privateKeyLabel = new JLabel("Private Key:");
        gbc.gridx = 0;
        gbc.gridy = 1;
        p1.add(privateKeyLabel, gbc);

        privateKeyArea = new JTextArea(3, 50);
        privateKeyArea.setLineWrap(true);
        privateKeyArea.setWrapStyleWord(true);
        JScrollPane privateKeyScroll = new JScrollPane(privateKeyArea);
        gbc.gridx = 1;
        gbc.gridy = 1;
        p1.add(privateKeyScroll, gbc);

        saveKeyButton = new JButton("Save Public Key");
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        p1.add(saveKeyButton, gbc);

        loadKeyButton = new JButton("Load Key");
        gbc.gridx = 1;
        gbc.gridy = 2;
        p1.add(loadKeyButton, gbc);

        savePrivateKeyButton = new JButton("Save Private Key");
        gbc.gridx = 2;
        gbc.gridy = 2;
        p1.add(savePrivateKeyButton, gbc);

        this.add(p1);

        p2 = new JPanel(new GridBagLayout());
        p2.setBorder(BorderFactory.createTitledBorder("Signature for Text"));

        signatureBeforeLabel = new JLabel("Text to Sign:");
        gbc.gridx = 0;
        gbc.gridy = 0;
        p2.add(signatureBeforeLabel, gbc);

        signatureBeforeText = new JTextArea(5, 50);
        signatureBeforeText.setLineWrap(true);
        signatureBeforeText.setWrapStyleWord(true);
        JScrollPane beforeScroll = new JScrollPane(signatureBeforeText);
        gbc.gridx = 1;
        gbc.gridy = 0;
        p2.add(beforeScroll, gbc);

        signatureAfterLabel = new JLabel("Signature Result:");
        gbc.gridx = 0;
        gbc.gridy = 1;
        p2.add(signatureAfterLabel, gbc);

        signatureAfterText = new JTextArea(5, 50);
        signatureAfterText.setLineWrap(true);
        signatureAfterText.setWrapStyleWord(true);
        signatureAfterText.setEditable(false); // Chỉ đọc để hiển thị chữ ký
        JScrollPane afterScroll = new JScrollPane(signatureAfterText);
        gbc.gridx = 1;
        gbc.gridy = 1;
        p2.add(afterScroll, gbc);

        this.add(p2);

        p4 = new JPanel(new FlowLayout(FlowLayout.CENTER));
        p4.setBorder(BorderFactory.createTitledBorder("Actions"));

        signButton = new JButton("Sign");
        p4.add(signButton);

        verifyKeyButton = new JButton("Verify");
        p4.add(verifyKeyButton);

        resetButton = new JButton("Reset");
        p4.add(resetButton);

        this.add(p4);

    }

    public void setAlgoSymComboListener(ActionListener actionListener) {
        algoAsymCombo.addActionListener(actionListener);
    }

    public void setAlgoSignComboListener(ActionListener actionListener) {
        algoSignCombo.addActionListener(actionListener);
    }

    public void setListSizeListener(ActionListener actionListener) {
        sizeOfKey.addActionListener(actionListener);
    }

    public void setCreateKeyButtonListener(ActionListener actionListener) {
        createKeyButton.addActionListener(actionListener);
    }

    public void setVerifyKeyButtonListener(ActionListener actionListener) {
        verifyKeyButton.addActionListener(actionListener);
    }

    public void setSignButtonListener(ActionListener actionListener) {
        signButton.addActionListener(actionListener);
    }

    public void setResetButtonListener(ActionListener actionListener) {
        resetButton.addActionListener(actionListener);
    }

    public void setSaveKeyButtonListener(ActionListener actionListener) {
        saveKeyButton.addActionListener(actionListener);
    }

    public void setSavePrivateKeyButtonListener(ActionListener actionListener) {
        savePrivateKeyButton.addActionListener(actionListener);
    }

    public void setLoadKeyButtonListener(ActionListener actionListener) {
        loadKeyButton.addActionListener(actionListener);
    }

    public JComboBox<String> getAlgoAsymCombo() {
        return algoAsymCombo;
    }

    public void setAlgoAsymCombo(JComboBox<String> algoAsymCombo) {
        this.algoAsymCombo = algoAsymCombo;
    }

    public JComboBox<String> getAlgoSignCombo() {
        return algoSignCombo;
    }

    public void setAlgoSignCombo(JComboBox<String> algoSignCombo) {
        this.algoSignCombo = algoSignCombo;
    }

    public JComboBox<Integer> getSizeOfKey() {
        return sizeOfKey;
    }

    public void setSizeOfKey(JComboBox<Integer> sizeOfKey) {
        this.sizeOfKey = sizeOfKey;
    }

    public JTextArea getPublicKeyArea() {
        return publicKeyArea;
    }

    public void setPublicKeyArea(JTextArea publicKeyArea) {
        this.publicKeyArea = publicKeyArea;
    }

    public JTextArea getPrivateKeyArea() {
        return privateKeyArea;
    }

    public void setPrivateKeyArea(JTextArea privateKeyArea) {
        this.privateKeyArea = privateKeyArea;
    }

    public JTextArea getSignatureBeforeText() {
        return signatureBeforeText;
    }

    public void setSignatureBeforeText(JTextArea signatureBeforeText) {
        this.signatureBeforeText = signatureBeforeText;
    }

    public JTextArea getSignatureAfterText() {
        return signatureAfterText;
    }

    public void setSignatureAfterText(JTextArea signatureAfterText) {
        this.signatureAfterText = signatureAfterText;
    }

    public JLabel getPublicKeyLabel() {
        return publicKeyLabel;
    }

    public void setPublicKeyLabel(JLabel publicKeyLabel) {
        this.publicKeyLabel = publicKeyLabel;
    }

    public JLabel getPrivateKeyLabel() {
        return privateKeyLabel;
    }

    public void setPrivateKeyLabel(JLabel privateKeyLabel) {
        this.privateKeyLabel = privateKeyLabel;
    }

    public JLabel getSignatureBeforeLabel() {
        return signatureBeforeLabel;
    }

    public void setSignatureBeforeLabel(JLabel signatureBeforeLabel) {
        this.signatureBeforeLabel = signatureBeforeLabel;
    }

    public JLabel getSignatureAfterLabel() {
        return signatureAfterLabel;
    }

    public void setSignatureAfterLabel(JLabel signatureAfterLabel) {
        this.signatureAfterLabel = signatureAfterLabel;
    }

    public JButton getCreateKeyButton() {
        return createKeyButton;
    }

    public void setCreateKeyButton(JButton createKeyButton) {
        this.createKeyButton = createKeyButton;
    }

    public JButton getVerifyKeyButton() {
        return verifyKeyButton;
    }

    public void setVerifyKeyButton(JButton verifyKeyButton) {
        this.verifyKeyButton = verifyKeyButton;
    }

    public JButton getSignButton() {
        return signButton;
    }

    public void setSignButton(JButton signButton) {
        this.signButton = signButton;
    }

    public JButton getResetButton() {
        return resetButton;
    }

    public void setResetButton(JButton resetButton) {
        this.resetButton = resetButton;
    }

    public JButton getSaveKeyButton() {
        return saveKeyButton;
    }

    public void setSaveKeyButton(JButton saveKeyButton) {
        this.saveKeyButton = saveKeyButton;
    }

    public JButton getLoadKeyButton() {
        return loadKeyButton;
    }

    public void setLoadKeyButton(JButton loadKeyButton) {
        this.loadKeyButton = loadKeyButton;
    }
}
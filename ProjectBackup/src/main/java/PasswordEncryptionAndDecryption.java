public class PasswordEncryptionAndDecryption {
    public static final String ALPHABET = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    public static final int KEY = 3;

    public static String encrypt(String plainText) {
        plainText = plainText.toLowerCase();
        String cipherText = "";
        for (int i = 0; i < plainText.length(); i++) {
            int charPositionPT = ALPHABET.indexOf(plainText.charAt(i));
            int finalPosition = (charPositionPT + KEY) % 62;
            char replaceVal = ALPHABET.charAt(finalPosition);
            cipherText += replaceVal;
        }
        return cipherText;
    }

    public static String decrypt(String cipherText) {
        //cipherText = cipherText.toLowerCase();
        String plainText = "";
        for (int i = 0; i < cipherText.length(); i++) {
            int charPositionCT = ALPHABET.indexOf(cipherText.charAt(i));
            int finalPosition = (charPositionCT - KEY) % 62;
            if (finalPosition < 0) {
                finalPosition = finalPosition + 62;
            }
            char replaceVal = ALPHABET.charAt(finalPosition);
            plainText += replaceVal;
        }
        System.out.println(plainText);
        return plainText;
    }
}

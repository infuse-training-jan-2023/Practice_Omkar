public class Code {
    public static void main(String argu[]) {
       String str = "Hello World";
       char[] carray = str.toCharArray();
       System.out.println("Given string:" + str);
       System.out.print("Duplicate chars in given string are: ");
       for (int i = 0; i < str.length(); i++) {
          for (int j = i + 1; j < str.length(); j++) {
             if (carray[i] == carray[j]) {
                System.out.print(carray[j] + " ");
                break;
             }
          }
       }
    }
 }
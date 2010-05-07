import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		BufferedReader b = new BufferedReader(new InputStreamReader(System.in));
		int result = 0;
		try {
			do {
				String line = b.readLine();
				String parts[] = line.split("\\s");
				for(int i = 0; i < parts.length; ++i) {
					int num = Integer.parseInt(parts[i]);
					if (num < -1000 || num > 1000) {
						throw new OutOfRangeError();
					}
					if (!summationIsSafe(Math.abs(num), result)) {
						throw new OverflowError();
					}
					result += num * num;
				}
			} while(b.ready());
		} catch (IOException e) {
			System.err.println("IO Exception");
		} catch (OutOfRangeError e) {
			System.err.println("Out of range");
		} catch (NumberFormatException e) {
			System.err.println("Number format exception");
		} catch (OverflowError e) {
			System.err.println("Overflow");
		}
		System.out.println(result);
	}

	private static final int MAXBITS = Integer.numberOfTrailingZeros(Integer.highestOneBit(Integer.MAX_VALUE));
	
	private static boolean summationIsSafe(int a, int b) {
		int abits = Integer.numberOfTrailingZeros(Integer.highestOneBit(a)) + 1;
		int bbits = Integer.numberOfTrailingZeros(Integer.highestOneBit(b)) + 1;
		if (a == 0) abits = 0;
		if (b == 0) bbits = 0;
		return (abits < MAXBITS && bbits < MAXBITS);
	}

}

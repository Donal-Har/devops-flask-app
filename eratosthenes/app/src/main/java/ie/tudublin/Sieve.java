package ie.tudublin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Sieve {

    public List<Integer> sieve(int n) {
        boolean[] isComposite = new boolean[n + 1];
        Arrays.fill(isComposite, false);

        for (int i = 2; i * i <= n; i++) {
            if (!isComposite[i]) {
                for (int j = i * i; j <= n; j += i) {
                    isComposite[j] = true;
                }
            }
        }

        List<Integer> composites = new ArrayList<>();
        for (int i = 4; i <= n; i++) {
            if (isComposite[i]) {
                composites.add(i);
            }
        }

        return composites;
    }
}

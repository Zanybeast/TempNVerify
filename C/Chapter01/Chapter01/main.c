#include <stdio.h>

void P1_1(void);
void P1_0(void);
void E1_5(void);
void E1_6() {
    int c;

    while ((c = getchar()) != EOF) {
        putchar(c);
    }
}
void E1_7() {
    printf("%d\n", EOF);
}
void E1_8() {
    printf("hello world\n");
    int blankCount, tabCount, newlineCount;
    blankCount = tabCount = newlineCount = 0;
    int c;

    while ((c = getchar()) != EOF) {
        if (c == ' ')
            ++blankCount;
        else if (c == '\t')
            ++tabCount;
        else if (c == '\n')
            ++newlineCount;
    }
    printf("OMG\n");
    printf("blanks: %2d, tabs: %2d, lines: %2d", blankCount, tabCount, newlineCount);
}
void E1_9() {
    int c;
    int lastC;
    while ((c = getchar()) != EOF) {
        if (c != ' ')
            putchar(c);
        if (c == ' ') {
            if (lastC != ' ')
                putchar(c);
        }
        lastC = c;
    }
}
void E1_10() {
    int c;
    while ((c = getchar()) != EOF) {
        if (c == '\t') {
            putchar('\\');
            putchar('t');
        } else if (c == '\b') {
            putchar('\\');
            putchar('b');
        } else if (c == '\\') {
            putchar('\\');
            putchar('\\');
        } else {
            putchar(c);
        }
    }
}
void E1_12() {
    int IN = 1, OUT = 0;
    int c;

    int state = OUT;
    while ((c = getchar()) != EOF) {
        if (c == ' ' || c == '\n' || c == '\t') {
            if (state == IN) {
                putchar('\n');
                state = OUT;
            }
        } else if (state == OUT) {
            state = IN;
            putchar(c);
        } else {
            putchar(c);
        }
    }
}
void E1_13() {
    int LENGTH_SIZE = 30;
    int IN = 1, OUT = 0;
    int length[LENGTH_SIZE];
    int state;

    for (int i = 0; i < LENGTH_SIZE; ++i) {
        length[i] = 0;
    }

    int c;
    int wl = 0;
    state = OUT;
    while ((c = getchar()) != EOF) {
        if (c == ' ' || c == '\t' || c == '\n') {
            if (state == IN) {
                state = OUT;
                ++length[wl];
                wl = 0;
            }
        } else if (state == OUT) {
            state == IN;
            ++wl;
        } else {
            ++wl;
        }
    }

    for (int i = 0; i < LENGTH_SIZE; ++i) {
        if (length[i] > 0) {
            printf("%2d length word count: ");
            for (int j = 0; j < length[i]; ++j) {
                putchar('*');
            }
            putchar('\n');
        }
    }
}

int main() {
    E1_13();
//    P1_0();
//    P1_1();
    return 0;
}

void E1_5() {
    int celsius;

    for (celsius = 300; celsius >= 0; celsius -= 20) {
        printf("%3d\t%8.2f\n", celsius, celsius * 9.0 / 5.0 + 32);
    }
}

void P1_0() {
    float celsius, fahr;
    int upper = 300, lower = 0, step = 20;

    celsius = lower;
    while (celsius <= upper) {
        fahr = celsius * 9 / 5 + 32;
        printf("%3.0f\t\t%8.2f\n", celsius, fahr);
        celsius += step;
    }
}

void P1_1() {
    float fahr, celsius;
    int upper, lower, step;

    lower = 0;
    upper = 300;
    step = 20;

    fahr = lower;
    while (fahr <= upper) {
        celsius = 5 * (fahr - 32) / 9;
        printf("%3.0f\t%6.2f\n", fahr, celsius);
        fahr += step;
    }
}

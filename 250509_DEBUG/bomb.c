#include <stdio.h>
#include <string.h>

void boom() {
    printf("BOOM! The bomb has exploded!\n");
}

int main() {
    char input[100];
    printf("Enter the password: ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = 0;

    if (strcmp(input, "nicebmkg") == 0) {
        printf("Password accepted. Bomb defused!\n");
    } else {
        boom();
    }
    return 0;
}


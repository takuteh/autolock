#include <pigpiod_if2.h>
#include <iostream>
#include <unistd.h>

#define READ_SW 3

int main()
{
    int pi = pigpio_start(nullptr, nullptr);

    set_mode(pi, READ_SW, PI_INPUT);

    set_pull_up_down(pi, READ_SW, PI_PUD_UP);

    while (1)
    {
        std::cout << gpio_read(pi, READ_SW) << std::endl;
        sleep(1);
    }

    return 0;
}
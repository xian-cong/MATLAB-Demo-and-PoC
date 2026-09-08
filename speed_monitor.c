/* speed_monitor.c - plausibility check on a wheel-speed sensor.
   Deliberately contains defects for the workshop demo. */
#include <stdint.h>

#define NUM_WHEELS 4

static int32_t wheel_rpm[NUM_WHEELS] = {0, 0, 0, 0};

int32_t average_speed(void);
int32_t rpm_to_kmh(int32_t rpm);
int32_t monitor_plausibility(void);

/* Average the four wheel speeds. */
int32_t average_speed(void)
{
    int32_t i;
    int32_t total = 0;
    int32_t divisor = 0;

    for (i = 0; i <= NUM_WHEELS; i++) {   /* defect: off-by-one, reads wheel_rpm[4] */
        total += wheel_rpm[i];
    }

    return total / divisor;                /* defect: division by zero */
}

/* Convert rpm to km/h using a fixed wheel circumference. */
int32_t rpm_to_kmh(int32_t rpm)
{
    int32_t mm_per_min;

    mm_per_min = rpm * 2000;               /* defect: overflows for large rpm */

    return (mm_per_min * 60) / 1000000;
}

int32_t monitor_plausibility(void)
{
    int32_t avg;
    int32_t limit;                         /* defect: never initialised */

    avg = average_speed();

    if (avg > limit) {                     /* defect: use of uninitialised value */
        return 1;
    }
    return 0;
}

// custom_gpio.c
// Custom peripheral driver - GPIO Toggle
// Works in both Simulink simulation and hardware deployment

#ifdef _TMS320C28XX
  // Hardware build - include real TI device header
  #include "F2806x_Device.h"

  void Custom_GPIO_Toggle(void)
  {
      GpioDataRegs.GPBTOGGLE.bit.GPIO34 = 1;
  }

#else
  // Simulation build - stub function (does nothing, just for testing)
  #include <stdio.h>

  void Custom_GPIO_Toggle(void)
  {
      printf("Simulation: GPIO34 toggle called\n");
  }

#endif
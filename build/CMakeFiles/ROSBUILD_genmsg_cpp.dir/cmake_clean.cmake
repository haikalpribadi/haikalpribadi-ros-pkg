FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/parallax_eddie_robot/msg"
  "../src/parallax_eddie_robot/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/parallax_eddie_robot/KeyStroke.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/Speech.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/ADC.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/BatteryLevel.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/Velocity.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/Distances.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/Voltages.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/Ping.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/parallax_eddie_robot/msg"
  "../src/parallax_eddie_robot/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_cpp"
  "../srv_gen/cpp/include/parallax_eddie_robot/DriveWithSpeed.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/DriveWithDistance.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/DriveWithPower.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/Rotate.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/ResetEncoder.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/GetSpeed.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/GetHeading.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/GetDistance.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/Accelerate.h"
  "../srv_gen/cpp/include/parallax_eddie_robot/StopAtDistance.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

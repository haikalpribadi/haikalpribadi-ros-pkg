FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/parallax_eddie_robot/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/parallax_eddie_robot/ADC.h"
  "../msg_gen/cpp/include/parallax_eddie_robot/Ping.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

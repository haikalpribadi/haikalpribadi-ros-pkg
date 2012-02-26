FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/parallax_eddie_robot/msg"
  "../src/parallax_eddie_robot/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/parallax_eddie_robot/msg/__init__.py"
  "../src/parallax_eddie_robot/msg/_Speech.py"
  "../src/parallax_eddie_robot/msg/_ADC.py"
  "../src/parallax_eddie_robot/msg/_BatteryLevel.py"
  "../src/parallax_eddie_robot/msg/_Velocity.py"
  "../src/parallax_eddie_robot/msg/_Distances.py"
  "../src/parallax_eddie_robot/msg/_Voltages.py"
  "../src/parallax_eddie_robot/msg/_Ping.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

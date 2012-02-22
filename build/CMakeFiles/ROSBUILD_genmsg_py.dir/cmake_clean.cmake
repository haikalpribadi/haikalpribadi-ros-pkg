FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/parallax_eddie_robot/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/parallax_eddie_robot/msg/__init__.py"
  "../src/parallax_eddie_robot/msg/_ADC.py"
  "../src/parallax_eddie_robot/msg/_Ping.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

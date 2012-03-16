FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/parallax_eddie_robot/msg"
  "../src/parallax_eddie_robot/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/parallax_eddie_robot/srv/__init__.py"
  "../src/parallax_eddie_robot/srv/_DriveWithSpeed.py"
  "../src/parallax_eddie_robot/srv/_DriveWithDistance.py"
  "../src/parallax_eddie_robot/srv/_DriveWithPower.py"
  "../src/parallax_eddie_robot/srv/_Rotate.py"
  "../src/parallax_eddie_robot/srv/_ResetEncoder.py"
  "../src/parallax_eddie_robot/srv/_GetSpeed.py"
  "../src/parallax_eddie_robot/srv/_GetHeading.py"
  "../src/parallax_eddie_robot/srv/_GetDistance.py"
  "../src/parallax_eddie_robot/srv/_Accelerate.py"
  "../src/parallax_eddie_robot/srv/_StopAtDistance.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

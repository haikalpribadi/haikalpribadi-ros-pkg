FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/parallax_eddie_robot/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/ADC.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_ADC.lisp"
  "../msg_gen/lisp/Ping.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Ping.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

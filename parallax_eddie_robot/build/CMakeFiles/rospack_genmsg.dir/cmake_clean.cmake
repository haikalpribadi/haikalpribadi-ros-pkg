FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/parallax_eddie_robot/msg"
  "../src/parallax_eddie_robot/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/rospack_genmsg"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/rospack_genmsg.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

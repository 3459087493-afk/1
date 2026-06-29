set_param board.repoPaths [list /home/cym/prj2/finn/deps/board_files]
puts "PYNQ_BOARD_PARTS_BEGIN"
puts [get_board_parts -quiet *pynq*]
puts "PYNQ_BOARD_PARTS_END"
exit

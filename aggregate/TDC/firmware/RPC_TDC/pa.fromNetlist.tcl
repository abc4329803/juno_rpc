
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name RPC_TDC -dir "C:/Users/Public/RPC_TDC/planAhead_run_1" -part xc6slx9ftg256-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Public/RPC_TDC/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Public/RPC_TDC} {ipcore_dir} }
add_files [list {ipcore_dir/ALL_CHANNEL_DATA.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/Coarse_Time_Counter.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/DATA_16CH_IN_1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/Data_FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/Data_FIFO_64.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/hit_rates.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/icon_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ila.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ila_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ila_1.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design

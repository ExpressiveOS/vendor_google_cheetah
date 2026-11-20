#!/vendor/bin/sh

echo '--- Temperatures ---'
for f in /sys/class/thermal/thermal* ; do
  echo `cat $f/type`: `cat $f/temp`
done

echo '--- Cooling Device Current State ---'
for f in /sys/class/thermal/cooling* ; do
  echo `cat $f/type`: `cat $f/cur_state`
done

echo '--- Cooling Device User Vote State ---'
for f in /sys/class/thermal/cooling* ; do
  if ! [ -r $f/user_vote ]; then continue; fi;
  echo `cat $f/type`: `cat $f/user_vote`
done

echo '--- Cooling Device Time in State ---'
for f in /sys/class/thermal/cooling* ; do
  echo `cat $f/type`: `cat $f/stats/time_in_state_ms`
done

echo '--- Cooling Device Trans Table ---'
for f in /sys/class/thermal/cooling* ; do
  echo `cat $f/type`: `cat $f/stats/trans_table`
done

echo '--- Cooling Device State2Power Table ---'
for f in /sys/class/thermal/cooling* ; do
  if ! [ -r $f/state2power_table ]; then continue; fi;
  echo `cat $f/type`: `cat $f/state2power_table`
done

echo '--- TMU state ---'
cat /sys/module/gs_thermal/parameters/tmu_reg_dump_state
echo '--- TMU intpend ---'
cat /sys/module/gs_thermal/parameters/tmu_reg_dump_intpend
echo '--- TMU current temperature ---'
cat /sys/module/gs_thermal/parameters/tmu_reg_dump_current_temp
echo '--- TMU_TOP rise thresholds ---'
cat /sys/module/gs_thermal/parameters/tmu_top_reg_dump_rise_thres
echo '--- TMU_TOP fall thresholds ---'
cat /sys/module/gs_thermal/parameters/tmu_top_reg_dump_fall_thres
echo '--- TMU_SUB rise thresholds ---'
cat /sys/module/gs_thermal/parameters/tmu_sub_reg_dump_rise_thres
echo '--- TMU_SUB fall thresholds ---'
cat /sys/module/gs_thermal/parameters/tmu_sub_reg_dump_fall_thres

echo '--- Powercap GPC constraint_0_power_limit_uw ---'
for f in /sys/class/powercap/gpc* ; do
  if ! [ -r $f/name ] || ! [ -r $f/constraint_0_power_limit_uw ]; then continue; fi;
  echo `cat $f/name`: `cat $f/constraint_0_power_limit_uw`
done

echo '--- Powercap GPC constraint_0_time_window_us ---'
for f in /sys/class/powercap/gpc* ; do
  if ! [ -r $f/name ] || ! [ -r $f/constraint_0_time_window_us ]; then continue; fi;
  echo `cat $f/name`: `cat $f/constraint_0_time_window_us`
done

echo '--- Powercap GPC power_distribution_weights ---'
for f in /sys/class/powercap/gpc* ; do
  if ! [ -r $f/name ] || ! [ -r $f/power_distribution_weights ]; then continue; fi;
  echo `cat $f/name`: `cat $f/power_distribution_weights`
done

echo '--- Powercap GPC power_levels_uw ---'
for f in /sys/class/powercap/gpc* ; do
  if ! [ -r $f/name ] || ! [ -r $f/power_levels_uw ]; then continue; fi;
  echo `cat $f/name`: `cat $f/power_levels_uw`
done

echo '--- Powercap GPC enabled ---'
for f in /sys/class/powercap/gpc* ; do
  if ! [ -r $f/name ] || ! [ -r $f/enabled ]; then continue; fi;
  echo `cat $f/name`: `cat $f/enabled`
done

  if [ "$DEVICE_NAME" == "kanas3gub" ]
  then
    sh device/samsung/kanas3gub/patches/apply.sh
  fi
  
add_lunch_combo kanas3gub-userdebug
add_lunch_combo kanas3gub-eng
add_lunch_combo cm_kanas3gub-userdebug



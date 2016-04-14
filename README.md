android_device_samsung_core2
============================

Device configuration for Samsung Galaxy Core II SM-G355M
How to Build
---------------
install java:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java6-installer

needed packages:

    sudo apt-get install lib32z1 git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential lzop zip curl libncurses5-dev zlib1g-dev pngcrush schedtool libxml2 libxml2-utils xsltproc g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib

Repo is a tool that makes it easier to work with Git in the context of Android.

To install Repo:

 

   Create bin directory in your home directory and that it is included in your path:

    mkdir ~/bin
    PATH=~/bin:$PATH
    
   Download the Repo tool and ensure that it is executable:

    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
    
   Create a directory for your working files:

    mkdir android
    cd android
    
your WORKING_DIRECTORY (android folder)

Run repo init to bring down the latest version of Repo with all its most recent bug fixes. You must specify a URL for the manifest, which specifies where the various repositories included in the Android source will be placed within your working directory.

NOTE:
.repo is hidden in android folder. To see it hit Ctrl+h in open android folder.

repo init:

    repo init -u https://android.googlesource.com/platform/manifest
    repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0
    mkdir .repo/local_manifests
    
Copy local_manifests.xml to .repo/local_manifests

Use the following local manifest:

    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
    <remove-project name="CyanogenMod/android_system_core" />
    <remove-project name="CyanogenMod/android_frameworks_native" />
    <remove-project name="CyanogenMod/android_frameworks_base" />
    <remove-project name="CyanogenMod/android_hardware_libhardware_legacy" />
    <remove-project name="CyanogenMod/android_hardware_libhardware" />
    <remove-project name="CyanogenMod/android_external_tinyalsa" />
    <remove-project name="CyanogenMod/android_frameworks_av" />
    <project name="Y300-0100/android_system_core" path="system/core" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_frameworks_native" path="frameworks/native" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_frameworks_base" path="frameworks/base" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_hardware_libhardware_legacy" path="hardware/libhardware_legacy" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_hardware_libhardware" path="hardware/libhardware" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_external_tinyalsa" path="external/tinyalsa" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_frameworks_av" path="frameworks/av" remote="github" revision="cm-11.0" />
    <project name="Y300-0100/android_device_samsung_kanas3gub" path="device/samsung/kanas3gub" remote="github" revision="master" />
    <project name="Y300-0100/android_kernel_samsung_kanas3gub" path="kernel/samsung/kanas3gub" remote="github" revision="master" />
    <project name="Y300-0100/proprietary_vendor_samsung" path="vendor/samsung/kanas3gnfcxx" remote="github" revision="master" />
    <project name="CyanogenMod/android_packages_apps_SamsungServiceMode" path="packages/apps/SamsungServiceMode" remote="github"     revision="cm-11.0" />
    </manifest>


Sync and build:

    repo sync -j4
    vendor/cm/get-prebuilts
    lunch
    select number userdebug
    make bootimage && brunch kanas3gub

vendor fils are common for SM-G355HN,SM-G355H,SM-G355M

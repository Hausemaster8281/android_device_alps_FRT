#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=FRT
VENDOR=alps

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
            CLEAN_VENDOR=false
            ;;
        -k | --kang )
            KANG="--kang"
            ;;
        -s | --section )
            SECTION="${2}"; shift
            CLEAN_VENDOR=false
            ;;
        * )
            SRC="${1}"
            ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    # Default to adb if no source is specified
    SRC="adb"
fi

# Check if the device is connected in recovery mode
if [[ "${SRC}" == "adb" ]]; then
    echo "Checking for connected devices..."
    DEVICE_STATUS=$(adb devices | grep -w "recovery" | awk '{print $2}')
    if [[ "${DEVICE_STATUS}" != "recovery" ]]; then
        echo "No device found in recovery mode. Please connect a device."
        exit 1
    fi
fi

# Ensure system and vendor partitions are mounted if in recovery mode
if [[ "${SRC}" == "adb" ]]; then
    echo "Ensuring partitions are mounted..."
    adb shell "mount /system" || echo "System partition already mounted."
    adb shell "mount /vendor" || echo "Vendor partition already mounted."
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

# Create directories for proprietary files
mkdir -p "${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary"

# Extract files using adb pull for each entry in proprietary-files.txt
echo "Extracting files from device..."
while IFS= read -r line; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    
    # Split line into source and destination
    src_path="${line%%:*}"
    dest_path="${line#*:}"
    
    # Remove leading whitespace from destination path
    dest_path=$(echo "$dest_path" | sed 's/^[[:space:]]*//')
    
    # Pull the file using adb pull, handle errors and continue
    echo "Pulling $src_path to ${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/$dest_path"
    adb pull "$src_path" "${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/$dest_path" || {
        echo "Warning: Failed to pull $src_path. Skipping."
        continue
    }
done < "${MY_DIR}/proprietary-files.txt"

# Run the setup-makefiles script
"${MY_DIR}/setup-makefiles.sh"


#!/usr/bin/env python

import common

def FullOTA_InstallEnd(info):
    info.script.Mount("/system")
    info.script.Mount("/vendor")
    info.script.Unmount("/system")
    info.script.Unmount("/vendor")

def IncrementalOTA_InstallEnd(info):
    info.script.Mount("/system")
    info.script.Mount("/vendor")
    info.script.Unmount("/system")
    info.script.Unmount("/vendor")

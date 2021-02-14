# OpenJVS-Utils

This repository contains various scripts which can be used when debugging controller mappings etc.

## Controller Information

It may be useful to show someone else the evtest output, lsusb output and openjvs --list output of your machine. The below script will allow you to do this, and upload the details to termbin.com so they can be shared easily.

To dump your current controller information, run the following:

```
curl -s https://raw.githubusercontent.com/OpenJVS/OpenJVS-Utils/main/debug-controllers.sh | sudo bash
```

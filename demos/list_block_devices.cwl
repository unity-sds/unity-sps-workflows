#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: ["sh", "list_block_devices.sh"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: list_block_devices.sh
        entry: |-
          echo "List block devices"
          lsblk
          echo "List mounted drives"
          df -a -T -h
          echo "List /data directory"
          mkdir /data
          df -h /data

hints:
  DockerRequirement:
    dockerPull: ubuntu

inputs: []

outputs: []

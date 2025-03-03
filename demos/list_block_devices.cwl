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
          "Install nvme-cli"
          sudo yum install -y nvme-cli
          echo "List NVME devices"
          nvme list
          echo "List NVME subsystems"
          nvme list-subsys

hints:
  DockerRequirement:
    dockerPull: ubuntu

inputs: []

outputs: []

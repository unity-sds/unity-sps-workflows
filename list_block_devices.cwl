#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: lsblk
arguments: ["-l"]

hints:
  DockerRequirement:
    dockerPull: busybox

inputs: []

outputs:
  the_output:
    type: stdout
stdout: lsblk_message.txt

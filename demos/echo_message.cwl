#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: echo
arguments: [$(inputs.message)]

hints:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-sps/busybox:latest

inputs:
  message:
    type: string

outputs:
  the_output:
    type: stdout
stdout: echo_message.txt

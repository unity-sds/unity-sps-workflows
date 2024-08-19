#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: echo
arguments: [$(inputs.message)]

hints:
  DockerRequirement:
    dockerPull: $(inputs.ecr_uri)

inputs:
  message:
    type: string
  ecr_uri:
    type: string

outputs:
  the_output:
    type: stdout
stdout: echo_message.txt

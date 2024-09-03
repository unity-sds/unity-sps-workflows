#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

inputs:
  message:
    type: string

outputs:
  out:
    type: File
    outputSource: echo/the_output

requirements:
  SubworkflowFeatureRequirement: {}

steps:
  echo:
    run: https://raw.githubusercontent.com/unity-sds/unity-sps-workflows/main/demos/echo_message.cwl
    in:
      message: message
    out: [the_output]

#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

inputs:
  message:
    type: string

outputs:
  the_output:
    type: stdout

requirements:
  SubworkflowFeatureRequirement: {}

steps:
  compile:
    run: https://raw.githubusercontent.com/unity-sds/unity-sps-workflows/main/demos/echo_message.cwl

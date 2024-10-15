#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}

inputs:
  message:
    type: string

outputs:
  stage_in_stdout:
    type: File
    outputSource: stage_in/stage_in_stdout
  process_stdout:
    type: File
    outputSource: process/process_stdout
  stage_out_file:
    type: File
    outputSource: stage_out/stage_out_file
  stage_out_stdout:
    type: File
    outputSource: stage_out/stage_out_stdout

steps:
  stage_in:
    run: cwl_dag_data_stage_in.cwl
    in:
      message: message
    out: [stage_in_file, stage_in_stdout]
  process:
    run: cwl_dag_data_process.cwl
    in:
      stage_in_file: stage_in/stage_in_file
    out: [process_file, process_stdout]
  stage_out:
    run: cwl_dag_data_stage_out.cwl
    in:
      process_file: process/process_file
    out: [stage_out_file, stage_out_stdout]
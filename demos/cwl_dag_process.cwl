#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: cat
arguments: ["$(inputs.input.path)/catalog.json"]

inputs:
  input: Directory
  summary_table_filename:
    default: summary_table.txt
    type: string

outputs:
  output:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
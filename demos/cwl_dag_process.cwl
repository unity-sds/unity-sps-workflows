#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: ls
arguments: ["-lR", $(inputs.input.path)]

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
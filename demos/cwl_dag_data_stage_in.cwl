#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: ["sh", "stage_in.sh"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: stage_in.sh
        entry: |-
          data="$(inputs.message) --> staged in"
          echo "INFO [job stage_in] Data to stage in: \${data}"
          echo \${data} > stage_in.txt

inputs:
  message:
    type: string

outputs:
  stage_in_file:
    type: File
    outputBinding:
      glob: stage_in.txt
  stage_in_stdout:
    type: stdout

stdout: stage_in_stdout.txt

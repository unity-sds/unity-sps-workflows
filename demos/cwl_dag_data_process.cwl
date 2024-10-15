#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: ["sh", "process.sh"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.stage_in_file)
      - entryname: process.sh
        entry: |-
          data=`cat stage_in.txt`
          echo "INFO [job process] Data to process: \${data}"
          processed_data="\${data} --> processed"
          echo \${processed_data} > process.txt

inputs:
  stage_in_file:
    type: File

outputs:
  process_file:
    type: File
    outputBinding:
      glob: process.txt
  process_stdout:
    type: stdout

stdout: process_stdout.txt
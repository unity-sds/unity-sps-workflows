#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: ["sh", "stage_out.sh"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.process_file)
      - entryname: stage_out.sh
        entry: |-
          data=`cat process.txt`
          echo "INFO [job stage_out] Data to stage out: \${data}"
          stage_out_data="\${data} --> staged out"
          echo \${stage_out_data} > stage_out.txt

inputs:
  process_file:
    type: File

outputs:
  stage_out_file:
    type: File
    outputBinding:
      glob: stage_out.txt
  stage_out_stdout:
    type: stdout

stdout: stage_out_stdout.txt
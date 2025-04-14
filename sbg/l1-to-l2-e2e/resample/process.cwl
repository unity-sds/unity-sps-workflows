#!/usr/bin/env cwl-runner
arguments:
- -p
- input_resample_dataset
- $(inputs.download_dir.path)/stage-in-results.json
- -p
- output_stac_catalog_dir
- $(runtime.outdir)/process_output
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- --cwd
- /home/jovyan
- process_output/output_nb.ipynb
- -f
- /tmp/inputs.json
class: CommandLineTool
cwlVersion: v1.2
inputs:
  crid:
    default: '000'
    type: string
  download_dir: Directory
  output_collection_name:
    default: example-L2A-Resample-Collect
    type: string
outputs:
  process_output_dir:
    outputBinding:
      glob: $(runtime.outdir)/process_output
    type: Directory
  process_output_nb:
    outputBinding:
      glob: $(runtime.outdir)/process_output/output_nb.ipynb
    type: File
requirements:
  DockerRequirement:
    dockerPull: gangl/sbg-unity-resample:e41b385b
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
    - entry: '$({class: ''Directory'', listing: []})'
      entryname: process_output
      writable: true
  InlineJavascriptRequirement: {}
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: stdout.txt

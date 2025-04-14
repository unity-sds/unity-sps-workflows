#!/usr/bin/env cwl-runner
cwlVersion: v1.2
$namespaces:
      cwltool: http://commonwl.org/cwltool#
$graph:
  - class: Workflow
    id: main
    label: Workflow that executes the STAC_MERGE command

    requirements:
      SubworkflowFeatureRequirement: {}
      NetworkAccess:
        networkAccess: true

    inputs:
      input_files:
        type: File[]

    # Outputs are the catalog STAC or url to the dapa search that returns the files just uploaded
    outputs:
      results:
        type: File
        outputSource: merge/catalog_results

    steps:
        merge:
          run: "#merge-tool"
          in:
            files: input_files 
          out: [catalog_results]

  - class: CommandLineTool
    id: merge-tool

    requirements:
      DockerRequirement:
        dockerPull: gangl/stac-merge:1.0
    arguments: [$(runtime.outdir)]
    inputs:
      files:
        type: File[]
        inputBinding:
          position: 1


    outputs:
      catalog_results:
        type: File
        outputBinding:
          glob: catalog.json 
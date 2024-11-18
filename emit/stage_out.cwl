#!/usr/bin/env cwl-runner
baseCommand:
- UPLOAD
class: CommandLineTool
cwlVersion: v1.2
inputs:
  aws_access_key_id:
    default: ''
    type: string
  aws_region:
    default: us-west-2
    type: string
  aws_secret_access_key:
    default: ''
    type: string
  aws_session_token:
    default: ''
    type: string
  collection_id:
    default: ''
    type: string
  output_dir:
    type: Directory
  result_path_prefix:
    default: ''
    type: string
  staging_bucket:
    default: ''
    type: string
outputs:
  failed_features:
    outputBinding:
      glob: $(runtime.outdir)/failed_features.json
    type: File
  stage_out_results:
    outputBinding:
      glob: $(runtime.outdir)/stage-out-results.json
    type: File
  successful_features:
    outputBinding:
      glob: $(runtime.outdir)/successful_features.json
    type: File
requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:7.12.2
  EnvVarRequirement:
    envDef:
      AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
      AWS_REGION: $(inputs.aws_region)
      AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
      AWS_SESSION_TOKEN: $(inputs.aws_session_token)
      CATALOG_FILE: $(inputs.output_dir.path)/catalog.json
      COLLECTION_ID: $(inputs.collection_id)
      LOG_LEVEL: '20'
      OUTPUT_DIRECTORY: $(runtime.outdir)
      OUTPUT_FILE: $(runtime.outdir)/stage-out-results.json
      PARALLEL_COUNT: '-1'
      RESULT_PATH_PREFIX: $(inputs.result_path_prefix)
      STAGING_BUCKET: $(inputs.staging_bucket)
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.output_dir)
      entryname: /tmp/outputs
stdout: stage-out-results.json

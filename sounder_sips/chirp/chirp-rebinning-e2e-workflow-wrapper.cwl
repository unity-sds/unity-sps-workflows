#!/usr/bin/env cwl-runner
cwlVersion: v1.1
class: Workflow
label: Workflow that wraps the execution of the Sounder SIPS end-to-end chirp rebinngin workflow by invoking the U-SPS job management functionality

$namespaces:
  cwltool: http://commonwl.org/cwltool#

requirements:
  SubworkflowFeatureRequirement: {}
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  MultipleInputFeatureRequirement: {}

## Inputs to the CHIRP e2e workflow
inputs:

  # Generic inputs
  input_processing_labels: string[]

  # For CMR Search Step
  input_cmr_collection_name: string
  input_cmr_search_start_time: string
  input_cmr_search_stop_time: string

  #for chirp rebinning step
  # none -

  # For unity data upload step, unity catalog
  output_collection_id: string
  output_data_bucket: string

  # For DAAC CNM step
  input_daac_collection_shortname: string
  input_daac_collection_sns: string

## Outputs of the CHIRP e2e workflow
outputs: []

steps:
  workflow:
    run: https://raw.githubusercontent.com/unity-sds/sounder-sips-chirp-workflows/main/chirp-rebinning-e2e-workflow.cwl
    in:
      input_processing_labels: input_processing_labels
      input_cmr_collection_name: input_cmr_collection_name
      input_cmr_search_start_time: input_cmr_search_start_time
      input_cmr_search_stop_time: input_cmr_search_stop_time
      output_collection_id: output_collection_id
      output_data_bucket: output_data_bucket
      input_daac_collection_shortname: input_daac_collection_shortname
      input_daac_collection_sns: input_daac_collection_sns
    out: []
      
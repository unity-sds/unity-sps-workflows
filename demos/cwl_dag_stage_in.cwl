cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["DOWNLOAD"]

requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:9.0.0
  EnvVarRequirement:
    envDef:
      DOWNLOAD_DIR: $(runtime.outdir)/$(inputs.download_dir)
      STAC_JSON: $(inputs.stac_json)
      GRANULES_DOWNLOAD_TYPE: 'HTTP'
      LOG_LEVEL: '10'
      PARALLEL_COUNT: '-1'
      DOWNLOAD_RETRY_WAIT_TIME: '30'
      DOWNLOAD_RETRY_TIMES: '5'
      DOWNLOADING_ROLES: 'data'

      VERIFY_SSL: 'TRUE'
      STAC_AUTH_TYPE: 'NONE'

inputs:
  download_dir:
    type: string
  stac_json:
    type: string

outputs:
  download_dir:
    type: Directory
    outputBinding:
      glob: "$(inputs.download_dir)"
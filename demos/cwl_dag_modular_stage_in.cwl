cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["DOWNLOAD"]

requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:9.4.0
  NetworkAccess:
    networkAccess: true
  EnvVarRequirement:
    envDef:
      DOWNLOAD_DIR: $(runtime.outdir)/$(inputs.download_dir)
      STAC_JSON: $(inputs.stac_json)
      LOG_LEVEL: $(inputs.log_level)
      PARALLEL_COUNT: '-1'
      DOWNLOAD_RETRY_WAIT_TIME: '30'
      DOWNLOAD_RETRY_TIMES: '5'
      DOWNLOADING_ROLES: 'data'

      EDL_BASE_URL: 'https://urs.earthdata.nasa.gov/'
      EDL_USERNAME: '/sps/processing/workflows/edl_username'
      EDL_PASSWORD: '/sps/processing/workflows/edl_password'
      EDL_PASSWORD_TYPE: 'PARAM_STORE'

      CLIENT_ID: $(inputs.unity_client_id)
      COGNITO_URL: $(inputs.unity_cognito_url)
      USERNAME: '/sps/processing/workflows/unity_username'
      PASSWORD: '/sps/processing/workflows/unity_password'
      PASSWORD_TYPE: 'PARAM_STORE'

      VERIFY_SSL: 'TRUE'
      STAC_AUTH_TYPE: $(inputs.stac_auth_type)

inputs:
  download_dir:
    type: string
  log_level:
    default: '20'
    type: string
  stac_auth_type:
    default: 'NONE'
    type: string
  stac_json:
    type: string
  unity_client_id:
    default: ''
    type: string
  unity_cognito_url:
    default: 'https://cognito-idp.us-west-2.amazonaws.com'
    type: string

outputs:
  download_dir:
    type: Directory
    outputBinding:
      glob: "$(inputs.download_dir)"
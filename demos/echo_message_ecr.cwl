#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: echo
arguments: [$(inputs.message)]
requirements:
  EnvVarRequirement:
    envDef:
      ENV_CONTAINER_REGISTRY: $(inputs.ecr_uri)

hints:
  DockerRequirement:
    dockerPull: $ENV_CONTAINER_REGISTRY

inputs:
  message:
    type: string
  ecr_uri:
    type: string

outputs:
  the_output:
    type: stdout
stdout: echo_message.txt

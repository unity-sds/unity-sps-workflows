#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: ["python3", "process.py"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: process.py
        entry: |-
          import logging
          logging.getLogger().setLevel(logging.INFO)
          logging.basicConfig(
              format='%(asctime)s %(name)s %(levelname)s %(message)s',
              datefmt='%Y-%m-%dT%H:%M:%S',
              level=logging.INFO
          )
          task_log = logging.getLogger("container_log")
          task_log.info("This is an 'info' log")
          task_log.debug("This is a 'debug' log")
          task_log.warning("This is a 'warning' log")
          task_log.error("This is an 'error' log")
          task_log.critical("This is a 'critical' log")

inputs: []

outputs: []
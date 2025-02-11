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
          task_log = logging.getLogger("airflow.task")
          task_log.info("Info log")
          task_log.debug("Debug log")
          task_log.warning("Warning log")
          task_log.error("Error log")
          task_log.critical("Critical error")

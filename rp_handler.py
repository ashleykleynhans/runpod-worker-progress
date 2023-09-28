import time
import runpod
from runpod.serverless.utils.rp_validator import validate
from runpod.serverless.modules.rp_logger import RunPodLogger
from schemas.input import INPUT_SCHEMA

logger = RunPodLogger()


def handler(event):
    validated_input = validate(event['input'], INPUT_SCHEMA)

    if 'errors' in validated_input:
        return {
            'error': validated_input['errors']
        }

    for update_number in range(0, 10):
        runpod.serverless.progress_update(event, {
            "progress": f"{update_number}/10"
        })
        # time.sleep(10)


if __name__ == '__main__':
    logger.info('Starting RunPod Serverless...')
    runpod.serverless.start(
        {
            'handler': handler
        }
    )
#!/usr/bin/env python3

import json
import httpx

if __name__ == '__main__':
    payload = {
        "input": {
            "prompt": "This is a test"
        }
    }

    r = httpx.post(
        'http://127.0.0.1:8000/runsync',
        json=payload,
        timeout=100
    )

    print(f'Status code: {r.status_code}')
    resp_json = r.json()
    print(json.dumps(resp_json, indent=4, default=str))

    # if r.status_code == 200:
    #     pass

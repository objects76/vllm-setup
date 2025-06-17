
import requests

model_id = "google/gemma-3-27b-it"
url = "http://localhost:8000/v1/chat/completions"
headers = {
    "Content-Type": "application/json",
}
payload = {
    "model": model_id,
    "messages": [
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "Describe this image in one sentence. Answer in Korean"
                },
                {
                    "type": "image_url",
                    "image_url": {
                        "url": "https://cdn.britannica.com/61/93061-050-99147DCE/Statue-of-Liberty-Island-New-York-Bay.jpg"
                    }
                }
            ]
        }
    ]
}

try:
    response = requests.post(url, json=payload, headers=headers)
    response.raise_for_status()  # Raises HTTPError for bad responses (4xx or 5xx)
    result = response.json()  # Parses the response as JSON
    print(result.keys())
    print(result['choices'][0]['message'])

except Exception as err:
    print(f"Exception: {err}")  # Handles JSON decoding errors


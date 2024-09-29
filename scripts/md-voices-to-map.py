#!/usr/bin/python

import argparse
import sys
import markdown_to_json
import json
import re
import requests

def read_input(source):
    if source == '-':
        return sys.stdin.read()
    else:
        with open(source, 'r') as file:
            return file.read()

def main():
    parser = argparse.ArgumentParser(description="Convert Piper project VOICES.md Markdown to a Pied JSON compatible data structures.")
    parser.add_argument('input', nargs='?', default='-', help="Input markdown file or '-' for stdin")
    args = parser.parse_args()

    input_text = read_input(args.input)

    voices = {}   
    languageCodes = {}   
 
    jsonified = json.loads(markdown_to_json.jsonify(input_text))
    json_output = json.dumps(jsonified, indent=4)

    for key in jsonified:
        print("==== Informational status ====")
        print("Languages:")
        for value in jsonified[key]:
            if type(value) is str:
                print("  {}".format(value))
                match = re.search('(\w+)\s+\(\`(\w+)\`,\s+(.+?)\)', value)
                if match:
                    languageCodes[match.group(2)] = "{} ({})".format(match.group(1), match.group(3))
                else:
                    match = re.search('(\w+)\s+\((\w+)\)', value)
                    if match:
                        languageCodes[match.group(2)] = "{} ({})".format(match.group(1), re.sub("\w+?_", "", match.group(2)))
                language = languageCodes[match.group(2)]
                locale = match.group(2)
                voices[language] = {}
            elif type(value) is list:
                print("    Voices:")
                for item in value:
                    if type(item) is str:
                        print("      {}".format(item))
                        voice = item
                    elif type(item) is list:
                        for line in item:
                            print("        {}".format(line))
                            match = re.search('(\w+)\s-\s\[\[model\]\((https://.+)\)\]\s+\[\[config\]\((https://.+)\)\]', line)
                            if match:
                                model_url = match.group(2)
                                match_filename = re.search('(https://.+)/([^/].+?)\?download=true', model_url)
                                base_url = match_filename.group(1)
                                model_filename = match_filename.group(2)
                                config_url = match.group(3)
                                r = requests.get(config_url)
                                remote_config = r.json()
                                sample_url = "{}{}".format(base_url, "/samples/speaker_0.mp3?download=true")
                                card_url = "{}{}".format(base_url, "/MODEL_CARD?download=true")
                                voices[language]["{} - {}".format(voice, match.group(1))] = [
                                                                "{}".format(remote_config["audio"]["sample_rate"]),
                                                                locale,
                                                                model_url,
                                                                config_url,
                                                                model_filename,
                                                                sample_url,
                                                                card_url
                                                            ] 
    print("\nPied output:")
    print("\nMap<String, Map<String, List<String>>> voices =", json.dumps(voices, indent=2), ";" )
    print("\nMap<String, String> languageCodes =", json.dumps(languageCodes, indent=2), ";")
if __name__ == "__main__":
    main()

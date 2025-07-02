import json
import os
import re
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--devices", type=str, required=True, help="Comma-separated list of device names")
args = parser.parse_args()

devices = args.devices.split(",")

all_tests_json = "all-tests.json"
tests_folder = "./ThreadQAUITests/Tests"
test_bundle = "ThreadQAUITests"

swift_files = []
for root, _, files in os.walk(tests_folder):
    for file in files:
        if file.endswith(".swift"):
            swift_files.append(os.path.join(root, file))

test_list = []
for swift_file_path in swift_files:
    with open(swift_file_path, "r", encoding="utf-8") as f:
        file_content = f.readlines()

    filtered_content = [line for line in file_content if not line.strip().startswith("//")]
    full_text = "".join(filtered_content)

    class_matches = re.findall(r'class\s+(\w+)', full_text)

    for class_name in class_matches:
        test_methods = re.findall(r'func\s+(test\w+)\s*\(', full_text)
        for test in test_methods:
            test_list.append(f"{test_bundle}/{class_name}/{test}")

with open(all_tests_json, "w") as f:
    json.dump({test: "0" for test in test_list}, f, indent=4)
print(f"Saved all tests to {all_tests_json}")

device_tests = {device: [] for device in devices}
for i, test in enumerate(test_list):
    device = devices[i % len(devices)]
    device_tests[device].append(test)

for device, tests in device_tests.items():
    output_file = f"{device}-tests.json"
    with open(output_file, "w") as f:
        json.dump({test: "0" for test in tests}, f, indent=4)
    print(f"Saved {len(tests)} tests to {output_file}")

# iOS XCUITEST Automation Framework

Welcome to **ThreadQA**, a modular and scalable iOS UI test framework written in Swift with XCTest. It supports parallel execution, test splitting, and Allure reporting.

---

## 📁 Project Structure

```plaintext
ThreadQA/
  ThreadQA/
    Utils/                                # Common utilities (date/time, formatters, etc)
    Controllers/                          # App MVC controllers
    Models/                               # App data models
    Assets/                               # Images, icons, resources
    AppDelegate                           # App lifecycle handler
    SceneDelegate                         # Scene management for iOS 13+
    Info                                  # Info.plist
    LaunchScreen                          # Launch screen storyboard
    Main                                  # Main.storyboard
  ThreadQAUITests/
    Extensions/
      XCUIElement/
        XCUIElement+Extension.swift       # Custom XCUIElement functions (e.g. waits, scrolls)
    Helpers/
      AppHelper/
        AppHelper.swift                   # Common helpers for UI tests (e.g. launch, reset state)
    Models/
      UserReg.swift                       # Data model for registering test users
      UserReqres.swift                    # Data model for Reqres API user
    Networking/
      ServiceManager.swift                # Networking / stubbing / API mocks for tests
    Pages/
      HomeScreen.swift                    # Page Object for home screen
      LoginScreen.swift                   # Page Object for login screen
      NewUserScreen.swift                 # Page Object for new user registration
      ProfileScreen.swift                 # Page Object for profile view
      RegisterScreen.swift                # Page Object for registration
      UserDetailScreen.swift              # Page Object for user details view
    Tests/
      BaseTest.swift                      # Base class for common test setup/teardown
      LoginTests.swift                    # Login feature test cases
      UserTests.swift                     # User feature test cases (CRUD)
      MyPlan.xctestplan                   # Xcode test plan to group/filter tests
```

## 🚀 Features
- ✅ Parallel test distribution with a Python orchestrator
- ✅ Modular Page Object Model architecture
- ✅ Test execution managed by Fastlane
- ✅ Support for Xcode Testplans
- ✅ Allure reporting integration
- ✅ JSON-based test splitting across multiple devices

## 🔧 Prerequisites
Install dependencies via Homebrew and npm:
```bash
brew install fastlane
brew install allure
npm install -g xcresults
```

Also install the plugin for Allure conversion:

- [xcresults-to-allure-json](https://github.com/eroshenkoam/xcresults) 
- `brew install xcresults`

## ⚙️ Test Orchestrator
ThreadQA includes a Python-based orchestrator.py script to:

- Scan all Swift test files under `ThreadQAUITests/Tests`
- Parse test class/method names
- Generate a JSON list of tests
- Distribute them between devices for parallel execution

For example:
`python3 orchestrator.py --devices "iPhone 16 Pro Max,iPhone 14"`

This will generate JSON test lists like:

- iPhone 16 Pro Max-tests.json

- iPhone 14-tests.json

## 🏃 Running Tests with Fastlane
Framework uses a Fastlane lane described in its Fastfile:

```
lane :test do |options|
  scan(
    devices: options[:id],
    output_directory: options[:test_output],
    output_types: "junit,json-compilation-database",
    result_bundle: true,
    number_of_retries: 2,
    testplan: "MyPlan",
    only_testing: test_plan(test_list: options[:test_list]).map(&:to_s)
  )
end

def test_plan(test_list:)
  test_list = JSON.parse(File.read(test_list)).keys
  Process.exit(0) if test_list.empty?
  puts test_list
  test_list
end
```
Then run tests like so:
`fastlane test id:"iPhone 16 Pro Max" test_output:"test_output" test_list:"iPhone 16 Pro Max-tests.json"`

## 📊 Allure Reports
After your tests finish, convert the xcresult to Allure JSON:
`xcresults export test_output/ThreadQA.xcresult -o ./allure-results`

then serve it:
`allure serve ./allure-results`

## 🧩 Plugins Used
- Fastlane (via Homebrew)
- xcresults-to-allure-json (by eroshenkoam)
- Allure (via Homebrew)

## 🖥️ CI/CD Support
Framework is designed for easy integration with CI/CD systems (Jenkins, GitHub Actions, Bitrise, etc.) thanks to:

- JSON test lists for parallel execution
- Fastlane for orchestration
- Allure for publishing detailed reports

## ✅ Quick Start
Install Homebrew if missing:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Install dependencies:
```bash
brew install fastlane allure
npm install -g xcresults
```

Clone the repository:

- `git clone https://github.com/YehorYehorychev/XCUITest_CI_CD_Framework.git`
- `cd ThreadQA`

Generate the test distribution JSON:

`python3 orchestrator.py --devices "iPhone 16 Pro Max,iPhone 14"`

### Run tests:

`fastlane test id:"iPhone 16 Pro Max" test_output:"test_output" test_list:"iPhone 16 Pro Max-tests.json"`

### Generate Allure reports:

- `xcresults export test_output/ThreadQA.xcresult -o ./allure-results`
- `allure serve ./allure-results`


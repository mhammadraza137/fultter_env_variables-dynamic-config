# env_variables

This is a Flutter project that demonstrates how to use environment variables in a Flutter application.

## Description

In this project, you will learn how to set up and manage environment variables effectively in a Flutter application. This includes:

- Configuring environment variables directly in Dart code using packages like `envied` for managing secrets, API keys, and other configurations.
- Setting up platform-specific environment configurations for Android and iOS.

Understanding how to handle environment variables securely and efficiently is crucial for managing application configurations across different deployment environments. This project serves as a practical guide to implementing these best practices in Flutter development.

## Getting Started

### Accessing Environment Variables in Dart Code

- Create a .env File. Start by creating a .env file at the root of your project (e.g., private_data.env) and define your environment variables within this file.
- Define an Environment Configuration Class. Create a Dart class to manage environment variables using the envied package. 

### Accessing Environment Variables in Android Code

- To access variables from .env first provide .env file through command  flutter run --dart-define-from-file private_data.env
- The variables are stored in  dartEnvironmentVariables and can be accessed as defined in android{ defaultConfig{}} as
  resValue "string", "app_name", dartEnvironmentVariables.APP_NAME ?: ""
  and in manifest can be used as android:label="@string/app_name"
- Don't forget to write the code bloc to extract environment variables from dart defined file in android/app/build.gradle

### Accessing Environment Variables in IOS Code

- To access variables from .env first provide .env file through command  flutter run --dart-define-from-file private_data.env
- Make sure to define a key DART_DEFINES in info.plist
- Don't forget to write the code bloc to extract environment variables from dart defined file in ios/Runner/AppDelegate.swift
- The variables are stored in dartDefinesDictionary and can be accessed as dartDefinesDictionary["APP_NAME"] 
# Flutter Developer Onboarding Test Project

## Overview

To help iOS and Android developers from the mobile development team onboard into the Flutter project, we recommend completing an introductory exercise designed to familiarize them with Flutter technology. This task will guide developers through setting up Android Studio, installing the Flutter and Dart plugins, and managing dependencies. Additionally, it will provide hands-on experience with how different application layers interact.

As part of this exercise, developers will also:
- Build application screens using Flutter’s declarative UI
- Manage routing between screens
- Implement the Flutter BLoC architecture
- Perform API calls
- Interact with a database
- Work with dependency management

By completing this task, developers will gain valuable insights into Flutter’s workflow and architecture, making it easier to transition into the project. Any challenges encountered during the process will also help prepare them to troubleshoot similar issues in real-world development.

## API

**[TMDB (The Movie Database) public API](https://developer.themoviedb.org/docs/getting-started)**

Endpoint to retrieve a list of movies \
**https://api.themoviedb.org/3/movie/popular?language=en-US&page=page_number**

Endpoint to retrieve a movie details \
**https://api.themoviedb.org/3/movie/movie_id?language=en-US**

Headers required to perform request
```
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWY0ZDg2MzY0ZjY2YWI0OGJkNjJmMGMzYmM4YmJjOSIsIm5iZiI6MTc0MjM4OTY4OS41NzQwMDAxLCJzdWIiOiI2N2RhYzFiOTdiYTdkYTcxNjNhMWVjMWQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.w8AObWJ7pJ9yxTupyNJxNYOcSKocHXI4NvFcsz0mx8M
```
```
accept: application/json
```

## Design

All sizes, fonts, and other design specifications should be referenced from the design mockup.

**https://www.figma.com/design/h3sVnuLw2dO0vjj5Huebfy/pdfFiller-iOS?node-id=45312-3610&t=jwjbHrfz0omhznJ7-0**

## Functional requirements

- Implement UI for Item List and Navigation
    - Design and develop a user interface to display the list of items.
    - Implement navigation to an item detail page when an item is selected.
- API Integration
    - Use the Dio library to fetch a list of items from the API.
    - Fetch detailed information for a selected item from the API.
- Data Caching
    - Store the fetched list of items in a local database for offline access.
- Load Cached Data on App Relaunch
    - On app startup, check for cached data and use it instead of making an API request if available.


## Evaluation Process

Upon completion, the Flutter development team from the mobile department will review the implementation. The review will cover each component, discussing best practices and solutions aligned with the company’s agreed-upon mobile development standards. This process aims to ensure a better understanding of our cross-platform development approaches.

## Recommended libraries to use during the project development

- Flutter BLoC architecture - https://pub.dev/packages/flutter_bloc
- API - https://pub.dev/packages/dio

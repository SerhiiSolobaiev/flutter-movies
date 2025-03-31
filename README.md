# Flutter Developer Onboarding Test Project

## Overview
This test project is designed to help developers become familiar with essential Flutter development techniques, including:
- Performing API calls
- Interacting with a database
- Implementing the Flutter BLoC architecture
- Building application screens using Flutter Widget (declarative UI)
- Managing routing between screens
- Working with dependency management

## Project Goal
The objective is to create a simple Flutter application that interacts with the **[TMDB (The Movie Database) public API](https://developer.themoviedb.org/docs/getting-started)** to fetch and display a list of items. Each item should be viewable on a separate screen, where all relevant details, including an image preview, will be displayed.

## API Details
Endpoint to retrieve a list of movies
**https://api.themoviedb.org/3/movie/popular?language=en-US&page={page_number}**

Headers required to perform request
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWY0ZDg2MzY0ZjY2YWI0OGJkNjJmMGMzYmM4YmJjOSIsIm5iZiI6MTc0MjM4OTY4OS41NzQwMDAxLCJzdWIiOiI2N2RhYzFiOTdiYTdkYTcxNjNhMWVjMWQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.w8AObWJ7pJ9yxTupyNJxNYOcSKocHXI4NvFcsz0mx8M' \
--header 'accept: application/json'


## Evaluation Process
Upon completion, the Flutter development team from the mobile department will review the implementation. The review will cover each component, discussing best practices and solutions aligned with the company’s agreed-upon mobile development standards. This process aims to ensure a better understanding of our cross-platform development approaches.

## Recommended libraries to use during the project development
- Flutter BLoC architecture - https://pub.dev/packages/flutter_bloc
- API - https://pub.dev/packages/dio

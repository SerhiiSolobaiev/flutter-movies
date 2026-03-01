# Flutter Developer Onboarding Test Project

## Overview

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
Authorization: Bearer ***
```
```
accept: application/json
```

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


## Screenshots
// TODO:

# Lodgify Mobile oversimplified calendar

This Flutter project contains a simple calendar application that displays the current month.
Please **Fork this repository** to your own GitHub account if you are participating in the recruitment challenge.

## Project Overview

This project showcases a monthly calendar view built with Flutter. The calendar displays a standard 6-row by 7-column grid (42 cells total), showing the current month along with offset days from the previous and next months to complete the grid.

### Current Features

- Displays the current month in a calendar grid format
- Shows weekday headers (Mon-Sun)
- Highlights today's date with bold text
- Properly calculates and positions days in the month grid

## Observations:

- Function was returning 43 days instead of 42 because of a bug in the for loop.
- Renamed some function parameter to better understand which month to send in.
- I added another version of the getMonthCalendar function which I think is simpler
  way and uses less code. The V2 starts by finding the offset in days between the
  current and the previous month and then deduce the starting date (the offset day
  from the previous month and goes through a loop to fill the 42 day slots)

# Project Structure;

The project is relatively small so I decided not to use Clean Architecture (presentation,
domain, data layers) but utilize MVVM approach. The structure is divided into features
folders, each feature folder has five folders:

- bloc: the view model layer which controls the logic
- pages: the UI presentation of the feature
- widgets: UI objects used specifically for the feature
- repository: used to get data locally or remotely (missing in this case)
- models: data models used for the specific feature

# Remarks:

I didnt understand how you wanted me to use the button style so I used green color for
default state and white on pressed. If you have a different approach you would like me
to achieve please do let me know.

Thank you for your time.

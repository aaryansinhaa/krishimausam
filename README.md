# Krishi Mausam

Krishi Mausam is a weather application built using Flutter framework. It leverages the OpenWeatherAPI to fetch weather data and provide accurate weather forecasts for farmers. The aim of this application is to assist farmers in making informed decisions regarding their agricultural activities by providing timely weather information.

## Features

- **Current Weather**: Get real-time weather updates for your location.
- **Custom Location Search**: Search for weather information in any location around the globe.
- **OpenWeatherAPI Integration**: Utilizes the OpenWeatherAPI to fetch accurate weather data.
- **User-friendly Interface**: Intuitive and easy-to-use interface designed with farmers in mind.

## Planned Features

In future updates, we plan to extend Krishi Mausam with the following features:

- **Weather-related News**: Providing curated news articles related to weather conditions and their impact on agriculture.
- **Crop Recommendations**: Offering crop-specific weather advisories and recommendations to help farmers optimize their crop yield.
- **Agricultural Calendar**: Integrating an agricultural calendar that provides insights into the best times for planting, harvesting, and other agricultural activities based on weather forecasts.

## Installation

To install Krishi Mausam, follow these steps:

1. Clone the repository:

   ```
   git clone https://github.com/aaryansinha/krishimausam.git
   ```

2. Navigate to the project directory:

   ```
   cd krishimausam
   ```

3. Install dependencies:

   ```
   flutter pub get
   ```

4. Run the application:

   ```
   flutter run
   ```

## Configuration

To use the OpenWeatherAPI, you need to obtain an API key from [OpenWeatherMap](https://openweathermap.org/api) and replace the placeholder in `lib/utility/helper.dart` with your API key:

```dart
  static var APIKEY = "YOUR_API_KEY";

```

## Contributing

Contributions to Krishi Mausam are welcome! If you have any ideas for new features, bug fixes, or improvements, feel free to open an issue or submit a pull request.

## Feedback

We value your feedback! If you have any suggestions, feature requests, or encounter any issues while using Krishi Mausam, please don't hesitate to reach out to us.

## License

Krishi Mausam is open-source software licensed under the [MIT License](LICENSE).

---

**Krishi Mausam** - Empowering Farmers with Weather Insights.

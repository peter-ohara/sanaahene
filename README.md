# Sanaahene

Sanaahene is an accounting software tailored for facility managers overseeing short-term rental properties. The software is designed to streamline the financial management of these properties, ensuring that all transactions are accurately recorded and easily accessible.

## Features

- **Import Transactions**: Seamlessly import transactions from platforms like MTN Mobile Money, Vodafone Cash, and Ecobank.
  
- **Multi-Currency Support**: Conduct transactions in both cedis and dollars, providing flexibility for international transactions.

- **Intuitive Interface**: The software is built with user-friendliness in mind, ensuring that even those without an accounting background can navigate and utilize its features with ease.

## Getting Started

1. **Setup**: Use the `bin/setup` command to install dependencies and set up the database:
   ```
   bin/setup
   ```

2. **Running the Server**: Start the Rails server and precompile the CSS and JavaScript using the `bin/dev` command:
   ```
   bin/dev
   ```

3. **Accessing the Application**: Navigate to `http://localhost:3000` to view the Rails boot screen.

### Notes on Setup Scripts

- **bin/setup**: This script handles the installation of gems, JavaScript dependencies, and sets up the database. It's a reliable tool to ensure a smooth development environment setup.

- **bin/dev**: This script installs `foreman` locally and runs the application based on the `Procfile.dev` file. It executes three commands simultaneously:
   ```
   # Procfile.dev
   web: bin/rails server -p 3000
   js: yarn build --watch
   css: yarn build:css --watch
   ```
   The commands `yarn build --watch` and `yarn build:css --watch` precompile CSS and JavaScript before integrating them into the asset pipeline. The `--watch` option ensures that the code is compiled every time a file is saved.

Both scripts can be found in the `/bin` folder of the Rails application.

## Contributing

Interested in contributing to Sanaahene? We welcome contributions from developers and enthusiasts alike. Feel free to fork the repository, make your changes, and submit a pull request.

## License

The software is open-source and free to use. For licensing details, please refer to the repository.

## Acknowledgements

Special thanks to all contributors and supporters of the Sanaahene project. Your efforts are greatly appreciated.

# Spooky House API

## Description

This is assignment 4 Express.js API dedicated to managing spooky characters in a spooky house party context, as Halloween approaches.
This API allows you to create, read, update, and delete characters, as well as filter them by their superpower. 
This app is designed for a spooky Halloween party, where users can add their spooky character costume in order to not duplicate costumes at the party.

## Table of Contents
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [API Endpoints](#api-endpoints)
- [Running the API](#running-the-api)
- [Contributing](#contributing)
- [License](#license)
- [Notes](#notes)

## Installation

1. Clone the repository:


  2. Install the dependencies.
     ```bash
     npm install mysql2
     npm install express
     npm install dotenv
     ```
 3. Import the spookyDB.sql
  
 4. Create a `.env` file in the root directory and add MySQL credentials
    ```bash
    MYSQL_HOST=localhost
    MYSQL_USER=your_mysql_user
    MYSQL_PASSWORD=your_mysql_password
    MYSQL_DATABASE=spookyDB.sql
    PORT=3000
    ```
## Environment variables
Make sure to add `.env` to your .gitignore file to prevent sensitive information from being committed to your repository.
The `.gitignore` file should look like this:

```bash
# Ignore environment variables
.env
```

## API Endpoints

GET /: Welcome message.

POST /create-character: Create a new character.

Request Body:
```json
{
  "firstName": "string",
  "lastName": "string",
  "age": 0,
  "hobbies": "string",
  "superpower": "string",
  "passion": "string"
}
```
GET /character-list: Retrieve all characters.

GET /character/
: Retrieve a character by ID.

GET /characters-by-superpower/
: Retrieve characters by superpower.

PUT /update-character/
: Update a character by ID.

Request Body (optional fields)
```json
{
  "firstName": "string",
  "lastName": "string",
  "age": 0,
  "hobbies": "string",
  "superpower": "string",
  "passion": "string"
}
```
DELETE /delete-character/
: Delete a character by ID.

## Running the API

Starting the server with the command
```bash
node spooky.js
``
OR if can make sure that d spooky.js in the start line in the package-json
```bash
npm start
```
Thee API will be available at `http://localhost:3000.`

Testing with Postman

Download and Install Postman.

Create a New Request:

Open Postman and create a new request by clicking on the "New" button.
Select "Request".
Set Up the Request:

Choose the HTTP method (GET, POST, PUT, DELETE) depending on the endpoint you want to test.
Enter the API endpoint URL (e.g., http://localhost:3000/create-character for POST).
If you're sending a POST or PUT request, navigate to the Body tab and select "raw". 
Choose JSON as the format and enter the JSON payload.
Send the Request: Click the "Send" button to execute the request and view the response.

View Responses: You will see the API response, including the status code and response body, in the lower section of Postman.


## Contributing
Contributions are welcome! Please create a pull request for any enhancements or fixes.

## License
This project is licensed under the MIT License.

 

## Notes
```
- **Environment Variables Section**: It explains how to set up the `.env` file and highlights the importance of adding it to the `.gitignore`.
- **API Endpoints Section**: Provides an overview of each endpoint and their expected inputs/outputs, making it easier for users to understand how to interact with the API.
- **Running the API Section**: Clear instructions on how to start the server.

HAPPY HALLOWEEEN!

API is open to modifications to meet your project requirements! For further assistance, reach out to averescu.ana@gmail.com
```
  

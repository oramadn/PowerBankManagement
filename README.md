# README

## Power Bank Management API
A Rails-based API for managing power banks, allowing administrators to oversee locations, users, and stations, warehouses and power banks. And allow users to reserve power banks on the go!

## Installation
The project is containerized in a Docker container, making it easy to setup and much prefreable than manually setting up the enviroment.

### Prerequisites
- Docker
- Docker Compose
- Ruby (if running locally without Docker)
- Rails (if running locally without Docker)
- PostgreSQL (if running locally without Docker)

### Running on FlyIO:
Access the live deployment of the app here
https://powerbankmanagementapi.fly.dev

P.S. It can take a bit to load it the first time

### Running Locally with Docker
1. Clone the repository:
```
git clone https://github.com/oramadn/PowerBankManagementAPI.git
cd PowerBankManagementAPI
```
2. Create a .env file in the project root with the following content (make sure that it matches your postgres username and password):
```
DATABASE_HOST=db
DATABASE_USER=postgres
DATABASE_PASSWORD=password
DATABASE_NAME=power_bank_management_api_development
```
3. Build Docker containers:
```
docker-compose build
```
4. Start the application
```
docker-compose up
```

### Usage
When building and running the docker image, `bin/docker-entrypoint` prepares the databases as well as provide sample data which was defined under `test/fixtures`. Feel free to add new entries there or manually through interacting with the application

There are two main users within this application
1. Admins
2. Users

- Admins have the ability to perform all of the CRUD methods on stations, power banks, warehouses, locations and users (currently admins cannot edit users due to a bug).
- Users can view locations and stations. A user can access a station and see if there are any avaliable power banks that can be reserved. A user can then chose to reserve and unreserve a power bank. Currently there is no limit to how many power banks a user can reserve.

### Testing
Many test units were implemented, and there is many more that can be implemented (especially regarding foriegn key relations).

To run the tests that are currently implemented, use the following command:
```
rails test
```

### Deployment
Fly.io was used to deply due to how quick and easy it is to deploy a simple application
In order to deploy your own model on Linux, follow these steps after making an account:

1. Download Fly.io CLI
```
curl -L https://fly.io/install.sh | sh
```
2. Configure the bash terminal to accomdate FLY
```
sudo nano ~/.bashrc
```
Go all the way down and add those two lines:
```
export FLYCTL_INSTALL="/home/{your_user_name}/. fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
```
Save it then run:
```
source ~/.bashrc
```
3. Navigate to the `PowerBankManagementAPI` root folder
4. Launch the app
```
fly launch
```
Once its done. run:
```
fly deploy
```

### You are done!

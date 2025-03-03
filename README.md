## How to use

Please make a directory with your back, front and this docker.

A makefile is provided to make it easier to run the project. Please run `make` to see the available commands.

1. Run `cp .env.dist .env` to create the .env file.
2. Fill the required fields in the .env file.
3. Run `make up` to install and start services.

Now, you can access the following URLs in your browser :

- Frontend : http://localhost:5173/
- Backend : http://localhost:5119/swagger/index.html
- PgAdmin : http://localhost:8888

## Available commands

| Command    | Description                                    |
|------------|------------------------------------------------|
| `up`       | Build and start Docker containers.             |
| `do`       | Stop and Remove all containers and networks.   |
| `exfront`  | Enter the frontend container with normal user. |
| `exback`   | Enter the backend container with normal user.  |
| `exaback`  | Enter the backend container with root user.    |
| `exafront` | Enter the frontend container with root user.   |
| `stop`     | Stop only services.                            |
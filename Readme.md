# Project Catalogos

This project uses Docker Compose to manage the application's services.

## Prerequisites

- Docker
- Docker Compose
- Terraform

## Getting Started

1. Clone the repository:

    ```sh
    git clone https://github.com/chaqui/catalogos.git
    cd catalogos
    ```

2. Build and start the services:

    ```sh
    docker-compose up --build
    ```

3. Access the application:

    Open your browser and navigate to `http://localhost:3000`.

## Stopping the Services

To stop the services, run:

```sh
docker-compose down
```

## Additional Commands

- To rebuild the services without starting them:

    ```sh
    docker-compose build
    ```

- To start the services in the background:

    ```sh
    docker-compose up -d
    ```

## Troubleshooting

If you encounter any issues, check the logs with:

```sh
docker-compose logs
```

For more detailed information, refer to the [Docker Compose documentation](https://docs.docker.com/compose/).

## Using Terraform
1. Install Terraform
2. Go to the terraform folder
    ```sh
    cd terraform
    ```
3. Run the following commands
    ```sh
    terraform init
    terraform apply
    ```
4. To destroy the infrastructure run
    ```sh
    terraform destroy
    ```
5. To see the output of the terraform run
    ```sh
    terraform output
    ```

## Plugins VSCode
 - Jest
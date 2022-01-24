# Drone ECR Puller

Drone ECR Puller allows your drone to:

1. Login to ECR with you own credentials
2. Pull your private image from ECR

## Test

```bash
docker run --rm -e AWS_ACCESS_KEY=$YOUR_AWS_ACCESS_KEY -e AWS_SECRET_KEY=$YOUR_AWS_SECRET_KEY -e AWS_ECR_REGISTRY=$AWS_ECR_REGISTRY gn-ecr-puller
```

## Expected Output

```plaintext
aws-cli/1.22.32 Python/3.8.10 Linux/5.10.25-linuxkit botocore/1.23.32
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

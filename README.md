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

## Example Drone stage

```yaml
kind: pipeline
type: docker
name: pipe1
steps:
- name: pull_my_private_image_from_ecr
    image: harryuan65/drone-ecr-puller # well, this is public on my repo
    environment:
      AWS_ACCESS_KEY:
        from_secret: aws_access_key
      AWS_SECRET_KEY:
        from_secret: aws_secret_key
      AWS_ECR_REGISTRY:
        from_secret: aws_ecr_registry
      AWS_REGION:
        from_secret: aws_region
    volumes:
      - name: docker
        path: /var/run/docker.sock
    commands:
      - aws configure set aws_access_key_id $AWS_ACCESS_KEY --profile default
      - aws configure set aws_secret_access_key $AWS_SECRET_KEY --profile default
      - aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ECR_REGISTRY
      - docker pull 41666888123123.dkr.ecr.MY_REGION.amazonaws.com/MY_PRECIOUS_PRIVATE_IMAGE:latest
```

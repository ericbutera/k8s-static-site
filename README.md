# Static Site

A template for hosting a static website on kubernetes.

## CI

Github Actions has a workflow to build & publish the image when using a semvar tag.

```sh
git tag v0.0.1
git push origin v0.0.1
```

## Container Image

It's possible to build and publish the image from your dev machine.

```sh
make help # shows all commands
make image-build
make image-push
```

## Deploy

```sh
kubectl apply -f kubernetes/homepage.yml
```

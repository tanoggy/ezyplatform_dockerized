# Build EzyPlatform Image

## Build Image with Mysql And EzyPlatform Server
Replace EZ_VERSION with version core
```
docker build -t ezplatform:0.0.4 --build-arg="EZ_VERSION=0.0.4" .
```
For linux/arm64
```
docker build -t ezplatform:0.0.4 --build-arg="EZ_VERSION=0.0.4" --platform linux/arm64 .
```

For linux/amd64
```
docker build -t ezplatform:0.0.4 --build-arg="EZ_VERSION=0.0.4" --platform linux/amd64 .
```
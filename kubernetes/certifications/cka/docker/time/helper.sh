docker build -t my-image:latest .
docker tag my-image:latest localhost:5001/my-image:latest
docker push localhost:5001/my-image:latest

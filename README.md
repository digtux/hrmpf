[![Build Status](https://ci.digtux.com/api/badges/digtux/hrmpf/status.svg)](https://ci.digtux.com/digtux/hrmpf)






# building void ISO in docker

**this is very alpha**

`docker run --privileged=true -v ./out:/out -it digtux/hrmpf-install:master-ee9e4d9a  ./mkhrmpf.sh`

## high level
There are three Dockerfiles currently

* `.base` to make a really simple one with bash basically
* `.mklive` uses base to install the mklive deps (like squasfs, e2fsprogs etc)
* `.install` to **WIP** to download all the packages we will install finally with `mkhrmpf.sh`


## local reproduce

```
docker build -f ./Dockerfile.base    . -t base
docker build -f ./Dockerfile.mklive  . -t mklive
docker build -f ./Dockerfile.install . -t install
# make a dir to store the produced ISO image
mkdir out
docker run --privileged=true -v `pwd -P`/out:/out -it install ./mkhrmpf.sh
```

in theory u don't need any other image than base (or upstream `voidlinux/voidlinux`)
....they're just there for a little cache and building in the cloud ATM



## workflow

To test an ISO:
1. make a pretend disk locally with slightly more than 15GB disk:
`qemu-img create -f qcow2 disk.img 16G`

2. test the bootcd
`qemu-kvm -cdrom out/something.iso -smp 2 -cpu host -drive format=qcow2,file=disk.img -m 4G`


## quickly updating contents on CD

1. docker build the `install` image to ensure all deps are in a container locally called `install`
`docker build -f ./Dockerfile.install . -t install`
2. copy the contents of this repo into an image called `final`
`docker build -f ./Dockerfile.install . -t install`
3. create a new ISO using the `final` docker image (this takes about 3minutes)
`docker run --privileged=true -v `pwd -P`/out:/out -it final ./mkhrmpf.sh`

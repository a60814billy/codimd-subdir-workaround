# The workaround for CodiMD sub-directory deployment

## System Required
1. docker, docker-compose
1. make
1. cfssl, cfssljson (for certificates)
    - https://github.com/cloudflare/cfssl

## Getting started

1. using `make all` to run
2. setup your Host file (`/etc/hosts`), point `md.example.com` to your local ip address. 
3. open your browser and navigate to `https://md.example.com/internal-codimd/` (you need trust self-signed certificate)
4. using `make clean` to shutdown server
```
$ make all
bash-3.2$ make
pushd http-server/certs && ./generate-certificates.sh && popd
~/Documents/codimd-subdir-example/http-server/certs ~/Documents/codimd-subdir-example
2020/03/06 03:13:52 [INFO] generating a new CA key and certificate from CSR
2020/03/06 03:13:52 [INFO] generate received request
2020/03/06 03:13:52 [INFO] received CSR
2020/03/06 03:13:52 [INFO] generating key: rsa-2048
2020/03/06 03:13:52 [INFO] encoded CSR
2020/03/06 03:13:52 [INFO] signed certificate with serial number 662722695892895962662195820883932391808113856795
2020/03/06 03:13:52 [INFO] generate received request
2020/03/06 03:13:52 [INFO] received CSR
2020/03/06 03:13:52 [INFO] generating key: rsa-2048
2020/03/06 03:13:52 [INFO] encoded CSR
2020/03/06 03:13:52 [INFO] signed certificate with serial number 631411392008811284619658750991155732828317800254
~/Documents/codimd-subdir-example
docker-compose build
database uses an image, skipping
codimd uses an image, skipping
Building webserver
Step 1/3 : FROM httpd:2.4.41
 ---> c5a012f9cf45
Step 2/3 : ADD ./certs /usr/local/apache2/certs
 ---> 2056cc05038b
Step 3/3 : ADD ./httpd.conf /usr/local/apache2/conf/httpd.conf
 ---> c5c0cd9ca94b
Successfully built c5c0cd9ca94b
Successfully tagged codimd-subdir-example_webserver:latest
docker-compose up -d
Creating network "codimd-subdir-example_default" with the default driver
Creating volume "codimd-subdir-example_database-data" with default driver
Creating volume "codimd-subdir-example_upload-data" with default driver
Creating codimd-subdir-example_webserver_1 ... done
Creating codimd-subdir-example_database_1  ... done
Creating codimd-subdir-example_codimd_1    ... done
```

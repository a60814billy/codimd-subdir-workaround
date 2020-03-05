#!/bin/bash

cfssl gencert -initca ca.csr.json | cfssljson -bare ./ca/ca
cfssl gencert -ca ./ca/ca.pem -ca-key ./ca/ca-key.pem -config ./config.json -profile www ./md.example.com.csr.json | cfssljson -bare ./md.example.com/cert

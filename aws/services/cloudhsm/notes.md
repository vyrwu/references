# CloudHSM

CloudHSM provides HSMs in AWS Cloud. HSM is a computing device that processes cryptographic operations and provides secure storage for cryptographic keys. 

Allows to deploy HSMs on EC2s in a private subnet, and then connect and perform operations on it. Useful when full control over HSMs is required, and cannot be ofset by a managed service (AWS KMS).

Requires to implement the API for using the keys and performing cryptographic operations by applications.

openssl genrsa -out user.pem
openssl req -new -key user.pem -out user.csr -subj "/CN=frontend-guy"
cat user.csr | base64
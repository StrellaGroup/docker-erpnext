# docker-erpnext
Docker Image for erpnext running on Ubuntu Wily

# Getting started
make build && make start && make ssh

## ERPNext Docker Image
## run data container
`docker create -v /home/frappe/frappe-bench/sites/site1.local/ -v /var/lib/mysql --name erpdata raman/erpnext
`
## run erpnext
`docker run -d -p 80:80 --name erpnext --volumes-from erpdata raman/erpnext
`
## get passwords
`docker exec -ti erpnext cat /root/frappe_passwords.txt
`
Login on http://localhost with Administrator / password


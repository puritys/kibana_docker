
esID=a7f746332abe
# elasticsearch a7f746332abe
#docker run -d  -p 9200:9200 -p 9300:9300  --name es $esID /bin/bash 
docker run -d  -p 9200:9200 -p 9300:9300  -p 8002:80 -v ~/logs:/logs -v ~/data:/data --name es 7c67291b2741

./elasticsearch/bin/elasticsearch&

# apache 17f5270b2d3a

# docker rm apache
# docker run -d -p 80:80 --name apache 17f5270b2d3a -v ~/logs:/var/log/httpd/
# docker exec -d apache /usr/sbin/httpd -f /etc/httpd/conf/httpd.conf

#ssh -vvv -N -L 192.168.0.6:8001:192.168.99.100:80  puritys@localhost

#  /usr/sbin/httpd -f /etc/httpd/conf/httpd.conf &
#-v ~/logs:/var/log/apache2


FROM httpd:2.4
# where from on my machine and where to on the computer
COPY ./html/ /usr/local/apache2/htdocs/
